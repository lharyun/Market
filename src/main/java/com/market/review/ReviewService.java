package com.market.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	public List<ReviewDTO> selectAll(int start,int end,String user_id) throws Exception{
		return reviewDAO.selectAll(start,end,user_id);
		
	}
}
