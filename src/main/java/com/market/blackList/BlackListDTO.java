package com.market.blackList;

public class BlackListDTO {
	private int blackList_seq;
	private String blackList_date;
	private String blackList_content;
	private String user_id;
	private String user_category;
	
	public BlackListDTO() {
		
	}

	public BlackListDTO(int blackList_seq, String blackList_date, String blackList_content, String user_id,
			String user_category) {
		super();
		this.blackList_seq = blackList_seq;
		this.blackList_date = blackList_date;
		this.blackList_content = blackList_content;
		this.user_id = user_id;
		this.user_category = user_category;
	}

	public int getBlackList_seq() {
		return blackList_seq;
	}

	public void setBlackList_seq(int blackList_seq) {
		this.blackList_seq = blackList_seq;
	}

	public String getBlackList_date() {
		return blackList_date;
	}

	public void setBlackList_date(String blackList_date) {
		this.blackList_date = blackList_date;
	}

	public String getBlackList_content() {
		return blackList_content;
	}

	public void setBlackList_content(String blackList_content) {
		this.blackList_content = blackList_content;
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
		return "BlackListDTO [blackList_seq=" + blackList_seq + ", blackList_date=" + blackList_date
				+ ", blackList_content=" + blackList_content + ", user_id=" + user_id + ", user_category="
				+ user_category + "]";
	}
	
	
}
