package com.ob.biz.vo;

import java.sql.Date;

/*
CREATE TABLE USERS (
	ID VARCHAR2(8) PRIMARY KEY,
	PASSWORD VARCHAR2(8),
	NAME VARCHAR2(20),
	ROLE VARCHAR2(5)
);
 */
public class UsersVO {
	private int u_id, grade;
	private String id, password, name, phone, email;
	private Date birth;
	
	private int votedmovie;

	public int getVotedmovie() {
		return votedmovie;
	}

	public void setVotedmovie(int votedmovie) {
		this.votedmovie = votedmovie;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "UsersVO [u_id=" + u_id + ", grade=" + grade + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", email=" + email + ", birth=" + birth + ", votedmovie=" + votedmovie + "]";
	}

}
