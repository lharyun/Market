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
	
	// 프로필 사진 수정
	public int modifyProfile(String user_id, String sys_name) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_profile", sys_name);
		return session.update("mypageMapper.modifyProfile", map);
	}
	
	// 내 정보 수정
	public int modifyInfo(MemberDTO dto) throws Exception {
		Map<String, String> map = new HashMap<>();
		
		map.put("user_nickname", dto.getUser_nickname());
		map.put("user_pw", dto.getUser_pw());
		map.put("user_phone", dto.getUser_phone());
		map.put("postcode", dto.getPostcode());
		map.put("roadAddr", dto.getRoadAddr());
		map.put("DetailAddr", dto.getDetailAddr());
		map.put("extraAddr", dto.getExtraAddr());
		map.put("user_id", dto.getUser_id());
		
		return session.update("mypageMapper.modifyInfo", dto);
	}
	
	// 비밀번호 변경
	public int changepw(MemberDTO dto) throws Exception {
		return session.update("mypageMapper.changepw", dto);
	}

}
