package com.market.notification;

import java.util.Date;

import com.market.utills.Time;

public class NotificationDTO {
private int notification_seq;
private	String user_nickname;
private	String from_nickname;
private String post_title;
private String price_restriction;
private String notification_type;
private String notification_time;
private int post_seq;

public NotificationDTO () {}



public NotificationDTO(int notification_seq, String user_nickname, String from_nickname, String post_title,
		String price_restriction, String notification_type, String notification_time, int post_seq) {
	super();
	this.notification_seq = notification_seq;
	this.user_nickname = user_nickname;
	this.from_nickname = from_nickname;
	this.post_title = post_title;
	this.price_restriction = price_restriction;
	this.notification_type = notification_type;
	this.notification_time = notification_time;
	this.post_seq = post_seq;
}



public int getNotification_seq() {
	return notification_seq;
}

public void setNotification_seq(int notification_seq) {
	this.notification_seq = notification_seq;
}


public String getUser_nickname() {
	return user_nickname;
}



public void setUser_nickname(String user_nickname) {
	this.user_nickname = user_nickname;
}



public String getFrom_nickname() {
	return from_nickname;
}



public void setFrom_nickname(String from_nickname) {
	this.from_nickname = from_nickname;
}



public String getPost_title() {
	return post_title;
}

public void setPost_title(String post_title) {
	this.post_title = post_title;
}

public String getPrice_restriction() {
	return price_restriction;
}

public void setPrice_restriction(String price_restriction) {
	this.price_restriction = price_restriction;
}

public String getNotification_type() {
	return notification_type;
}

public void setNotification_type(String notification_type) {
	this.notification_type = notification_type;
}

public String getNotification_time() {
	return notification_time;
}

public void setNotification_time(Date notification_time) {
	this.notification_time = Time.calculateTime(notification_time);
}

public int getPost_seq() {
	return post_seq;
}

public void setPost_seq(int post_seq) {
	this.post_seq = post_seq;
}



@Override
public String toString() {
	return "NotificationDTO [notification_seq=" + notification_seq + ", user_nickname=" + user_nickname + ", from_nickname="
			+ from_nickname + ", post_title=" + post_title + ", price_restriction=" + price_restriction
			+ ", notification_type=" + notification_type + ", notification_time=" + notification_time + ", post_seq="
			+ post_seq + "]";
}








}
