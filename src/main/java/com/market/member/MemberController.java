package com.market.member;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
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
	private BlackListService blackService;
	@Autowired
	private ReportService reportService;

	
	public MemberController() {
		System.out.println("MemberController 인스턴스 생성");
	}
	
  //하륜
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
		
		if(dto != null && pwdMatch == true) {
			return "success";
		}
		return "fail";
	}
	
	// 마이페이지로 옮길 것
	@ResponseBody
	@RequestMapping(value = "/modifyProfile")// 프로필 사진 수정 요청
	public String modifyProfile(String user_profile, MultipartFile file) throws Exception{
		System.out.println("user_profile : " + user_profile);
		System.out.println("file : " + file);
		
		// 1. 서버의 profile 폴더에 새로운 프로필 사진을 업로드
		// 만약 사용자가 프로필사진을 변경하지 않았다면(업로드 X)
		// 새로운 프로필 사진을 업로드 X 
		if(!file.isEmpty()) { // 넘어온 파일이 있다면
			String realPath = session.getServletContext().getRealPath("profile");
			// 파일을 업로드하는 service 의 메서드를 호출하고 반환값으로 실제 저장된 파일명을 반환
			String user_profile1 = service.uploadProfile(file, realPath);
			// loginSession 안에 들어있는 dto의 user_profile 멤버필드 값을 새롭게 업로드된 파일명으로 변경
			((MemberDTO)session.getAttribute("loginSession")).setUser_profile(user_profile);
		}// 만약 사용자가 프로필 사진 수정을 안했다면(파일 업로드 X) == 원래의 값을 유지
		// loginSession에 DTO -> user_profile -> 사용자가 원래 가지고 있는 프로필사진의 이름값 
		
		
		// member테이블의 현재 프로필 수정중인 멤버의 데이터를 수정(프로필사진)
		// update tbl_member set user_profile=? where user_id=?;
		int rs = service.modifyProfile((MemberDTO)session.getAttribute("loginSession"));
		
		if(rs > 0) {
			return "success";
		}else {
			return "fail";
		}
	}	
	
	@ResponseBody
	@RequestMapping(value = "/modifyInfo") // 정보 수정 요청	
	public String modifyInfo(String user_nickname, String user_pw, String user_phone, String postcode, String roadAddr, String detailAddr, String extraAddr) throws Exception{
		System.out.println("수정할 내 정보 : " + user_nickname + user_pw + user_phone + postcode + roadAddr + detailAddr + extraAddr);
		
		int rs = service.modifyInfo(((MemberDTO)session.getAttribute("loginSession")).getUser_id(), user_nickname, user_pw, user_phone, postcode, roadAddr, detailAddr, extraAddr);
		if (rs > 0) {
			((MemberDTO)session.getAttribute("loginSession")).setUser_nickname(user_nickname);
			return "success";
		} else if (rs > 0) {
			((MemberDTO)session.getAttribute("loginSession")).setUser_pw(user_pw);
			return "success";
		} else if (rs > 0) {
			((MemberDTO)session.getAttribute("loginSession")).setUser_phone(user_phone);
			return "success";
		} else if (rs > 0) {
			((MemberDTO)session.getAttribute("loginSession")).setPostcode(postcode);
			return "success";
		} else if (rs > 0) {
			((MemberDTO)session.getAttribute("loginSession")).setRoadAddr(roadAddr);
			return "success";
		} else if (rs > 0) {
			((MemberDTO)session.getAttribute("loginSession")).setDetailAddr(detailAddr);
			return "success";
		} else if (rs > 0) {
			((MemberDTO)session.getAttribute("loginSession")).setExtraAddr(extraAddr);
			return "success";
		} 
		else return "fail";
	}
	
	/* 오류 관련 */
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
	
}
