package com.market.chatting;

public class ChattingRoomDTO {
	private int room_seq;
	private int post_seq;
	private String your_nickname;
	private String user_id;
	private String user_category;
	private String message;
	
	public ChattingRoomDTO() {}
	public ChattingRoomDTO(int room_seq, int post_seq, String your_nickname, String user_id, String user_category,
			String message) {
		super();
		this.room_seq = room_seq;
		this.post_seq = post_seq;
		this.your_nickname = your_nickname;
		this.user_id = user_id;
		this.user_category = user_category;
		this.message = message;
	}
	
	public int getRoom_seq() {
		return room_seq;
	}
	public void setRoom_seq(int room_seq) {
		this.room_seq = room_seq;
	}
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public String getYour_nickname() {
		return your_nickname;
	}
	public void setYour_nickname(String your_nickname) {
		this.your_nickname = your_nickname;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return "ChattingDTO [room_seq=" + room_seq + ", post_seq=" + post_seq + ", your_nickname=" + your_nickname
				+ ", user_id=" + user_id + ", user_category=" + user_category + ", message=" + message + "]";
	}
}
