package com.market.mypage;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.member.MemberDTO;

@Service
public class MypageService {
	@Autowired
	private MypageDAO dao;
	@Autowired
	private SqlSession session;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 마이페이지로 옮길 것
	public String uploadProfile(MultipartFile file, String realPath) throws Exception{
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		String sys_name = null;
		if(!file.isEmpty()) {
			String ori_name = file.getOriginalFilename();
			sys_name = UUID.randomUUID() + "_" + ori_name;
			file.transferTo(new File(realPath + File.separator + sys_name));
		}
		return sys_name;
	}
	
	// 프로필 사진 수정
	public int modifyProfile(MemberDTO dto) throws Exception{
		return dao.modifyProfile(dto);
	}
	
	// 내 정보 수정
	public int modifyInfo(String user_id, String user_nickname, String user_pw, String user_phone, String postcode, String roadAddr, String detailAddr, String extraAddr) throws Exception{
		return dao.modifyInfo(user_id, user_nickname, user_pw, user_phone, postcode, roadAddr, detailAddr, extraAddr);
	}

}
