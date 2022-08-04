package com.market.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value = "/review") // member 관련 모든 요청
@Controller
public class ReviewController {

	@Autowired 
	private ReviewService service;
	
	@RequestMapping(value= "/review")
	public String review(Model model,String reviewed_id,int curPage) throws Exception{
		System.out.println("review실행");	
		List<ReviewDTO> list =service.selectAll(curPage*10-9,curPage*10,reviewed_id);
		HashMap<String,Object> map =service.getPageNavi(curPage,reviewed_id);
		model.addAttribute("list",list);
		model.addAttribute("naviMap",map);
		model.addAttribute("reviewed_id",reviewed_id);
		return "mypage/review";
	}
	
	@RequestMapping(value= "/review_write")
	public String review_write(ReviewDTO dto) throws Exception{
		System.out.println("write실행");
		System.out.println(dto.toString());
		 service.insert(dto);
		String reviewed_id=dto.getReviewed_id();
		return "redirect:/review/review?curPage=1&&reviewed_id="+reviewed_id;
	}
	
	@RequestMapping(value="/review_modify")
	@ResponseBody
	public String review_modify(String review_comment,int review_seq) throws Exception{
		service.review_modify(review_comment,review_seq);
		return "success";
	}
	
	@RequestMapping(value="/review_delete")
	@ResponseBody
	public String review_delete(int review_seq) throws Exception{
		service.review_delete(review_seq);
		return "success";
	}
}
