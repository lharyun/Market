package com.market.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.blackList.BlackListDTO;
import com.market.member.MemberDTO;

@RequestMapping(value = "/report")
@Controller
public class ReportController {
	@Autowired
	private ReportService service;
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(@RequestParam(value="arr[]") int[] arr) throws Exception{

		
		 for(int report_seq : arr) { 
			 service.delete(report_seq);
			 }	
		 System.out.println("delete success");
			return "success";
		
	}
	
	@RequestMapping(value="/insert")
	@ResponseBody
	public void insert(ReportDTO dto) throws Exception{ 
		//로그인섹션으로 리포트한사람(user_id,user_category)
		//신고내역
		//신고받은사람 아이디(게시물을 통한 또는 직접신고를통한)
		//어떤게시물(게시물을 통한거면 게시물카테고리 댓글을통한거면 댓글카테고리 개인을통한거면(direct) 
		//시퀀스(게시물번호 또는 댓글번호 개인이면 0)
		
		service.insert(dto);
	}
	
	// 신고리스트 중에서 찾기
		@RequestMapping(value="/rSearch")
		@ResponseBody
		public List<ReportDTO> rSearch(String user_id) throws Exception{
			System.out.println(user_id);
			List<ReportDTO> list =service.rSearch(user_id);	
			return list;
		}
		
		
	
}
