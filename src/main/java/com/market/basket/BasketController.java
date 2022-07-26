package com.market.basket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/basket")
@Controller
public class BasketController {
	public BasketController() {
		System.out.println("BasketController 인스턴스 생성");
	}
	

}
