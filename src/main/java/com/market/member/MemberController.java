package com.market.member;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
=======
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
>>>>>>> 6e39111b28a56d31cefa4636d50b37721313aefc

import com.market.blackList.BlackListDTO;
import com.market.blackList.BlackListService;
import com.market.report.ReportDTO;
import com.market.report.ReportService;

@RequestMapping(value = "/member") // member 관련 모든 요청
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService mailService;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	@Autowired
	private BlackListService blackService;
	@Autowired
	private ReportService reportService;

	
	public MemberController() {
		System.out.println("MemberController 인스턴스 생성");
	}
<<<<<<< HEAD
 
=======
	

 
  
>>>>>>> 6e39111b28a56d31cefa4636d50b37721313aefc
  //용현
	/* 로그인 관련 */
	@RequestMapping(value = "/toLogin") //로그인 페이지 요청
	public String toLogin() {
		return "member/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login") // 로그인 요청 
	public String login(String user_id, String user_pw) throws Exception{
		System.out.println(user_id + " : " + user_pw);
	
		System.out.println("user_pw : " + user_pw);
		MemberDTO dto = service.login(user_id);
		boolean pwdMatch = pwdEncoder.matches(user_pw, dto.getUser_pw());
		
		System.out.println("pwdMatch : " + pwdMatch);
		if(dto != null && pwdMatch == true) {
			session.setAttribute("loginSession", dto);
			System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
			return "success";
		}
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkLogin") // 아이디 중복확인
	public String checkLogin(String user_id) throws Exception{
		// checkLogin이 false를 반환하면 사용가능 아이디
		if(!service.checkLogin(user_id)) return "available";
		// checkLogin이 true를 반환하면 중복 아이디
		else return "unavailable";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkNickname") // 닉네임 중복확인
	public String checkNickname(String user_nickname) throws Exception{
		// checkLogin이 false를 반환하면 사용가능 닉네임
		if(!service.checkNickname(user_nickname)) return "available";
		// checkLogin이 true를 반환하면 중복 닉네임
		else return "unavailable";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkPhone") // 휴대폰번호 중복확인
	public String checkPhone(String user_phone) throws Exception{
		// checkLogin이 false를 반환하면 사용가능 휴대폰번호
		if(!service.checkPhone(user_phone)) return "available";
		// checkLogin이 true를 반환하면 중복 휴대폰번호
		else return "unavailable";
	}
	
	@RequestMapping(value = "/toLogout") //로그아웃 요청
	public String logout() {
		session.removeAttribute("loginSession");
		return "redirect:/post/toPost?curPage=1";
	}
	
	/* 회원정보 찾기 관련 */
	@RequestMapping(value = "/tofindId") // 아이디찾기 페이지 요청
	public String tofindId() {
		return "member/findId";
	}
	
	@RequestMapping(value = "/findPage") // 아이디찾기 결과 페이지 요청
	public String findIdResult() {
		return "member/findIdResult";
	}
	
	@RequestMapping(value = "/findId") // 아이디 찾기 요청
	public String findId(String user_name, String user_phone, Model model) throws Exception{
		System.out.println("findId : " + user_name + user_phone);
		String rs = service.findId(user_name, user_phone);
		
		if(rs != null) {
			System.out.println("아이디 찾기 성공");
			model.addAttribute("rs", true);
			model.addAttribute("user_id", rs);
		} else {
			System.out.println("아이디 찾기 실패");
			model.addAttribute("rs", false);
		}
		return "member/findIdResult";
	}
	
	@RequestMapping(value = "/tofindPw") // 비밀번호찾기 페이지 요청
	public String tofindPw() {
		return "member/findPw";
	}
	
	@ResponseBody
	@RequestMapping("/noticeMail") // 이메일 발송 요청
	public String noticeMail(String user_id) throws Exception {
		
		String rs  = mailService.sendEmail(user_id);
		
		return rs;
	}
	
	@RequestMapping("/findPw") // 비밀번호 찾기 요청
	public String findPw(String user_id, String user_pw) throws Exception{
		
		String changePw = service.update_pw(user_pw);
		
		return changePw;
	}

	/* 회원가입 관련 */
	@RequestMapping(value = "/tosignUp2") // 회원가입2 페이지 요청
	public String tosignUp2() {
		return "member/signup2";
	}
	
	@RequestMapping(value = "signUp") // 회원가입 요청
	public String signUp(MemberDTO dto) throws Exception{

		String inputPass = dto.getUser_pw();
		String pwd = pwdEncoder.encode(inputPass);
		dto.setUser_pw(pwd);
		System.out.println("pwd : " + pwd);
		
		service.signup(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/todelete") // 회원탈퇴 페이지 요청
	public String todelete() {
		return "member/delete";
	}
	
	@RequestMapping(value = "delete") // 회원탈퇴 요청
	public String delete() throws Exception{
		service.delete(((MemberDTO)session.getAttribute("loginSession")).getUser_id());
		//session 에서 loginSession 지워주는 작업
		session.removeAttribute("loginSession");
		return "redirect:/post/toPost?curPage=1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkPw") // 회원탈퇴 아이디 & 비밀번호 확인
	public String checkPw(String user_id, String user_pw) throws Exception{
		System.out.println(user_id + " : " + user_pw);
		MemberDTO dto = service.checkPw(user_id, user_pw);
		
		boolean pwdMatch = pwdEncoder.matches(user_pw, dto.getUser_pw());
		System.out.println(pwdMatch);
		
		if(dto != null && pwdMatch == true) {
			return "success";
		}
		return "fail";
	}
	
	//카카오톡 로그인
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		String access_Token = service.getAccessToken(code);
		MemberDTO userInfo = service.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###user_name#### : " + userInfo.getUser_name());
		System.out.println("###user_id#### : " + userInfo.getUser_id());
	    
		// 아래 코드가 추가되는 내용
		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("kakaoN", userInfo.getUser_name());
		session.setAttribute("kakaoE", userInfo.getUser_id());
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
	    
	    // 리턴값은 용도에 맞게 변경하세요~
		return "";
	}
	
	 //하륜
	
		// 회원리스트 중에서 찾기
			@RequestMapping(value="/mSearch")
			@ResponseBody
			public List<MemberDTO> mSearch(String user_id) throws Exception{
				System.out.println(user_id);
				List<MemberDTO> list =service.mSearch(user_id);	
				return list;
			}
			
			//블랙리스트 pagination
			@RequestMapping(value="/toBlackPage")
			@ResponseBody
			public List<BlackListDTO> toBlackPage(int curPage) throws Exception{
				System.out.println(curPage);
				List<BlackListDTO> blackList=blackService.selectAll(curPage*10-9,curPage*10);	
				return blackList;
			}
			//멤버리스트 pagination
			@RequestMapping(value="/toMemberPage")
			@ResponseBody
			public List<MemberDTO> toMemberPage(int curPage) throws Exception{
				List<MemberDTO> list =service.selectAll(curPage*10-9,curPage*10);	
				return list;
			}
			
			//신고리스트 pagination
			@RequestMapping(value="/toReportPage")
			@ResponseBody
			public List<ReportDTO> toReportPage(int curPage) throws Exception{
				List<ReportDTO> reportList=reportService.selectAll(curPage*10-9,curPage*10);
				return reportList;
			}
			
		
			//관리자 페이지 이동
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
		@RequestMapping(value="/mn_delete")
		@ResponseBody
		public String delete(@RequestParam(value="arr[]") String[] arr) throws Exception{ 	
			System.out.println("mn_delete");
			System.out.println(arr);
			for(String id : arr) {
				service.mn_delete(id);	
			}
			
			return "success";
		}
	  
	
	/* 오류 관련 */
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
	
}
