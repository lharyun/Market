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
	
	// 모든 이미지 하나씩 조회
			public List<Post_imgDTO> selectOneAll() throws Exception{
				return session.selectList("post_imgMapper.selectOneAll");
			}
	
	// post 이미지 조회
		public List<Post_imgDTO> selectPost_seq(int post_seq) throws Exception{
			return session.selectList("post_imgMapper.selectPost_seq", post_seq);
		}
		
	// 이미지 삭제
		public void delete(String sys_name) throws Exception{
			System.out.println();
			session.delete("post_imgMapper.delete", sys_name);
		}
		
}
