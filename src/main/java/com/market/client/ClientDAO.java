package com.market.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(ClientDTO dto) throws Exception{
		session.insert("clientMapper.insert",dto);
	}
	public List<ClientDTO> selectAll() throws Exception{
		return session.selectList("clientMapper.selectAll");
	}
	
	public List<ClientDTO> search(String category) throws Exception{
		return session.selectList("clientMapper.search",category);
	}
	
	public List<ClientDTO> selectAllP(int start,int end) throws Exception{
		Map<String,Object> map= new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("clientMapper.selectAllP",map);
	}
	
	public int getPageNavi() throws Exception{
		return session.selectOne("clientMapper.getPageNavi");
	}
	
}