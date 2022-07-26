package com.market.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	public HomeController() {
		System.out.println("HomeController 인스턴스 생성");
	}
	@RequestMapping(value = "/")
	public String toPost() {
		return "redirect:/post/toPost?curPage=1";
	}
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
}
