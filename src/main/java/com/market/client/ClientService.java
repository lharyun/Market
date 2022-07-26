package com.market.client;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.file.FileDAO;

@Service
public class ClientService {
	@Autowired
	private ClientDAO clientDAO;
	
	public void delete(int client_seq) throws Exception{
		clientDAO.delete(client_seq);
	}
	
	public void modify(ClientDTO dto) throws Exception{
		clientDAO.modify(dto);
	}
	
	public ClientDTO selectBySeq(int client_seq) throws Exception{
		return clientDAO.selectBySeq(client_seq);
	}
	
	public void insert(ClientDTO dto) throws Exception{
		clientDAO.insert(dto);
	}
	public List<ClientDTO> selectAll() throws Exception{
		return clientDAO.selectAll();
	}
	public List<ClientDTO> search(String category) throws Exception{
		return clientDAO.search(category);
	}
	public List<ClientDTO> selectAllP(int start,int end) throws Exception{
		return clientDAO.selectAllP(start,end);
	}
	
	public HashMap<String,Object> getPageNavi(int curPage) throws Exception{
			int totalCnt = clientDAO.getPageNavi(); //전체 게시글의 개수
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