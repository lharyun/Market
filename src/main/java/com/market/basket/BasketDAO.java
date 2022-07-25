package com.market.basket;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.post.PostDTO;

@Repository
public class BasketDAO {
	@Autowired
	private SqlSession session;
	
	//판매페이지 관심목록 추가
	public int basketInsert(BasketDTO dto) throws Exception{ 
		return session.insert("basketMapper.basketInsert", dto);
	}
	
	//관심수 카운트
	public int interest_cnt(int post_seq) throws Exception{ 
		return session.selectOne("basketMapper.interest_cnt", post_seq);
	}
	//판매페이지 관심목록 삭제
	public int basketDelete(BasketDTO dto) throws Exception{ 
		return session.delete("basketMapper.basketDelete", dto);
	}
	
	public BasketDTO select_userBasket(String user_id, int post_seq) throws Exception{ 
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("post_seq", post_seq);
		return session.selectOne("basketMapper.select_userBasket", map);
	}
	
}
