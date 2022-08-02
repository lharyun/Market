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
	
	public List<ReviewDTO> selectAll(int start,int end,String user_id) throws Exception{
		Map<String,Object> map= new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("user_id", user_id);
		return session.selectList("reviewMapper.selectAll",map);
		}
}
