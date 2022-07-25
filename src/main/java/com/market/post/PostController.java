package com.market.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.market.basket.BasketDTO;
import com.market.basket.BasketService;


@RequestMapping(value = "/post")
@Controller
public class PostController {

	@Autowired
	private PostService service;
	@Autowired
	private BasketService basketService;
	@Autowired
	private HttpSession session;

	public PostController() {
		System.out.println("PostController 인스턴스 생성");
	}

	@RequestMapping(value = "/toPost")
	public String toPost(Model model) throws Exception{
		System.out.println("메인페이지 접속");
		//임시 로그인세션
		String user_id = "asd123@naver.com";
		String user_category = "일반가입";
		String post_addr = "서울 마포구 망원동";
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_category", user_category);
		map.put("post_addr", post_addr);
		session.setAttribute("loginSession", map);
		
		//post,img테이블 select*from
		List<Map<String, Object>> list = service.selectJoin();
		model.addAttribute("list", list);
		
		return "post/post";
	}
	@RequestMapping(value = "/toPostWrite")
	public String toPostWrite() {
		System.out.println("글쓰기페이지 접속");
		return "post/postWrite";
	}
	
	@RequestMapping(value = "/toWrite")//판매등록
	public String toPostWrite(PostDTO dto, MultipartFile[] imgfiles) throws Exception{
		
//		나중에 로그인 세션으로 바꾸기
		dto.setPost_addr("서울 마포구 망원동");
		dto.setUser_id("asd123@naver.com");
		dto.setUser_category("일반가입");
		
		String realPath = session.getServletContext().getRealPath("imgfiles");
		service.insert(dto, realPath, imgfiles);
		
		
		System.out.println(dto.toString());
		System.out.println("imgfiles : " + imgfiles);
		return "redirect:/post/toPost";
		}
	
	//디테일페이지 접속했을때
	@RequestMapping(value = "/toPostDetail")
	public String toPostDetail(int post_seq, Model model) throws Exception{
		System.out.println("post_seq : "+post_seq);
		//조회수 업
		service.inquiry_cnt(post_seq);
		// 해당 번호의 이미지리스트와 게시글 정보 받아옴 
		Map<String, Object> map = service.selectPost_seq(post_seq);
		System.out.println( map.get("imgDTO"));
		System.out.println( map.get("postDTO") );
		model.addAttribute("map", map);
		
		//post,img테이블 select*from
		List<Map<String, Object>> list = service.selectJoin();
		model.addAttribute("list", list);
				
		//해당게시글 찜목록에 로그인 아이디 있는지 확인
		if(session.getAttribute("loginSession") != null) {
			String user_id = ((Map<String, String>) session.getAttribute("loginSession")).get("user_id");
			BasketDTO basketDto = basketService.select_userBasket(user_id,post_seq);
			model.addAttribute("basketDto", basketDto);
		}
		return "post/postDetail";
	}
	
	//빈하트 눌렀을때 관심 추가
	@RequestMapping(value = "/interestUp")
	@ResponseBody	
	public int interestUp(BasketDTO dto, Model model) throws Exception{
		System.out.println(dto);
		int post_seq = dto.getPost_seq(); 
		// 찜목록 등록
		int rs = basketService.basketInsert(dto);
		if(rs > 0) {
			int post_interest_cnt = basketService.interest_cnt(post_seq); //해당번호의 관심수 조회
			service.interestUpdate(post_interest_cnt, post_seq); // 관심수 업데이트
			return post_interest_cnt;
		}else {
			return -1;
		}
	}
	//꽉찬하트 눌렀을때 관심 삭제
		@RequestMapping(value = "/interestDown")
		@ResponseBody	
		public int interestDown(BasketDTO dto, Model model) throws Exception{
			System.out.println(dto);
			int post_seq = dto.getPost_seq(); 
			int rs = basketService.basketDelete(dto);
			if(rs > 0) {
				//판매게시글 관심수 업데이트
				int post_interest_cnt = basketService.interest_cnt(post_seq); //해당번호의 관심수 조회
				System.out.println(post_interest_cnt);
				service.interestUpdate(post_interest_cnt, post_seq);
				return post_interest_cnt;
			}else {
				return -1;
			}
		}
	
	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
}
