package com.market.chatting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping(value = "/chatting")
@Controller
public class ChattingController {
	public ChattingController() {
		System.out.println("ChattingController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toChatting")
	public String toChatting() {
		return "chatting/chatting";
	}
}
