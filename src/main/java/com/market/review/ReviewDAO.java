package com.market.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.member.MemberDTO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSession session;

	public void review_modify(String review_comment,int review_seq) throws Exception{
		Map<String,Object> map = new HashMap<>();
		map.put("review_comment",review_comment);
		map.put("review_seq",review_seq);
		session.update("reviewMapper.reviewModify",map);
	}
	
	public void review_delete(int review_seq) throws Exception{
		session.delete("reviewMapper.reviewDelete",review_seq);
	}
	
	
	
	public List<ReviewDTO> selectAll(int start, int end, String reviewed_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("reviewed_id", reviewed_id);
		return session.selectList("reviewMapper.selectAll", map);
	}

	public int getPageNavi(String reviewed_id) throws Exception{
		return session.selectOne("reviewMapper.getPageNavi",reviewed_id);
	}
	
	public void insert(ReviewDTO dto) throws Exception {
		session.insert("reviewMapper.insert",dto);
	}
	//준철
	public int reviewCnt(String user_id) throws Exception {
		return session.selectOne("reviewMapper.reviewCnt",user_id);
	}
}
