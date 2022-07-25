package com.market.post_img;

public class Post_imgDTO {
 private int post_img_seq;
 private String post_ori_name;
 private String post_sys_name;
 private int post_seq;

 
 public Post_imgDTO() {}


public Post_imgDTO(int post_img_seq, String post_ori_name, String post_sys_name, int post_seq) {
	super();
	this.post_img_seq = post_img_seq;
	this.post_ori_name = post_ori_name;
	this.post_sys_name = post_sys_name;
	this.post_seq = post_seq;
}


public int getPost_img_seq() {
	return post_img_seq;
}


public void setPost_img_seq(int post_img_seq) {
	this.post_img_seq = post_img_seq;
}


public String getPost_ori_name() {
	return post_ori_name;
}


public void setPost_ori_name(String post_ori_name) {
	this.post_ori_name = post_ori_name;
}


public String getPost_sys_name() {
	return post_sys_name;
}


public void setPost_sys_name(String post_sys_name) {
	this.post_sys_name = post_sys_name;
}


public int getPost_seq() {
	return post_seq;
}


public void setPost_seq(int post_seq) {
	this.post_seq = post_seq;
}


@Override
public String toString() {
	return "Post_img_seqDTO [post_img_seq=" + post_img_seq + ", post_ori_name=" + post_ori_name + ", post_sys_name="
			+ post_sys_name + ", post_seq=" + post_seq + "]";
}


 
 
}


