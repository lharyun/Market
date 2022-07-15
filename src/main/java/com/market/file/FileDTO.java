package com.market.file;

public class FileDTO {
	private int file_seq;
	private int client_seq;
	private String ori_name;
	private String sys_name;
	
	FileDTO(){}

	public FileDTO(int file_seq, int client_seq, String ori_name, String sys_name) {
		super();
		this.file_seq = file_seq;
		this.client_seq = client_seq;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
	}

	public int getFile_seq() {
		return file_seq;
	}

	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}

	public int getClient_seq() {
		return client_seq;
	}

	public void setClient_seq(int client_seq) {
		this.client_seq = client_seq;
	}

	public String getOri_name() {
		return ori_name;
	}

	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}

	public String getSys_name() {
		return sys_name;
	}

	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}

	@Override
	public String toString() {
		return "FileDTO [file_seq=" + file_seq + ", client_seq=" + client_seq + ", ori_name=" + ori_name + ", sys_name="
				+ sys_name + "]";
	}
	
	
}
