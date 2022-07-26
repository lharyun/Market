package com.market.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.member.MemberDTO;

@Repository
public class ReportDAO {
	@Autowired
	private SqlSession session;
	
	public List<ReportDTO> selectAll(int start,int end) throws Exception{
		Map<String,Object> map= new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("reportMapper.selectAll",map);
	}
	public List<ReportDTO> rSearch(String user_id) throws Exception{
		return session.selectList("reportMapper.search",user_id);		
	}
	
	public void delete(int report_seq) throws Exception{
		session.delete("reportMapper.delete",report_seq);
	}
	
	public void insert(ReportDTO dto) throws Exception{
		session.insert("reportMapper.insert",dto);
	}
	public int getPageNavi() throws Exception{
		return session.selectOne("reportMapper.getPageNavi");
	}
}
