package com.market.file;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	@Autowired
	private SqlSession session;
	// files 테이블의 모든 sys_name 가져오기
		public List<String> selectSys_name() throws Exception{
			return session.selectList("fileMapper.selectSys_name");
		}
		
		
}
