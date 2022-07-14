package com.market.basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.post_img.Post_imgDAO;

@Service
public class BasketService {
	@Autowired
	private BasketDAO basketDao;

	//판매페이지 관심목록 추가
	public int basketInsert(BasketDTO dto) throws Exception {
		return basketDao.basketInsert(dto);
	}

	//판매페이지 관심목록 추가
	public int interest_cnt(int post_seq) throws Exception{ 
		return basketDao.interest_cnt(post_seq);
	}
	//판매페이지 관심목록 삭제
	public int basketDelete(BasketDTO dto) throws Exception{ 
		return basketDao.basketDelete(dto);
	}
	//관심목록 같은 값 조회
	public BasketDTO select_userBasket(String user_id, int post_seq) throws Exception{ 
		return basketDao.select_userBasket(user_id, post_seq);
	}
}
