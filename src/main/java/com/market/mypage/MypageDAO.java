package com.market.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.member.MemberDTO;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSession session;
	
	// 마이페이지로 옮길것
	// 프로필 수정
	public int modifyProfile(MemberDTO dto) throws Exception{
		return session.update("memberMapper.modifyProfile", dto);
	}
	
	// 정보 수정
	public int modifyInfo(String user_id, String user_nickname, String user_pw, String user_phone, String postcode, String roadAddr, String detailAddr, String extraAddr) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_nickname", user_nickname);
		map.put("user_pw", user_pw);
		map.put("user_phone", user_phone);
		map.put("postcode", postcode);
		map.put("roadAddr", roadAddr);
		map.put("detailAddr", detailAddr);
		map.put("extraAddr", extraAddr);
		return session.update("memberMapper.modifyInfo", map);
	}

}
