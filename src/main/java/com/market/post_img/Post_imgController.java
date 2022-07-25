package com.market.post_img;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


@RequestMapping(value = "/post_img_seq")
@Controller
public class Post_imgController {

	@Autowired
	private HttpSession session;

	public Post_imgController() {
		System.out.println("PostController 인스턴스 생성");
	}

	
}
