package com.market.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping(value = "/post")
@Controller
public class PostController {
	public PostController() {
		System.out.println("PostController 인스턴스 생성");
	}

	@RequestMapping(value = "/toPost")
	public String toPost() {
		return "post/post";
	}
	@RequestMapping(value = "/toPostWrite")
	public String toPostWrite() {
		return "post/postWrite";
	}
	@RequestMapping(value = "/toPostDetail")
	public String toPostDetail() {
		return "post/postDetail";
	}
}
