package com.green.biz.dto;

import java.sql.Date;

public class UserVO {
	private String userid;
	private String pwd;
	private String name;
	private String email;
	private String birth;
	private String gender;
	private String zip_num;
	private String address;
	private String phone;
	private String grade;
	private Date indate;

	private String searchCondition;
	private String keyword;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getZip_num() {
		return zip_num;
	}

	public void setZip_num(String zip_num) {
		this.zip_num = zip_num;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", birth=" + birth
				+ ", gender=" + gender + ", zip_num=" + zip_num + ", address=" + address + ", phone=" + phone
				+ ", grade=" + grade + ", indate=" + indate + ", searchCondition=" + searchCondition + ", keyword="
				+ keyword + "]";
	}

}
