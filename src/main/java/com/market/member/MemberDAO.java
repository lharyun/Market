package com.market.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;
	
	public List<MemberDTO> selectAll() throws Exception{
		return session.selectList("memberMapper.selectAll");
	}
	
	public void delete(String id) throws Exception{
		session.delete("memberMapper.delete",id);
	}
}
