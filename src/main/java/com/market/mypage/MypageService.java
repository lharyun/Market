package com.market.mypage;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.market.member.MemberDTO;

@Service
public class MypageService {
	@Autowired
	private MypageDAO dao;
	@Autowired
	private SqlSession session;
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	// 프로필 사진 수정
	public String uploadProfile(MultipartFile file, String realPath, String user_id) throws Exception{
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		String sys_name = null;
		if(!file.isEmpty()) {
			String ori_name = file.getOriginalFilename();
			sys_name = UUID.randomUUID() + "_" + ori_name;
			file.transferTo(new File(realPath + File.separator + sys_name));
			dao.modifyProfile(user_id, sys_name);
		}
		return sys_name;
	}
	
	// 내 정보 수정
	public int modifyInfo(MemberDTO dto) throws Exception{
		return dao.modifyInfo(dto);
	}
	
	// 비밀번호 변경
	public void changepw(MemberDTO dto) throws Exception {
		
		System.out.println("암호화 전 비밀번호 : " + dto.getUser_pw());
		
		String changed_pw = pwdEncoder.encode(dto.getUser_pw());
		dto.setUser_pw(changed_pw);
		
		System.out.println("암호화 후 비밀번호 : " + changed_pw);
		
		dao.changepw(dto);
		
	}

}
