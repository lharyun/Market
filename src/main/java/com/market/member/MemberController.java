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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.blackList.BlackListDTO;
import com.market.blackList.BlackListService;
import com.market.notification.NotificationDTO;
import com.market.notification.NotificationService;
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
	@Autowired
	private NotificationService notifiService;
	
	public MemberController() {
		System.out.println("MemberController 인스턴스 생성");
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
		System.out.println(dto);
		
		if(dto == null) { // dto가 null이라면 fail값 반환
			return "fail_1";
		} else { // dto가 null이 아니라면 정상적으로 코드 실행이 되야함
			
			boolean pwdMatch = pwdEncoder.matches(user_pw, dto.getUser_pw()); // 비밀번호 비교
			
			System.out.println("pwdMatch : " + pwdMatch);
			
			int bkdto = service.Checkbk(user_id); // 블랙리스트 해당하면 숫자 1
			
			System.out.println(bkdto);
			
			if(dto != null && pwdMatch == true && bkdto == 0) { // db에 id와 pw가 있고, 암호화 pw 비교가 맞고, 블랙리스트에 속하지 않은 경우(로그인 성공)
				List<NotificationDTO> notification = notifiService.nicknameSelect(dto.getUser_nickname());
				session.setAttribute("notification", notification);
				session.setAttribute("loginSession", dto);
				System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
				return "success";
			} else if(dto != null && pwdMatch == true && bkdto == 1) { // db에 id와 pw가 있고, 암호화 pw 비교가 맞고, 블랙리스트가 속한 경우
				return "fail_2";
			}
			return "fail_3";
		}
	}
	
	// 카카오 로그인 요청
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
    public String home(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
        System.out.println("##" + code);
        String access_Token = service.getAccessToken(code);
        HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
        
        String user_id = (String)userInfo.get("email");
        String user_nickname = (String)userInfo.get("nickname");
        String user_k = access_Token;
        
        boolean checkUser = service.checkLogin(user_id);
        MemberDTO dto = service.login(user_id);
         
        model.addAttribute("user_k", access_Token);
        model.addAttribute("user_id", user_id);
        model.addAttribute("user_nickname", user_nickname);
        
        System.out.println("user_k: " + user_k);
        
        System.out.println("##access_Token## : " + access_Token);
        System.out.println("##userInfo## : " + userInfo.get("email"));
        System.out.println("##nickname## : " + userInfo.get("nickname"));
        
		if(checkUser == true) { // 
			System.out.println("로그인 페이지로 이동 후, 세션 값 넣어주고 창 닫히기");
			session.setAttribute("loginSession", dto);
			System.out.println(((MemberDTO)session.getAttribute("loginSession")).toString());
			model.addAttribute("checkUser", true);
		} else {
			System.out.println("회원가입 페이지로 이동(kakaosignup.jsp)");
			model.addAttribute("checkUser", false);
		}
        
        return "member/login";
	}
	
	// 카카오 로그인 세션 유지
//	@RequestMapping(value="/kakaologindone")
//	public String login(@RequestParam("code") String code, HttpSession session) {
//		System.out.println("code: " + code);
//		
//		String access_token = service.getAccessToken(code);
//		System.out.println("access_token" + access_token);
//		
//		HashMap<String,Object> userInfo = service.getUserInfo(access_token);
//		
//		session.setAttribute("userId", userInfo.get("email"));
//		
//		System.out.println(userInfo);
//		
//		return "redirect:/";
//	}
	
	// 카카오 로그아웃
//	@RequestMapping(value="/kakaologout")
//	public String unlink(HttpSession session) {
//		String access_token = (String)session.getAttribute("access_token");
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("Authorization", "Bearer "+ access_token);
//		
//		String result = conn.HttpPostConnection("https://kapi.kakao.com/v1/user/logout", map).toString();
//		System.out.println(result);
//		return "redirect:/post/toPost?curPage=1";
//	}
	
	/* 회원가입 관련 */
	@RequestMapping(value = "/tosignUp") // 일반 회원가입 페이지 요청
	public String tosignUp() {
		return "member/signup";
	}
	
	@RequestMapping(value = "/tokakaosignUp") // 카카오 회원가입 페이지 요청
	public String tokakaosignUp(String user_id, String user_nickname, String user_k, Model model) {
		System.out.println(user_id);
		System.out.println(user_nickname);
		System.out.println(user_k);
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_k", user_k);
		return "member/kakaosignup";
	}
	
	@RequestMapping(value = "signUp") // 일반 회원가입 요청
	public String signUp(MemberDTO dto) throws Exception{

		String inputPass = dto.getUser_pw();
		String pwd = pwdEncoder.encode(inputPass);
		dto.setUser_pw(pwd);
		System.out.println("pwd : " + pwd);
		
		service.signup(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "kakaosignUp") // 카카오 회원가입 요청(추가 정보 입력)
	public String kakaosignUp(MemberDTO dto) throws Exception{
		
		String inputPass = dto.getUser_pw();
		String pwd = pwdEncoder.encode(inputPass);
		dto.setUser_pw(pwd);
		System.out.println("pwd : " + pwd);
		
		service.kakaosignup(dto);
		
		session.setAttribute("loginSession", dto);
		System.out.println("loginSession: " + ((MemberDTO)session.getAttribute("loginSession")).toString());
		
		return "redirect:/";
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
	
	@RequestMapping(value = "/todelete") // 회원탈퇴 페이지 요청
	public String todelete(Model model) {
		String user_k = ((MemberDTO)session.getAttribute("loginSession")).getUser_k();
		System.out.println("user_k1 :" + user_k);
		model.addAttribute("user_k", user_k);
		System.out.println("user_k2 :" + user_k);
		return "member/delete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkPw") // 회원탈퇴시 비밀번호 확인 + 회원 탈퇴 
	public String checkPw(String user_id, String user_pw) throws Exception{
		System.out.println(user_id + " : " + user_pw);
	
		System.out.println("user_pw : " + user_pw);
		MemberDTO dto = service.checkPw(user_id);
		boolean pwdMatch = pwdEncoder.matches(user_pw, dto.getUser_pw());
		
		System.out.println("pwdMatch : " + pwdMatch);
		if(dto != null && pwdMatch == true) {
			service.memberdelete(user_id);
			session.invalidate();
			return "success";
		}
		return "fail";
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
