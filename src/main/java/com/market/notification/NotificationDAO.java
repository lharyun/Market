package com.market.notification;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NotificationDAO {
	@Autowired
	private SqlSession session;
	//알림 저장
	public void insert(NotificationDTO dto)throws Exception{
		session.insert("notificationMapper.insert", dto);
	}
	
	//닉네임으로 selectAll
	public List<NotificationDTO> nicknameSelect(String user_nickname)throws Exception{
		return session.selectList("notificationMapper.nicknameSelect", user_nickname);
	}

	public int notifi_delete(int notification_seq) {
		return session.delete("notificationMapper.notifi_delete",notification_seq);
	}
}
