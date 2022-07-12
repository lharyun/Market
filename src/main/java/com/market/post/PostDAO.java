package com.market.post;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostDAO {
	
	@Autowired
	private SqlSession session;
	
	public void insert(PostDTO dto) throws Exception{ // 게시글 저장
		session.insert("postMapper.insert", dto);
	}
	
	public int selectSeq() throws Exception{ // 새로운 게시글 시퀀스 번호 생성
		return session.selectOne("postMapper.selectSeq");
	}
	
	public List<PostDTO> selectAll() throws Exception{ // 모든 게시글 조회
		return session.selectList("postMapper.selectAll");
	}

	
}
