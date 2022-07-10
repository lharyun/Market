package com.market.blackList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.client.ClientDAO;
import com.market.member.MemberDTO;

@Service
public class BlackListService {
	@Autowired
	private BlackListDAO blackListDAO;
	
	public void insert(BlackListDTO dto) throws Exception{ //블랙리스트 추가
		System.out.println("insert실행");
		blackListDAO.insert(dto);
	}
	
	public void black(String user_id) throws Exception{	//멤버 블랙체크 설정
		blackListDAO.black(user_id);
	}
	
	public void unblack(String user_id) throws Exception{	//멤버 블랙체크 해제
		blackListDAO.unblack(user_id);
	}
	public List<BlackListDTO> selectAll() throws Exception{//블랙리스트 가져오기
		System.out.println("블랙 서비스 실행");
		return blackListDAO.selectAll();		
	}
	
}
