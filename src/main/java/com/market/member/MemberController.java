package com.market.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.blackList.BlackListDTO;
import com.market.blackList.BlackListService;
import com.market.report.ReportDTO;
import com.market.report.ReportService;
=======
>>>>>>> 25d71df902aac67d2dc3c4275018a227c490404d

@RequestMapping(value = "/member")
@Controller
public class MemberController {
<<<<<<< HEAD
	@Autowired
	private MemberService service;
	@Autowired
	private BlackListService blackService;
	@Autowired
	private ReportService reportService;
	
=======
>>>>>>> 25d71df902aac67d2dc3c4275018a227c490404d
	public MemberController() {
		System.out.println("MemberController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "member/login";
	}
<<<<<<< HEAD
	
	@RequestMapping(value="/toManager")
	public String MemberList(Model model) throws Exception {	//manager에서 회원 정보 가져올때
		
		List<BlackListDTO> blackList=blackService.selectAll();
		List<MemberDTO> list =service.selectAll();
		List<ReportDTO> reportList=reportService.selectAll();
		
		model.addAttribute("reportList",reportList);//신고리스트
		model.addAttribute("blackList", blackList);//블랙리스트
		model.addAttribute("list",list);//멤버 리스트
		
		return "manager/manager";
	}
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(@RequestParam(value="arr[]") String[] arr) throws Exception{ 	//manager에서 체크박스 선택 삭제
		System.out.println("delete");
		System.out.println(arr);
		for(String id : arr) {
			service.delete(id);	
		}
		
		return "success";
	}
	
	
=======
>>>>>>> 25d71df902aac67d2dc3c4275018a227c490404d

}
