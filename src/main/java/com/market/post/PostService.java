package com.market.post;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.post_img.Post_imgDAO;
import com.market.post_img.Post_imgDTO;

@Service
public class PostService {
	@Autowired
	private PostDAO postDao;
	@Autowired
	private Post_imgDAO post_imgDao;
	
	
	
	//판매중 state업데이트
		public void toPost_state(PostDTO dto)throws Exception{
			postDao.toPost_state(dto);
		}
		
		
	//게시글 삭제
	public void postDelete(int post_seq)throws Exception{
		postDao.postDelete(post_seq);
	}
	
	// 관심수 업
	public void interestUpdate(int post_interest_cnt, int post_seq) throws Exception{ 
		postDao.interestUpdate(post_interest_cnt, post_seq);
	}
	
	// 조회수 업
	public void inquiry_cnt(int post_seq) throws Exception{ 
		postDao.inquiry_cnt(post_seq);
	}
	//채팅수 업데이트
	public void update_chatting_cnt(int post_seq, int post_chatting_cnt) throws Exception{
		postDao.update_chatting_cnt(post_seq, post_chatting_cnt);
	}
	
	//총데이터 수를 가져와 페이지 계산
		public HashMap<String,Object> getPageNavi(int curPage,String post_addr, String search) throws Exception{
			int totalCnt = postDao.getPageNavi(post_addr,search); //전체 게시글의 개수
			System.out.println(totalCnt);
			int recordCntPerPage=12; //한페이지에 몇개의 데이터(게시글)을 띄워줄지
			int naviCntPerPage=5; //네비바에 몇개 단위로 페이징을 구성할지
			int pageTotalCnt =0;// 총 몇 페이지가 나올지			
			if(totalCnt % recordCntPerPage >0) { // 나머지가 생김(10의 배수가 아님x)
				pageTotalCnt =totalCnt/recordCntPerPage +1; //45개-> 4.5+1
			}else {
				pageTotalCnt =totalCnt/ recordCntPerPage;
			}	
			/*
			 * 현재 페이지는 반드시 1 이상 현재 페이지는 총 페이지의 개수를 넘어갈 수 없음
			 */
			if(curPage<1) {// 현재 페이지가 0이거나 혹은 음수일때
				curPage=1; // 무조건 첫페이지로 맞춰주기		
			}else if(curPage>pageTotalCnt) {// 현재 페이지가 총 페이지 수보다 크다면
				curPage = pageTotalCnt; // 무조건 마지막 페이지로 맞춰주기
			}						
			int startNavi =((curPage-1)/naviCntPerPage)*naviCntPerPage+1;
			int endNavi =startNavi + naviCntPerPage -1;
		
			// endNavi가 전체페이지를 넘어갈 수 없음
			if(pageTotalCnt < endNavi) { //endNavi가 전체 페이지수보다 크다면
				endNavi =pageTotalCnt; 	 // endNavi를 마지막 페이지로 수정해주겠다						
			}		
			// < > 모양을 넣어줄지 여부에 대한 검사
			boolean needPrev = true;	// startNavi가 1일때 needPrev가 false
			boolean needNext = true;	// endNavi가 마지막 페이지(전체 페이지)와 같을때 needNext가 false
			if(startNavi==1) {
				needPrev =false;			
			}
			if(endNavi ==pageTotalCnt) {
				needNext =false;
			}
			// map -> key, value
						// 제네릭 <키에 대한 자료형, 값에 대한 자료형>
			HashMap<String,Object> map =new HashMap<String,Object>();
			map.put("startNavi",startNavi);
			map.put("endNavi", endNavi);
			map.put("needPrev", needPrev);
			map.put("needNext", needNext);	
			map.put("curPage", curPage);
			return map;
					
		}
		public HashMap<String,Object> getPageNavi_s(int curPage,String post_addr, String search) throws Exception{
			int totalCnt = postDao.getPageNavi_s(post_addr,search); //전체 게시글의 개수
			System.out.println("search"+totalCnt);
			int recordCntPerPage=12; //한페이지에 몇개의 데이터(게시글)을 띄워줄지
			int naviCntPerPage=5; //네비바에 몇개 단위로 페이징을 구성할지
			int pageTotalCnt =0;// 총 몇 페이지가 나올지			
			if(totalCnt % recordCntPerPage >0) { // 나머지가 생김(10의 배수가 아님x)
				pageTotalCnt =totalCnt/recordCntPerPage +1; //45개-> 4.5+1
			}else {
				pageTotalCnt =totalCnt/ recordCntPerPage;
			}	
			/*
			 * 현재 페이지는 반드시 1 이상 현재 페이지는 총 페이지의 개수를 넘어갈 수 없음
			 */
			if(curPage<1) {// 현재 페이지가 0이거나 혹은 음수일때
				curPage=1; // 무조건 첫페이지로 맞춰주기		
			}else if(curPage>pageTotalCnt) {// 현재 페이지가 총 페이지 수보다 크다면
				curPage = pageTotalCnt; // 무조건 마지막 페이지로 맞춰주기
			}						
			int startNavi =((curPage-1)/naviCntPerPage)*naviCntPerPage+1;
			int endNavi =startNavi + naviCntPerPage -1;
			
			// endNavi가 전체페이지를 넘어갈 수 없음
			if(pageTotalCnt < endNavi) { //endNavi가 전체 페이지수보다 크다면
				endNavi =pageTotalCnt; 	 // endNavi를 마지막 페이지로 수정해주겠다						
			}		
			// < > 모양을 넣어줄지 여부에 대한 검사
			boolean needPrev = true;	// startNavi가 1일때 needPrev가 false
			boolean needNext = true;	// endNavi가 마지막 페이지(전체 페이지)와 같을때 needNext가 false
			if(startNavi==1) {
				needPrev =false;			
			}
			if(endNavi ==pageTotalCnt) {
				needNext =false;
			}
			// map -> key, value
			// 제네릭 <키에 대한 자료형, 값에 대한 자료형>
			HashMap<String,Object> map =new HashMap<>();
			map.put("startNavi",startNavi);
			map.put("endNavi", endNavi);
			map.put("needPrev", needPrev);
			map.put("needNext", needNext);	
			map.put("curPage", curPage);
			return map;
			
		}
		
	// 조인된 테이블 데이터 조회
	public List<Map<String, Object>> selectJoin(int start,int end) throws Exception {
		return postDao.selectJoin(start,end);
	}
	// 데이터 검색
		public List<Map<String, Object>> search(int start,int end, String category,String search) throws Exception {
			return postDao.search(start,end, category,search);
		}

	public Map<String, Object> selectPost_seq(int post_seq) throws Exception{ //  게시글 조회
		// 다른 타입의 데이터를 반환하기 위해 map를 이용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imgDTO", post_imgDao.selectPost_seq(post_seq)); // 이미지 데이터 가져오기
		map.put("postDTO", postDao.selectPost_seq(post_seq)); // 판매 게시글 데이터 가져오기
		return map;
	}

	// 이미지와 게시글 저장
	public void insert(PostDTO dto, String realPath, MultipartFile[] imgfiles) throws Exception {
		// 다음번호 가져오기
		int post_seq = postDao.selectSeq();

		// 게시글 저장
		dto.setPost_seq(post_seq);
		postDao.insert(dto);

		// 이미지 저장
		File realPathFile = new File(realPath);
		if (!realPathFile.exists())
			realPathFile.mkdir();
		for (MultipartFile mf : imgfiles) {
			if (!mf.isEmpty()) { // 파일이 들어있다면
				String ori_name = mf.getOriginalFilename();
				String sys_name = UUID.randomUUID() + "_" + ori_name;

				mf.transferTo(new File(realPathFile + File.separator + sys_name));
				post_imgDao.insert(new Post_imgDTO(0, ori_name, sys_name, post_seq));
			}
		}
	}
	
	//게시글 수정 , 파일 삭제 및 업데이트
	public void modify(PostDTO dto, String realPath, MultipartFile[] imgfiles, String[] deleteFileList) throws Exception{ // 게시글 수정 요청
		// 수정된 게시글 정보 DB에서 수정하기 
				postDao.modify(dto);
				
				// 삭제 요청된 파일들을 서버 경로에서 삭제
				if(deleteFileList.length != 0) {
					for(String post_sys_name : deleteFileList) {
						// full 파일 경로를 만들어서 File 객체 생성 -> delete메서드로 파일 삭제
						File file = new File(realPath + File.separator + post_sys_name);
						if(file.exists()) { // 실제 그 경로의 파일이 존재하는지 체크 
							file.delete(); // 실제 서버경로에서 파일 삭제
							System.out.println(post_sys_name);
							post_imgDao.delete(post_sys_name); // DB 에서 파일 데이터 삭제
						}
					}
				}
		
		
		// 새롭게 첨부된 파일 업로드 + DB 에 파일데이터 저장
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		
		System.out.println("imgfiles.length : " + imgfiles.length);
		System.out.println("imgfiles : " + imgfiles[0]);
		for(MultipartFile mf : imgfiles) {
			if(!mf.isEmpty()) { // 파일이 들어있다면 
				String ori_name = mf.getOriginalFilename();
				String sys_name = UUID.randomUUID()+"_"+ori_name;
				
				mf.transferTo(new File(realPathFile+File.separator+sys_name));
				post_imgDao.insert(new Post_imgDTO(0, ori_name, sys_name, dto.getPost_seq()));
			}
		}
		
	}
	//post_seq 번호로 게시글,멤버 닉네임조회
	public Map<String, Object> selectPost_member(int post_seq) throws Exception{
		return postDao.selectPost_member(post_seq);
	}

}
