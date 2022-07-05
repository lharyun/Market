package com.market.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/client")
@Controller
public class ClientController {
	public ClientController() {
		System.out.println("ClientController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toClient_post")
	public String toClient_post() {
		return "client/client_post";
	}
}
