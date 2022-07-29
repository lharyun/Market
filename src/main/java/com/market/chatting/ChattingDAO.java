package com.market.chatting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDAO{    
	@Autowired
	private SqlSession session;
    @Autowired
    SqlSessionTemplate sqlSession;
    
 
    public ChattingRoomDTO selectChatRoom(String roomId) {
        return sqlSession.selectOne("chattingMapper.selectChattingRoom", roomId);
    }
    
    public int insertMessage(ChattingMessageDTO chatMessage) {
        return sqlSession.insert("chattingMapper.insertMessage", chatMessage);
    }
    
    public List<ChattingMessageDTO> messageList(String roomId) {
        return sqlSession.selectList("chattingMapper.messageList", roomId);
    }
 
    public int createChat(ChattingRoomDTO room) {
        return sqlSession.insert("chattingMapper.createChatting", room);
    }
 
    public ChattingRoomDTO searchChatRoom(ChattingRoomDTO room) {
        return sqlSession.selectOne("chattingMapper.searchChattingRoom", room);
    }
 
    public List<ChattingRoomDTO> chatRoomList(String userEmail) {
        return sqlSession.selectList("chattingMapper.chattingRoomList", userEmail);
    }
 
    public int selectUnReadCount(ChattingMessageDTO message) {
        return sqlSession.selectOne("chattingMapper.selectUnReadCount",message);
    }
 
    public int updateCount(ChattingMessageDTO message) {
        return sqlSession.update("chattingMapper.updateCount", message);
    };
 
    //준철
    public void chat_insert(ChattingRoomDTO room) {
        sqlSession.insert("chattingMapper.chat_insert", room);
    }
    public boolean overlapping(String userName, int post_seq) throws Exception {
    	Map<String, Object> map = new HashMap<>();
		map.put("userName", userName);
		map.put("post_seq", post_seq);
    	return sqlSession.selectOne("chattingMapper.overlapping", map);
	}
}