package com.market.chatting;

import java.util.Date;

import com.market.utils.Time;

public class ChattingRoomDTO {
	private int room_id; //seq번호
	private String userName; //상대방 닉네임
	private String masterName; //본인 닉네임
	private int unReadCount; //안읽은 메세지수
	private int post_seq;//판매게시판시퀀스
	private String last_date; //마지막 업로드시간
	private String extraAddr; // --동
	private String last_chat; //마지막 채팅메시지
	
	public ChattingRoomDTO() {}
	
	public ChattingRoomDTO(int room_id, String userName, String masterName, int unReadCount, int post_seq,
			String last_date, String extraAddr, String last_chat) {
		super();
		this.room_id = room_id;
		this.userName = userName;
		this.masterName = masterName;
		this.unReadCount = unReadCount;
		this.post_seq = post_seq;
		this.last_date = last_date;
		this.extraAddr = extraAddr;
		this.last_chat = last_chat;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	public int getUnReadCount() {
		return unReadCount;
	}

	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public String getLast_date() {
		return last_date;
	}

	public void setLast_date(Date last_date) {
		this.last_date = Time.calculateTime(last_date);
	}

	public String getExtraAddr() {
		return extraAddr;
	}

	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}

	public String getLast_chat() {
		return last_chat;
	}

	public void setLast_chat(String last_chat) {
		this.last_chat = last_chat;
	}

	@Override
	public String toString() {
		return "ChattingRoomDTO [room_id=" + room_id + ", userName=" + userName + ", masterName=" + masterName
				+ ", unReadCount=" + unReadCount + ", post_seq=" + post_seq + ", last_date=" + last_date
				+ ", extraAddr=" + extraAddr + ", last_chat=" + last_chat + "]";
	}
	
	
	
}
