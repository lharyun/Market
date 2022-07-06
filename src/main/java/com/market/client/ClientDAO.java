package com.market.client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

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
	
	
	
	
}
