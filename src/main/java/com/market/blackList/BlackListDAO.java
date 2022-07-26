package com.market.blackList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.client.ClientDTO;
import com.market.member.MemberDTO;

@Repository
public class BlackListDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(BlackListDTO dto)throws Exception{//블랙리스트에서 추가
		session.insert("blackListMapper.insert",dto);
	}
	
	public void black(String user_id) throws Exception{//member테이블의 black_check-> true
		session.update("blackListMapper.black",user_id);
	}
	public List<BlackListDTO> bSearch(String user_id) throws Exception{
		return session.selectList("blackListMapper.search",user_id);		
	}
	
	public void unBlack(String user_id) throws Exception{//member테이블의 black_check ->false
		session.update("blackListMapper.unblack",user_id);

	}
	public void delete(String user_id) throws Exception{	//블랙리스트에서 삭제
		session.delete("blackListMapper.delete",user_id);
	}
	
	public int getPageNavi() throws Exception{
		return session.selectOne("blackListMapper.getPageNavi");
	}
	
	public List<BlackListDTO> selectAll(int start,int end) throws Exception{	
		Map<String,Object> map= new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("blackListMapper.selectAll",map);
	}
	
}
