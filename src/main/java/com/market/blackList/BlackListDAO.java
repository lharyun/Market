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
	
	
	
	
}
