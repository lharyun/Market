package com.market.member;

public class MemberDTO {
	private String user_id;
	private String user_category;
	private String user_k;
	private String user_pw;
	private String user_birth;
	private String user_nickname;
	private String user_profile;
	private String user_name;
	private String user_phone;
	private String postcode;
	private String oradAddr;
	private String detailAddr;
	private String extraAddr;
	private int grade;
	private int rating;
	private String blackList_check;
	
	public MemberDTO() {}

	public MemberDTO(String user_id, String user_category, String user_k, String user_pw, String user_birth,
			String user_nickname, String user_profile, String user_name, String user_phone, String postcode,
			String oradAddr, String detailAddr, String extraAddr, int grade, int rating, String blackList_check) {
		super();
		this.user_id = user_id;
		this.user_category = user_category;
		this.user_k = user_k;
		this.user_pw = user_pw;
		this.user_birth = user_birth;
		this.user_nickname = user_nickname;
		this.user_profile = user_profile;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.postcode = postcode;
		this.oradAddr = oradAddr;
		this.detailAddr = detailAddr;
		this.extraAddr = extraAddr;
		this.grade = grade;
		this.rating = rating;
		this.blackList_check = blackList_check;
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

	public String getUser_k() {
		return user_k;
	}

	public void setUser_k(String user_k) {
		this.user_k = user_k;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getOradAddr() {
		return oradAddr;
	}

	public void setOradAddr(String oradAddr) {
		this.oradAddr = oradAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getExtraAddr() {
		return extraAddr;
	}

	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getBlackList_check() {
		return blackList_check;
	}

	public void setBlackList_check(String blackList_check) {
		this.blackList_check = blackList_check;
	}

	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", user_category=" + user_category + ", user_k=" + user_k
				+ ", user_pw=" + user_pw + ", user_birth=" + user_birth + ", user_nickname=" + user_nickname
				+ ", user_profile=" + user_profile + ", user_name=" + user_name + ", user_phone=" + user_phone
				+ ", postcode=" + postcode + ", oradAddr=" + oradAddr + ", detailAddr=" + detailAddr + ", extraAddr="
				+ extraAddr + ", grade=" + grade + ", rating=" + rating + ", blackList_check=" + blackList_check + "]";
	}

	
	
}
