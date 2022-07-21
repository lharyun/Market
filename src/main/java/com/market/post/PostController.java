package com.market.post;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


@RequestMapping(value = "/post")
@Controller
public class PostController {

	@Autowired
	private PostService service;
	@Autowired
	private HttpSession session;

	public PostController() {
		System.out.println("PostController 인스턴스 생성");
	}

	@RequestMapping(value = "/toPost")
	public String toPost(Model model) throws Exception{
		System.out.println("메인페이지 접속");
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
	
	@RequestMapping(value = "/toPostDetail")
	public String toPostDetail(int post_seq, Model model) throws Exception{
		System.out.println("post_seq : "+post_seq);
		Map<String, Object> map = service.selectPost_seq(post_seq);
		System.out.println( map.get("imgDTO"));
		System.out.println( map.get("postDTO") );
		model.addAttribute("map", map);
		return "post/postDetail";
	}
	
	
	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
}
