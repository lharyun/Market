package com.market.member;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.blackList.BlackListDAO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;

	// 용현
	// 로그인 유효성 검사
	public MemberDTO login(String user_id) throws Exception {
		return session.selectOne("memberMapper.login", user_id);
	}
	
	// 회원탈퇴시 비밀번호 확인
	public MemberDTO checkPw(String user_id) throws Exception {
		return session.selectOne("memberMapper.checkPw", user_id);
	}
	
	// 회원탈퇴
	public int memberdelete(String user_id) throws Exception {
		return session.delete("memberMapper.memberdelete", user_id);
	}

	// 아이디 중복확인
	public boolean checkLogin(String user_id) throws Exception {
		return session.selectOne("memberMapper.checkLogin", user_id);
	}
	
	// 아이디 찾기
	public String findId(String user_name, String user_phone) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("user_name", user_name);
		map.put("user_phone", user_phone);
		return session.selectOne("memberMapper.findId", map);
	}
	
	// 비밀번호 찾기 + 임시 비밀번호로 변경
	public int update_pw(String user_id, String user_pw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		return session.update("memberMapper.update_pw", map);
	}

	// 회원가입
	public int insert(MemberDTO dto) throws Exception{
		return session.insert("memberMapper.insert", dto);
	}
	
	// 카카오 회원가입
	public int kakaoinsert(MemberDTO dto) throws Exception{
		return session.insert("memberMapper.kakaoinsert", dto);
	}
	
	// 닉네임 중복확인
	public boolean checkNickname(String user_nickname) throws Exception {
		return session.selectOne("memberMapper.checkNickname", user_nickname);
	}
	
	// 휴대폰번호 중복확인
	public boolean checkPhone(String user_phone) throws Exception {
		return session.selectOne("memberMapper.checkPhone", user_phone);
	}
	
	// 카카오

	//하륜
	public List<MemberDTO> selectAll(int start,int end) throws Exception{
		Map<String,Object> map= new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("memberMapper.selectAll",map);
		}
		
		public List<MemberDTO> mSearch(String user_id) throws Exception{
			return session.selectList("memberMapper.search",user_id);		
		}
		
		public void mn_delete(String id) throws Exception{
			session.delete("memberMapper.mn_delete",id);
		}

		public int getPageNavi() throws Exception{
			return session.selectOne("memberMapper.getPageNavi");
		}
		
		//준철
		public String makeAddr(String user_id)throws Exception{
			return session.selectOne("memberMapper.makeAddr",user_id);	
		}

}

