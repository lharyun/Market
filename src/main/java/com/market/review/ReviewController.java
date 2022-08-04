package com.market.review;

import java.util.HashMap;
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
	public String review(Model model,String reviewed_id,int curPage) throws Exception{
		System.out.println("review실행");	
		List<ReviewDTO> list =service.selectAll(curPage*10-9,curPage*10,reviewed_id);
		HashMap<String,Object> map =service.getPageNavi(curPage);
		model.addAttribute("list",list);
		model.addAttribute("naviMap",map);
		return "mypage/review";
	}
	
	@RequestMapping(value= "/review_write")
	public String review_write(ReviewDTO dto) throws Exception{
		System.out.println("write실행");
		System.out.println(dto.toString());
		 service.insert(dto);
		 /* 
		 * List<ReviewDTO> list =service.selectAll(curPage*10-9,curPage*10,user_id);
		 * model.addAttribute("list",list);
		 */
		return "";
	}
	
}
