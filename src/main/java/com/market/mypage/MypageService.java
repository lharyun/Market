package com.market.mypage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.basket.BasketDTO;
import com.market.member.MemberDTO;
import com.market.post.PostDTO;

@Service
public class MypageService {
	@Autowired
	private MypageDAO dao;
	@Autowired
	private SqlSession session;
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	// 프로필 사진 수정
	public String uploadProfile(MultipartFile file, String realPath, String user_id) throws Exception{
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		String sys_name = null;
		if(!file.isEmpty()) {
			String ori_name = file.getOriginalFilename();
			sys_name = UUID.randomUUID() + "_" + ori_name;
			file.transferTo(new File(realPath + File.separator + sys_name));
			dao.modifyProfile(user_id, sys_name);
		}
		return sys_name;
	}
	
	// 내 정보 수정
	public int modifyInfo(MemberDTO dto) throws Exception{
		return dao.modifyInfo(dto);
	}
	
	// 비밀번호 변경
	public void changepw(MemberDTO dto) throws Exception {
		
		System.out.println("암호화 전 비밀번호 : " + dto.getUser_pw());
		
		String changed_pw = pwdEncoder.encode(dto.getUser_pw());
		dto.setUser_pw(changed_pw);
		
		System.out.println("암호화 후 비밀번호 : " + changed_pw);
		
		dao.changepw(dto);
		
	}
	
	// 내 게시글 수 세기
	public int countpost(String user_id) throws Exception{
		return dao.countpost(user_id);
	}
	
	// 내 게시글 조회
	public List<PostDTO> searchmypost(String user_id) throws Exception{
		return dao.searchmypost(user_id);
	}
	
	// 내 찜 수 세기
	public int countbasket(String user_id) throws Exception{
		return dao.countbasket(user_id);
	}
	
	// 내 찜 목록 조회
	public List<BasketDTO> searchmybasket(String user_id) throws Exception{
		return dao.searchmybasket(user_id);
	}
	
	//총데이터 수를 가져와 페이지 계산
	public HashMap<String,Object> getPageNavi(int curPage, String post_addr, String user_id) throws Exception{
		int totalCnt = dao.getPageNavi(post_addr, user_id); //전체 게시글의 개수
		System.out.println(totalCnt);
		int recordCntPerPage=12; //한페이지에 몇개의 데이터(게시글)을 띄워줄지
		int naviCntPerPage=3; //네비바에 몇개 단위로 페이징을 구성할지
		int pageTotalCnt =0;// 총 몇 페이지가 나올지			
		if(totalCnt % recordCntPerPage >0) { // 나머지가 생김(10의 배수가 아님x)
			pageTotalCnt =totalCnt/recordCntPerPage +1; //45개-> 4.5+1
		}else {
			pageTotalCnt =totalCnt/ recordCntPerPage;
		}	
		/*
		 * 현재 페이지는 반드시 1 이상 현재 페이지는 총 페이지의 개수를 넘어갈 수 없음
		 */
		if(curPage < 1) {// 현재 페이지가 0이거나 혹은 음수일때
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
		if(endNavi == pageTotalCnt) {
			needNext =false;
		}
		// map -> key, value
					// 제네릭 <키에 대한 자료형, 값에 대한 자료형>
		HashMap<String,Object> map = new HashMap<>();
		map.put("startNavi",startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);	
		map.put("curPage", curPage);
		return map;
				
	}
	
	// 조인된 테이블 데이터 조회(내 게시글)
	public List<Map<String, Object>> myselectJoin(String user_id, int start, int end) throws Exception {
		return dao.myselectJoin(user_id, start, end);
	}
	
	// 조인된 테이블 데이터 조회(찜 목록)
	public List<Map<String, Object>> myselectJoin2(String user_id, int start, int end) throws Exception {
		return dao.myselectJoin2(user_id, start, end);
	}
}
