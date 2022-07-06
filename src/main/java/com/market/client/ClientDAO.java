package com.market.client;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(ClientDTO dto) throws Exception{
		session.insert("clientMapper.insert",dto);
	}
	public List<ClientDTO> selectAll() throws Exception{
		return session.selectList("clientMapper.selectAll");
	}
	
	public List<ClientDTO> search(String category) throws Exception{
		return session.selectList("clientMapper.search",category);
	}
	
	public List<ClientDTO> selectAllP(int start,int end) throws Exception{
		return session.selectList("clientMapper.selectAllP");
	}
	
	public HashMap<String,Object> getPageNavi(int curPage,String category) throws Exception{

		int totalCnt = session.selectOne("clientMapper.getPageNavi",category);
		int recordCntPerPage=10; //한페이지에 몇개의 데이터(게시글)을 띄워줄지
		int naviCntPerPage=5; //네비바에 몇개 단위로 페이징을 구성할지
		int pageTotalCnt =0;// 총 몇 페이지가 나올지
		if(totalCnt % recordCntPerPage >0) {//나머지가 생김(10의 배수가 아님x)
			pageTotalCnt =totalCnt/recordCntPerPage +1;
		}else {
			pageTotalCnt =totalCnt/ recordCntPerPage;
		}
		if(curPage<1) {//현재 페이지가 0이거나 혹은 음수일때
			curPage=1;//무조건 첫페이지로 맞춰주기			
		}else if(curPage>pageTotalCnt) {
		}
		int startNavi =((curPage-1)/naviCntPerPage)*naviCntPerPage+1;
		int endNavi =startNavi + naviCntPerPage -1;		
		//endNavi가 전체페이지를 넘어갈 수 없음
		if(pageTotalCnt < endNavi) {//endNavi가 전체 페이지 수보다 크다면
			endNavi =pageTotalCnt; //endNavi를 마지막 페이지로 수정해주겠다.							
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
	
	
	public HashMap<String,Object> getPageNaviC(int curPage,String category) throws Exception{

			int totalCnt = session.selectOne("clientMapper.getPageNaviC",category);
			int recordCntPerPage=10; //한페이지에 몇개의 데이터(게시글)을 띄워줄지
			int naviCntPerPage=5; //네비바에 몇개 단위로 페이징을 구성할지
			int pageTotalCnt =0;// 총 몇 페이지가 나올지
			if(totalCnt % recordCntPerPage >0) {//나머지가 생김(10의 배수가 아님x)
				pageTotalCnt =totalCnt/recordCntPerPage +1;
			}else {
				pageTotalCnt =totalCnt/ recordCntPerPage;
			}
			if(curPage<1) {//현재 페이지가 0이거나 혹은 음수일때
				curPage=1;//무조건 첫페이지로 맞춰주기			
			}else if(curPage>pageTotalCnt) {
			}
			int startNavi =((curPage-1)/naviCntPerPage)*naviCntPerPage+1;
			int endNavi =startNavi + naviCntPerPage -1;		
			//endNavi가 전체페이지를 넘어갈 수 없음
			if(pageTotalCnt < endNavi) {//endNavi가 전체 페이지 수보다 크다면
				endNavi =pageTotalCnt; //endNavi를 마지막 페이지로 수정해주겠다.							
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
