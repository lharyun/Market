package com.market.blackList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.member.MemberDTO;

@RequestMapping(value = "/blackList")
@Controller
public class BlackListController {
	@Autowired
	private BlackListService service;
	@Autowired
	private HttpSession session;
	
	public BlackListController() {
		System.out.println("BlackList 인스턴스 생성");
	}
	
	@RequestMapping(value="/black")
	@ResponseBody
	public String black(@RequestParam(value="arr[]") String[] arr,String blackList_content) throws Exception{ 	//manager에서 체크박스 선택 삭제
		
		System.out.println("blackList content : " + blackList_content);
		System.out.println(arr);
		
	 for(String user_id : arr) { 
		 service.insert(new BlackListDTO(0,null,blackList_content,user_id,"abc")); 
		 service.black(user_id);
		 }
		
		
		return "success";
	}
	
	
}
