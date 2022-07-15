package com.market.member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.blackList.BlackListDTO;
import com.market.blackList.BlackListService;
import com.market.report.ReportDTO;
import com.market.report.ReportService;

@RequestMapping(value = "/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private BlackListService blackService;
	@Autowired
	private ReportService reportService;
	
	public MemberController() {
		System.out.println("MemberController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "member/login";
	}
	
// 회원리스트 중에서 찾기
	@RequestMapping(value="/mSearch")
	@ResponseBody
	public List<MemberDTO> mSearch(String user_id) throws Exception{
		System.out.println(user_id);
		List<MemberDTO> list =service.mSearch(user_id);	
		return list;
	}
	
//	블랙리스트 pagination
	@RequestMapping(value="/toBlackPage")
	@ResponseBody
	public List<BlackListDTO> toBlackPage(int curPage) throws Exception{
		System.out.println(curPage);
		List<BlackListDTO> blackList=blackService.selectAll(curPage*10-9,curPage*10);	
		return blackList;
	}
//	멤버리스트 pagination
	@RequestMapping(value="/toMemberPage")
	@ResponseBody
	public List<MemberDTO> toMemberPage(int curPage) throws Exception{
		List<MemberDTO> list =service.selectAll(curPage*10-9,curPage*10);	
		return list;
	}
	
//	신고리스트 pagination
	@RequestMapping(value="/toReportPage")
	@ResponseBody
	public List<ReportDTO> toReportPage(int curPage) throws Exception{
		List<ReportDTO> reportList=reportService.selectAll(curPage*10-9,curPage*10);
		
		return reportList;
	}
	
//	관리자 페이지 이동
	@RequestMapping(value="/toManager")
	public String MemberList(int curPage,Model model) throws Exception {	//manager에서 회원 정보 가져올때
		
		List<BlackListDTO> blackList=blackService.selectAll(curPage*10-9,curPage*10);
		List<MemberDTO> list =service.selectAll(curPage*10-9,curPage*10);
		List<ReportDTO> reportList=reportService.selectAll(curPage*10-9,curPage*10);
		
		HashMap<String,Object> map =service.getPageNavi(curPage);
		HashMap<String,Object> blackMap =blackService.getPageNavi(curPage);
		HashMap<String,Object> reportMap =reportService.getPageNavi(curPage);
		
		model.addAttribute("naviMap",map);
		model.addAttribute("blackNaviMap",blackMap);
		model.addAttribute("reportNaviMap",reportMap);
		
		model.addAttribute("reportList",reportList);//신고리스트
		model.addAttribute("blackList", blackList);//블랙리스트
		model.addAttribute("list",list);//멤버 리스트
		
		
		return "manager/manager2";
	}
	
	//manager에서 회원 체크박스 선택 삭제	
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(@RequestParam(value="arr[]") String[] arr) throws Exception{ 	
		System.out.println("delete");
		System.out.println(arr);
		for(String id : arr) {
			service.delete(id);	
		}
		
		return "success";
	}
	
	

}
