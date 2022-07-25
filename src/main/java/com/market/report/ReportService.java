package com.market.report;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	@Autowired
	private ReportDAO reportDAO;
	
	public List<ReportDTO> selectAll(int start,int end) throws Exception{
		return reportDAO.selectAll(start,end);
	}
	
	public void delete(int report_seq) throws Exception{
		reportDAO.delete(report_seq);
	}
	
	public List<ReportDTO> rSearch(String user_id) throws Exception{
		return reportDAO.rSearch(user_id);		
	}
	
	public void insert(ReportDTO dto) throws Exception{
		reportDAO.insert(dto);
	}
	public HashMap<String,Object> getPageNavi(int curPage) throws Exception{
		int totalCnt = reportDAO.getPageNavi(); //전체 게시글의 개수
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
