package com.market.basket;

public class BasketDTO {

	private int basket_seq;
	private int post_seq;
	private String user_id;
	private String user_category;
	
	public BasketDTO() {}

	public BasketDTO(int basket_seq, int post_seq, String user_id, String user_category) {
		super();
		this.basket_seq = basket_seq;
		this.post_seq = post_seq;
		this.user_id = user_id;
		this.user_category = user_category;
	}

	public int getBasket_seq() {
		return basket_seq;
	}

	public void setBasket_seq(int basket_seq) {
		this.basket_seq = basket_seq;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_category() {
		return user_category;
	}

	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}

	@Override
	public String toString() {
		return "BasketDTO [basket_seq=" + basket_seq + ", post_seq=" + post_seq + ", user_id=" + user_id
				+ ", user_category=" + user_category + "]";
	}
	
	
}
