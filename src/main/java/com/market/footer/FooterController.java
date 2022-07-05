package com.market.footer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping(value = "/footer")
@Controller
public class FooterController {
	public FooterController() {
		System.out.println("FooterController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toTrust")
	public String toTrust() {
		return "footer/trust";
	}
	@RequestMapping(value = "/toCheapPay")
	public String toCheapPay() {
		return "footer/cheapPay";
	}
	@RequestMapping(value = "/toTeam")
	public String toTeam() {
		return "footer/team";
	}
	@RequestMapping(value = "/toTerms")
	public String toTerms() {
		return "footer/terms";
	}
	@RequestMapping(value = "/toPrivacy")
	public String toPrivacy() {
		return "footer/privacy";
	}
	@RequestMapping(value = "/toLocation")
	public String toLocation() {
		return "footer/location";
	}
	@RequestMapping(value = "/toPlanned")
	public String toPlanned() {
		return "footer/planned";
	}
}
