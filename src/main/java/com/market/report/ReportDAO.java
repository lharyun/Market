package com.market.report;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {
	@Autowired
	private SqlSession session;
	
	public List<ReportDTO> selectAll() throws Exception{
		return session.selectList("reportMapper.selectAll");
	}
	
	public void delete(String user_id) throws Exception{
		session.delete("reportMapper.delete",user_id);
	}
	
}
