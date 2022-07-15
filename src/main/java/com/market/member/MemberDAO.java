package com.market.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.blackList.BlackListDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;

	public List<MemberDTO> selectAll(int start,int end) throws Exception{
		Map<String,Object> map= new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("memberMapper.selectAll",map);
	}
	
	public List<MemberDTO> mSearch(String user_id) throws Exception{
		return session.selectList("memberMapper.search",user_id);		
	}
	
	public void delete(String id) throws Exception{
		session.delete("memberMapper.delete",id);
	}

	public int getPageNavi() throws Exception{
		return session.selectOne("memberMapper.getPageNavi");
	}
}