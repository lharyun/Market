package com.market.notification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {
	@Autowired
	private NotificationDAO dao;
	
	//알림insert
	public void insert(NotificationDTO dto)throws Exception{
		dao.insert(dto);
	}
	//알림삭제
		public int notifi_delete(int notification_seq)throws Exception{
			return dao.notifi_delete(notification_seq);
		}
	
	//닉네임으로 selectAll
	public List<NotificationDTO> nicknameSelect(String user_nickname)throws Exception{
		return dao.nicknameSelect(user_nickname);
	}
}
