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
	
	@RequestMapping(value="/black")//블랙설정시
	@ResponseBody
	public String black(@RequestParam(value="arr[]") String[] arr,String blackList_content) throws Exception{ 	//manager에서 체크박스 선택 삭제
	
	 for(String user_id : arr) { 
		 service.insert(new BlackListDTO(0,null,blackList_content,user_id,"abc"));//블랙리스트 추가 
		 service.black(user_id);//멤버 블랙 true설정
		 }	
		return "success";
	}
	
	@RequestMapping(value="/unBlack")//블랙해제시
	@ResponseBody
	public String unBlack(@RequestParam(value="arr[]") String[] arr) throws Exception{ 	//manager에서 체크박스 선택 삭제
	 for(String user_id : arr) {
		 service.delete(user_id);	//블랙리스트에서 삭제
		 service.unBlack(user_id); //멤버 블랙 false설정
		 }	
		return "success";
	}
	
	// 회원리스트 중에서 찾기
		@RequestMapping(value="/bSearch")
		@ResponseBody
		public List<BlackListDTO> bSearch(String user_id) throws Exception{
			List<BlackListDTO> list =service.bSearch(user_id);	
			return list;
		}
	
}
