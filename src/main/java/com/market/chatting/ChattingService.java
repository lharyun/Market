package com.market.chatting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ChattingService {
	@Autowired
	private ChattingDAO dao;
//	
//	public void insert(ChattingDTO dto) throws Exception{
//		dao.insert(dto);
//	}
//	
//	public List<ChattingDTO> select() throws Exception{
//		return dao.select();
//	}
	//준철
	public void chat_insert(ChattingRoomDTO dto) throws Exception{
		dao.chat_insert(dto);
	}
	//중복체크
	public boolean overlapping(String userName, int post_seq) throws Exception{
		return dao.overlapping(userName,post_seq);
	}
}
