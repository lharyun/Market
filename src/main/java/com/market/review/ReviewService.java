package com.market.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	public List<ReviewDTO> selectAll(int start,int end,String reviewed_id) throws Exception{
		return reviewDAO.selectAll(start,end,reviewed_id);
		
	}
	
	public void insert(ReviewDTO dto) throws Exception{
		reviewDAO.insert(dto);
	}
}
