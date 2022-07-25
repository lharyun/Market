package com.market.file;

public class FileDTO {
<<<<<<< HEAD
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
	
	
=======
	private int seq_file;
	private int seq_board;
	private String ori_name;
	private String sys_name;
	
	public FileDTO() {}
	public FileDTO(int seq_file, int seq_board, String ori_name, String sys_name) {
		super();
		this.seq_file = seq_file;
		this.seq_board = seq_board;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
	}
	public int getSeq_file() {
		return seq_file;
	}
	public void setSeq_file(int seq_file) {
		this.seq_file = seq_file;
	}
	public int getSeq_board() {
		return seq_board;
	}
	public void setSeq_board(int seq_board) {
		this.seq_board = seq_board;
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
>>>>>>> 21cd9f0ce7813477f1adc088100edc3d20a15f6d
}
