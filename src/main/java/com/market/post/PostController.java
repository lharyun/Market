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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.market.basket.BasketDTO;
import com.market.basket.BasketService;
import com.market.member.MemberDTO;
import com.market.member.MemberService;
import com.market.notification.NotificationService;


@RequestMapping(value = "/post")
@Controller
public class PostController {

	@Autowired
	private PostService service;
	@Autowired
	private BasketService basketService;
	@Autowired
	private NotificationService notifiService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HttpSession session;

	public PostController() {
		System.out.println("PostController 인스턴스 생성");
	}

	
	
	@RequestMapping(value = "/toPost")
	public String toPost(int curPage, Model model) throws Exception{
		System.out.println("curPage" + curPage);
		System.out.println("메인페이지 접속");
		
		//페이지 나누기
		//로그인세션 등록되면 post_addr 로 바꿔주기
		String post_addr1 = null;
		String search = null;
		HashMap<String,Object> map =service.getPageNavi(curPage,post_addr1,search);
		map.put("post_addr",post_addr1);
		map.put("search",search);
		model.addAttribute("naviMap",map);
		System.out.println("asd"+map);
		//post,img테이블 select*from
		List<Map<String, Object>> list = service.selectJoin(curPage*12-11,curPage*12);
		model.addAttribute("list", list);
		
		return "post/post";
	}
	
		//정확한검색 (카테고리, 지역)
		@RequestMapping(value = "/toSearch")
		public String toSearch(int curPage, String post_addr, String search, Model model) throws Exception{
			System.out.println(post_addr);
			System.out.println("curPage" + curPage);
			//페이지 나누기
			HashMap<String,Object> map =service.getPageNavi_s(curPage,post_addr,search);
			System.out.println("post_addr : " +post_addr);
			System.out.println("search : " +search);
			map.put("post_addr",post_addr);
			map.put("search",search);
			model.addAttribute("naviMap",map);
			System.out.println("asd"+map);
			
			//post,img테이블 select*from
			List<Map<String, Object>> list = service.search(curPage*12-11,curPage*12,post_addr,search);
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
		
		
		String user_id = dto.getUser_id();
		System.out.println(user_id);
		dto.setPost_addr(memberService.makeAddr(user_id));
		System.out.println(dto);
		
		String realPath = session.getServletContext().getRealPath("imgfiles");
		service.insert(dto, realPath, imgfiles);
		
		
		System.out.println(dto.toString());
		System.out.println("imgfiles : " + imgfiles);
		return "redirect:/post/toPost?curPage=1";
		}
	
	//게시글 수정
	@RequestMapping(value = "/modify")
	public String modify(PostDTO dto, MultipartFile[] imgfiles, 
			@RequestParam(value="deleteFileList[]", required=false) String[] deleteFileList) throws Exception{
		System.out.println("dto : " + dto);
		String realPath = session.getServletContext().getRealPath("imgfiles");
		service.modify(dto, realPath, imgfiles, deleteFileList);
		return "redirect:/post/toPostDetail?post_seq="+dto.getPost_seq();
	}
	
	
	//게시글 수정페이지 이동
		@RequestMapping(value = "/toPostModify")
		public String toPostModify(int post_seq, Model model) throws Exception{
			
			// 해당 번호의 이미지리스트와 게시글 정보 받아옴 
					Map<String, Object> map = service.selectPost_seq(post_seq);
					System.out.println( map.get("imgDTO"));
					System.out.println( map.get("postDTO") );
					model.addAttribute("map", map);
			
			return "post/postModify";
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
		List<Map<String, Object>> list = service.selectJoin(1,10);
		model.addAttribute("list", list);
		
		//해당 게시글 아이디 정보불러오기
		String p_user_id = ((PostDTO)map.get("postDTO")).getUser_id();
		System.out.println(p_user_id);
		MemberDTO memberDto = memberService.login(p_user_id);
		model.addAttribute("memberDto", memberDto);
		
		//해당게시글 찜목록에 로그인 아이디 있는지 확인
		if(session.getAttribute("loginSession") != null) {
			
			String user_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_id();
			BasketDTO basketDto = basketService.select_userBasket(user_id,post_seq);
			model.addAttribute("basketDto", basketDto);
		}
		return "post/postDetail";
	}
	
	//state 변경
	@RequestMapping(value = "/toPost_state")
	public String toPost_state(PostDTO dto) throws Exception{
		System.out.println(dto.getPost_state()+ dto.getPost_seq());
		service.toPost_state(dto);
		
		return "redirect:/post/toPostDetail?post_seq="+dto.getPost_seq();
	}
	
	// 게시글삭제
	@RequestMapping(value = "/postDelete")
	public String postDelete(int post_seq) throws Exception{
		service.postDelete(post_seq);
		
		return "redirect:/post/toPost?curPage=1";
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
