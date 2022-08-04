package com.market.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.basket.BasketDTO;
import com.market.member.MemberDTO;
import com.market.post.PostDTO;

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
	
	// 평점 평균 구하기
	public float reviewAvg(String user_id) throws Exception {
		return session.selectOne("mypageMapper.reviewAvg", user_id);
	}
	
	// 내 게시글 수 세기
	public int countpost(String user_id) throws Exception {
		return session.selectOne("mypageMapper.countpost", user_id);
	}
	
	// 내 게시글 조회
	public List<PostDTO> searchmypost(String user_id) throws Exception{
		return session.selectList("mypageMapper.searchmypost", user_id);
	}
	
	// 내 찜 수 세기
	public int countbasket(String user_id) throws Exception {
		return session.selectOne("mypageMapper.countbasket", user_id);
	}
	
	// 내 찜 목록 조회
	public List<BasketDTO> searchmybasket(String user_id) throws Exception{
		return session.selectList("mypageMapper.searchmybasket", user_id);
	}
	
	//페이지 계산
	public int getPageNavi(String post_addr, String user_id) throws Exception{
		Map<String,Object> map= new HashMap<>();
		map.put("post_addr", post_addr);
		map.put("user_id", user_id);
		return session.selectOne("mypageMapper.getPageNavi", map);
	}
	
	// 조인된 테이블 데이터 조회(내 게시글)
	public List<Map<String,Object>> myselectJoin(String user_id, int start,int end) throws Exception{ 
		Map<String,Object> map= new HashMap<>();
		map.put("user_id", user_id);
		map.put("start", start);
		map.put("end", end);
		return session.selectList("mypageMapper.myselectJoin",map);
	}
	
	// 조인된 테이블 데이터 조회(찜 목록)
	public List<Map<String,Object>> myselectJoin2(String user_id, int start,int end) throws Exception{ 
		Map<String,Object> map= new HashMap<>();
		map.put("user_id", user_id);
		map.put("start", start);
		map.put("end", end);
		return session.selectList("mypageMapper.myselectJoin2",map);
	}

}
