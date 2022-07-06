package com.market.blackList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlackListDAO {
	@Autowired
	private SqlSession session;
}
