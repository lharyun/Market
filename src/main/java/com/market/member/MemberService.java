package com.market.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.blackList.BlackListDAO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public List<MemberDTO> selectAll() throws Exception{
		return memberDAO.selectAll();
	}
	
	public void delete(String id) throws Exception{ 	//manager에서 체크박스 선택 삭제
		memberDAO.delete(id);
	}
}
