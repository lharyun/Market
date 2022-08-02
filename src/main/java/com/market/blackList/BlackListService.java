package com.market.blackList;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.client.ClientDAO;
import com.market.member.MemberDTO;
import com.market.report.ReportDTO;

@Service
public class BlackListService {
	@Autowired
	private BlackListDAO blackListDAO;
	
	public void insert(BlackListDTO dto) throws Exception{ //블랙리스트 추가
		
		if(blackListDAO.checkBlack(dto.getUser_id())==1) {
			blackListDAO.updateBlack(dto);
		}else {
			blackListDAO.insert(dto);
		}
	}
	
	
	public void black(String user_id) throws Exception{	//멤버 블랙체크 설정
		//만약에 블랙리스트에 이미 있다면? 업데이트로 바꿔서 실행	
		blackListDAO.black(user_id);	
	}
	
	public void unBlack(String user_id) throws Exception{	//멤버 블랙체크 해제
		blackListDAO.unBlack(user_id);
	}
	
	public void delete(String user_id) throws Exception{	//블랙리스트 삭제
		blackListDAO.delete(user_id);
	}
	public List<BlackListDTO> selectAll(int start,int end) throws Exception{//블랙리스트 가져오기
		return blackListDAO.selectAll(start,end);		
	}
	
	public List<BlackListDTO> bSearch(String user_id) throws Exception{
		return blackListDAO.bSearch(user_id);		
	}
	
	public HashMap<String,Object> getPageNavi(int curPage) throws Exception{
		int totalCnt = blackListDAO.getPageNavi(); //전체 게시글의 개수
		int recordCntPerPage=10; //한페이지에 몇개의 데이터(게시글)을 띄워줄지
		int naviCntPerPage=5; //네비바에 몇개 단위로 페이징을 구성할지
		int pageTotalCnt =0;// 총 몇 페이지가 나올지			
		if(totalCnt % recordCntPerPage >0) {
			pageTotalCnt =totalCnt/recordCntPerPage +1;
		}else {
			pageTotalCnt =totalCnt/ recordCntPerPage;
		}				
		if(curPage<1) {
			curPage=1;		
		}else if(curPage>pageTotalCnt) {

		}						
		int startNavi =((curPage-1)/naviCntPerPage)*naviCntPerPage+1;
		int endNavi =startNavi + naviCntPerPage -1;
	
		if(pageTotalCnt < endNavi) {
			endNavi =pageTotalCnt; 							
		}		
		boolean needPrev = true;	
		boolean needNext = true;
		if(startNavi==1) {
			needPrev =false;			
		}
		if(endNavi ==pageTotalCnt) {
			needNext =false;
		}
		HashMap<String,Object> map =new HashMap<>();
		map.put("startNavi",startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);		
		return map;
				
	}
}
