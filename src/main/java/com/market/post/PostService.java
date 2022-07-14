package com.market.post;

import java.io.File;
import java.util.HashMap;
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
	
	public Map<String, Object> selectAll() throws Exception{
		// 다른 타입의 데이터를 반환하기 위해 map를 이용
		Map<String, Object> map = new HashMap<>();
		map.put("post_img", post_imgDao.selectAll()); // 파일 데이터 가져오기
		map.put("post", postDao.selectAll()); // 게시글 데이터 가져오기
		return map;
	}
	
	//이미지와 게시글 저장
	public void insert(PostDTO dto, String realPath, MultipartFile[] imgfiles) throws Exception{
		//다음번호 가져오기
		int post_seq = postDao.selectSeq();
		
		//게시글 저장
		dto.setPost_seq(post_seq);
		postDao.insert(dto);
		
		
		//이미지 저장
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		for(MultipartFile mf : imgfiles) {
			if(!mf.isEmpty()) { // 파일이 들어있다면 
				String ori_name = mf.getOriginalFilename();
				String sys_name = UUID.randomUUID()+"_"+ori_name;
				
				mf.transferTo(new File(realPathFile+File.separator+sys_name));
				post_imgDao.insert(new Post_imgDTO(0, ori_name, sys_name, post_seq));
			}
		}
	}

}
