package com.market.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/mypage")
@Controller
public class MypageController {
	public MypageController() {
		System.out.println("MypageController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toMyStore")
	public String toMyStore() {
		return "mypage/myStore";
	}
	
	@RequestMapping(value = "/toMypageModify")
	public String toMypageModify() {
		return "mypage/mypageModify";
	}
	
	@RequestMapping(value = "/toBasket")
	public String toBasket() {
		return "mypage/basket";
	}

}
