package com.market.blackList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.member.MemberDTO;

@Repository
public class BlackListDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(BlackListDTO dto)throws Exception{//블랙시키기
		
		System.out.println("dao insert : "+dto);
		session.insert("blackListMapper.insert",dto);
	}
	
	public void black(String user_id) throws Exception{//member테이블의 black_check-> true
		session.update("blackListMapper.black",user_id);
	}
	
	public void unblack(String user_id) throws Exception{//member테이블의 black_check ->false
		session.update("blackListMapper.unblack",user_id);
	}
	
	public List<BlackListDTO> selectAll() throws Exception{
		System.out.println("블랙 dao실행");
	
		return session.selectList("blackListMapper.selectAll");
	}
	
	
}
