package com.market.review;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class ReviewDTO {

	private int review_seq;
	private String review_comment;
	private String review_date;
	private int review_rating;
	private String review_nickname;
	private String review_profile;
	private String user_id;
	private String user_category;
	private String reviewed_id;
	
	public ReviewDTO() {}

	public ReviewDTO(int review_seq, String review_comment, Date review_date, int review_rating,
			String review_nickname, String review_profile, String user_id, String user_category, String reviewed_id) {
		super();
		this.review_seq = review_seq;
		this.review_comment = review_comment;
		this.review_date = simpleDateFormat(review_date);
		this.review_rating = review_rating;
		this.review_nickname = review_nickname;
		this.review_profile = review_profile;
		this.user_id = user_id;
		this.user_category = user_category;
		this.reviewed_id = reviewed_id;
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

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = simpleDateFormat(review_date);
	}

	public int getReview_rating() {
		return review_rating;
	}

	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}

	public String getReview_nickname() {
		return review_nickname;
	}

	public void setReview_nickname(String review_nickname) {
		this.review_nickname = review_nickname;
	}

	public String getReview_profile() {
		return review_profile;
	}

	public void setReview_profile(String review_profile) {
		this.review_profile = review_profile;
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

	public String getReviewed_id() {
		return reviewed_id;
	}

	public void setReviewed_id(String reviewed_id) {
		this.reviewed_id = reviewed_id;
	}

	public static String simpleDateFormat(Date write_date) {
		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
		return dateFormat.format(write_date);
		
	}
	
	@Override
	public String toString() {
		return "ReviewDTO [review_seq=" + review_seq + ", review_comment=" + review_comment + ", review_date="
				+ review_date + ", review_rating=" + review_rating + ", review_nickname=" + review_nickname
				+ ", review_profile=" + review_profile + ", user_id=" + user_id + ", user_category=" + user_category
				+ ", reviewed_id=" + reviewed_id + "]";
	}

	
}
