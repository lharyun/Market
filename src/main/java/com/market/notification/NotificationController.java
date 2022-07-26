package com.market.notification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.post.PostService;


@RequestMapping(value = "/notification")
@Controller
public class NotificationController {
	@Autowired
	private NotificationService service;
	
	public NotificationController() {
		System.out.println("NotificationController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/notification_insert")
	public String insert(NotificationDTO dto) throws Exception{
		//나중에 로그인 세션으로 바꾸기
		dto.setUser_nickname("가짜닉네임");
		dto.setFrom_nickname("보내는닉네임");
		System.out.println(dto);
		service.insert(dto);
		return "redirect:/post/toPost?curPage=1";
	}
	@RequestMapping(value="/notifi_delete")
	@ResponseBody
	public String notifi_delete (int notification_seq) throws Exception{
		System.out.println(notification_seq);
		int rs = service.notifi_delete(notification_seq);
		if(rs>0) {
			return "success"; 
		}else {
			return "fail";
		}
		
	}
}
