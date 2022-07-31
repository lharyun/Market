package com.market.chatting;

import java.util.List;
import java.util.Map;

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
	//룸쪽
	public void chat_insert(ChattingRoomDTO dto) throws Exception{
		dao.chat_insert(dto);
	}
	//중복체크
	public boolean overlapping(String userName, int post_seq) throws Exception{
		return dao.overlapping(userName,post_seq);
	}
	// 프로파일,채팅룸 불러오기
	public List<Map<String,Object>> chat_mamberJoin(String masterName) throws Exception{ 
		return dao.chat_mamberJoin(masterName);
	}
	//메세지쪽
	public List<ChattingMessageDTO> chat_m_select(int roomId) throws Exception{
		return dao.chat_m_select(roomId);
		}
}
