package com.market.post;

import java.util.Date;

import com.market.utills.Time;

public class PostDTO {
 private int post_seq;
 private String post_title;
 private String post_content;
 private String post_category;
 private int post_interest_cnt;
 private int post_chatting_cnt;
 private int post_inquiry_cnt;
 private String price_selling;
 private int price_check;
 private String post_addr;
 private String post_time;
 private String post_state;
 private String user_id;
 private String user_category;
 
 public PostDTO() {}
 
 

public PostDTO(int post_seq, String post_title, String post_content, String post_category, int post_interest_cnt,
		int post_chatting_cnt, int post_inquiry_cnt, String price_selling, int price_check, String post_addr,
		String post_time, String post_state, String user_id, String user_category) {
	super();
	this.post_seq = post_seq;
	this.post_title = post_title;
	this.post_content = post_content;
	this.post_category = post_category;
	this.post_interest_cnt = post_interest_cnt;
	this.post_chatting_cnt = post_chatting_cnt;
	this.post_inquiry_cnt = post_inquiry_cnt;
	this.price_selling = price_selling;
	this.price_check = price_check;
	this.post_addr = post_addr;
	this.post_time = post_time;
	this.post_state = post_state;
	this.user_id = user_id;
	this.user_category = user_category;
}



public int getPost_seq() {
	return post_seq;
}

public void setPost_seq(int post_seq) {
	this.post_seq = post_seq;
}

public String getPost_title() {
	return post_title;
}

public void setPost_title(String post_title) {
	this.post_title = post_title;
}

public String getPost_content() {
	return post_content;
}

public void setPost_content(String post_content) {
	this.post_content = post_content;
}

public String getPost_category() {
	return post_category;
}

public void setPost_category(String post_category) {
	this.post_category = post_category;
}

public int getPost_interest_cnt() {
	return post_interest_cnt;
}

public void setPost_interest_cnt(int post_interest_cnt) {
	this.post_interest_cnt = post_interest_cnt;
}

public int getPost_chatting_cnt() {
	return post_chatting_cnt;
}

public void setPost_chatting_cnt(int post_chatting_cnt) {
	this.post_chatting_cnt = post_chatting_cnt;
}

public int getPost_inquiry_cnt() {
	return post_inquiry_cnt;
}

public void setPost_inquiry_cnt(int post_inquiry_cnt) {
	this.post_inquiry_cnt = post_inquiry_cnt;
}

public String getPrice_selling() {
	return price_selling;
}

public void setPrice_selling(String price_selling) {
	this.price_selling = price_selling;
}

public int getPrice_check() {
	return price_check;
}

public void setPrice_check(int price_check) {
	this.price_check = price_check;
}

public String getPost_addr() {
	return post_addr;
}

public void setPost_addr(String post_addr) {
	this.post_addr = post_addr;
}

public String getPost_time() {
	return post_time;
}

public void setPost_time(Date post_time) {
	this.post_time =  Time.calculateTime(post_time);
}

public String getPost_state() {
	return post_state;
}

public void setPost_state(String post_state) {
	this.post_state = post_state;
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
	return "PostDTO [post_seq=" + post_seq + ", post_title=" + post_title + ", post_content=" + post_content
			+ ", post_category=" + post_category + ", post_interest_cnt=" + post_interest_cnt + ", post_chatting_cnt="
			+ post_chatting_cnt + ", post_inquiry_cnt=" + post_inquiry_cnt + ", price_selling=" + price_selling
			+ ", price_check=" + price_check + ", post_addr=" + post_addr + ", post_time=" + post_time + ", post_state="
			+ post_state + ", user_id=" + user_id + ", user_category=" + user_category + "]";
}



 
 
 
}


