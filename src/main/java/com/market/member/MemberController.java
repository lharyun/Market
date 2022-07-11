package com.market.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	public MemberController() {
		System.out.println("MemberController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "member/login";
	}

}
