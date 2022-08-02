package com.market.review;

public class ReviewDTO {

	private int review_seq;
	private String review_comment;
	private String review_nickname;
	private int rating;
	private int post_seq;
	private String user_id;
	private String user_category;
	
	public ReviewDTO() {}

	public ReviewDTO(int review_seq, String review_comment, String review_nickname, int rating, int post_seq,
			String user_id, String user_category) {
		super();
		this.review_seq = review_seq;
		this.review_comment = review_comment;
		this.review_nickname = review_nickname;
		this.rating = rating;
		this.post_seq = post_seq;
		this.user_id = user_id;
		this.user_category = user_category;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public String getReview_comment() {
		return review_comment;
	}

	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}

	public String getReview_nickname() {
		return review_nickname;
	}

	public void setReview_nickname(String review_nickname) {
		this.review_nickname = review_nickname;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
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
		return "ReviewDTO [review_seq=" + review_seq + ", review_comment=" + review_comment + ", review_nickname="
				+ review_nickname + ", rating=" + rating + ", post_seq=" + post_seq + ", user_id=" + user_id
				+ ", user_category=" +  user_category + "]";
	}
	
	
	
}
