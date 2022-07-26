package com.market.member;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	public MemberController() {
		System.out.println("MemberController 인스턴스 생성");
	}
	
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
		return "redirect:/post/toPost";
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
		return "redirect:/post/toPost";
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
	
}
