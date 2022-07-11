package com.market.report;

public class ReportDTO {
	private int report_seq;
	private String report_content;
	private String user_id;
	private String user_category;
	private String reported_id;
	private String category;
	private int category_seq;
	
	public ReportDTO() {}

	public ReportDTO(int report_seq, String report_content, String user_id, String user_category, String reported_id,
			String category, int category_seq) {
		super();
		this.report_seq = report_seq;
		this.report_content = report_content;
		this.user_id = user_id;
		this.user_category = user_category;
		this.reported_id = reported_id;
		this.category = category;
		this.category_seq = category_seq;
	}

	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
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

	public String getReported_id() {
		return reported_id;
	}

	public void setReported_id(String reported_id) {
		this.reported_id = reported_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCategory_seq() {
		return category_seq;
	}

	public void setCategory_seq(int category_seq) {
		this.category_seq = category_seq;
	}

	@Override
	public String toString() {
		return "ReportDTO [report_seq=" + report_seq + ", report_content=" + report_content + ", user_id=" + user_id
				+ ", user_category=" + user_category + ", reported_id=" + reported_id + ", category=" + category
				+ ", category_seq=" + category_seq + "]";
	}
	
	
	
	
}
