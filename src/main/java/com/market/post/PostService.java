package com.market.post;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.basket.BasketDTO;
import com.market.post_img.Post_imgDAO;
import com.market.post_img.Post_imgDTO;

@Service
public class PostService {
	@Autowired
	private PostDAO postDao;
	@Autowired
	private Post_imgDAO post_imgDao;
	

	//판매중 카테고리 업데이트
		public void toPost_category(String post_category, int post_seq)throws Exception{
			postDao.toPost_category(post_category,post_seq);
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
	// 조인된 테이블 데이터 조회
	public List<Map<String, Object>> selectJoin() throws Exception {
		return postDao.selectJoin();
	}

	public Map<String, Object> selectPost_seq(int post_seq) throws Exception{ //  게시글 조회
		// 다른 타입의 데이터를 반환하기 위해 map를 이용
		Map<String, Object> map = new HashMap<>();
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

}
