package com.market.post;

import java.util.List;
import java.util.Map;

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
	
	public PostDTO selectPost_seq(int post_seq) throws Exception{ // post_seq 번호로 조회
		return session.selectOne("postMapper.selectPost_seq", post_seq);
	}
	
	public List<Map<String,Object>> selectJoin() throws Exception{ // 조인된 테이블 데이터 조회
		return session.selectList("postMapper.selectJoin");
	}

	
}
