package com.market.post_img;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Post_imgDAO {

	@Autowired
	private SqlSession session;
	
	
	// 이미지 저장
	public void insert(Post_imgDTO dto) throws Exception{
		session.insert("post_imgMapper.insert", dto);
	}
	// 모든 이미지 조회
		public List<Post_imgDTO> selectAll() throws Exception{
			return session.selectList("post_imgMapper.selectAll");
		}
}
