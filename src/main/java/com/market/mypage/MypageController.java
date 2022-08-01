package com.market.mypage;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.market.member.MemberDTO;
import com.market.member.MemberService;

@RequestMapping(value = "/mypage")
@Controller
public class MypageController {
	@Autowired
	private MypageService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService mailService;
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	public MypageController() {
		System.out.println("MypageController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toMyStore") // 내 상점 페이지 요청
	public String toMyStore() {
		return "mypage/myStore";
	}
	
	@RequestMapping(value = "/toMypageModify") // 내 정보 수정 페이지 요청
	public String toMypageModify() {
		return "mypage/mypageModify";
	}
	
	@RequestMapping(value = "/tochangepw") // 비밀번호 변경 페이지 요청
	public String tochangepw(String user_id, String user_pw, Model model) {
		return "mypage/changepw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/changepw") // 비밀번호 변경 요청
	public String changepw(MemberDTO dto) throws Exception {
		
		System.out.println("비밀번호 변경 요청");
		
		service.changepw(dto);
		
		return "changeSuccess";
		
	}
	
	
	@RequestMapping(value = "/toBasket") // 찜목록 이동 페이지 요청
	public String toBasket() {
		return "mypage/basket";
	}
	
	// 프로필 사진 수정
	@ResponseBody
	@RequestMapping(value = "/modifyProfile")// 프로필 수정 요청
	public String modifyProfile(MultipartFile file) throws Exception{
		System.out.println("file : " + file);
		
		// 1. 서버의 profile 폴더에 새로운 프로필 사진을 업로드
		// 만약 사용자가 프로필사진을 변경하지 않았다면(업로드 X)
		// 새로운 프로필 사진을 업로드 X 
		if(!file.isEmpty()) { // 넘어온 파일이 있다면
			String realPath = session.getServletContext().getRealPath("user_profile");
			System.out.println("realpath :" + realPath);
			String user_id = ((MemberDTO)session.getAttribute("loginSession")).getUser_id();
			// 파일을 업로드하는 service 의 메서드를 호출하고 반환값으로 실제 저장된 파일명을 반환
			String profile_image = service.uploadProfile(file, realPath, user_id);
			// loginSession 안에 들어있는 dto의 profile_image 멤버필드 값을 새롭게 업로드된 파일명으로 변경
			((MemberDTO)session.getAttribute("loginSession")).setUser_profile(profile_image);
		}// 만약 사용자가 프로필 사진 수정을 안했다면(파일 업로드 X) == 원래의 값을 유지
		// loginSession에 DTO -> profile_image -> 사용자가 원래 가지고 있는 프로필사진의 이름값
		// 2. member테이블의 현재 프로필 수정중인 멤버의 데이터를 수정(프로필메세지,프로필사진)
		// update tbl_member set user_profile=? where user_id=?;
		int rs = service.modifyInfo((MemberDTO)session.getAttribute("loginSession"));
		
		System.out.println("dididi : " + (MemberDTO)session.getAttribute("loginSession"));
		
		if(rs > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/modifyInfo") // 내 정보 수정 요청	
	public String infoUpdate(MemberDTO dto, Model model)throws Exception{
		
		service.modifyInfo(dto); // 정보 수정
		MemberDTO newdto = (MemberDTO)session.getAttribute("loginSession");
		System.out.println("출력 dto: " + dto);
		
		newdto.setUser_nickname(dto.getUser_nickname());
		newdto.setUser_k(dto.getUser_category());
		newdto.setUser_k(dto.getUser_k());
		
		newdto.setUser_pw(dto.getUser_pw());
		
		newdto.setUser_phone(dto.getUser_phone());
		newdto.setPostcode(dto.getPostcode());
		newdto.setRoadAddr(dto.getRoadAddr());
		newdto.setDetailAddr(dto.getDetailAddr());
		newdto.setExtraAddr(dto.getExtraAddr());
		
		System.out.println("newdto: " + newdto);
		
		return"redirect:/";
	}
	
	/* 오류 관련 */
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}

}
