package com.market.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.member.MemberDTO;

@RequestMapping(value = "/review") // member 관련 모든 요청
@Controller
public class ReviewController {

	@Autowired 
	private ReviewService service;
	
	@RequestMapping(value= "/review")
	@ResponseBody
	public List<ReviewDTO> review(Model model,String user_id) throws Exception{
		System.out.println("review실행");
		
		int curPage=1;
		List<ReviewDTO> list =service.selectAll(curPage*10-9,curPage*10,user_id);
		System.out.println(list);
		return list;
	}
	
}