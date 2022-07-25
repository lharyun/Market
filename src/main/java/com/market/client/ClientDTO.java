package com.market.client;

public class ClientDTO {
	private int client_seq;
	private String client_title;
	private String client_content;
	private String client_category;
	private String user_id;
	private String user_category;
	
	public ClientDTO() {}

	public ClientDTO(int client_seq, String client_title, String client_content, String client_category, String user_id,
			String user_category) {
		super();
		this.client_seq = client_seq;
		this.client_title = client_title;
		this.client_content = client_content;
		this.client_category = client_category;
		this.user_id = user_id;
		this.user_category = user_category;
	}

	public int getClient_seq() {
		return client_seq;
	}

	public void setClient_seq(int client_seq) {
		this.client_seq = client_seq;
	}

	public String getClient_title() {
		return client_title;
	}

	public void setClient_title(String client_title) {
		this.client_title = client_title;
	}

	public String getClient_content() {
		return client_content;
	}

	public void setClient_content(String client_content) {
		this.client_content = client_content;
	}

	public String getClient_category() {
		return client_category;
	}

	public void setClient_category(String client_category) {
		this.client_category = client_category;
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
		return "ClientDTO [client_seq=" + client_seq + ", client_title=" + client_title + ", client_content="
				+ client_content + ", client_category=" + client_category + ", user_id=" + user_id + ", user_category="
				+ user_category + "]";
	}
	
	
	
}