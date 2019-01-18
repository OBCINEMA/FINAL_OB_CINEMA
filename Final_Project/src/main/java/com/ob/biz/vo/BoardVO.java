package com.ob.biz.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE BOARD (
	SEQ NUMBER(5) PRIMARY KEY,
	TITLE VARCHAR2(200),
	WRITER VARCHAR2(20),
	CONTENT VARCHAR2(2000),
	REGDATE DATE DEFAULT SYSDATE,
	CNT NUMBER(5) DEFAULT 0
);
*/

public class BoardVO {
	private int b_id, hit;
	private int m_id;
	private int t_id;
	private int u_id;
	private String b_type, id, title, content, img1, img2, img3, img4, img5;
	private Date regdate;

	private String name;

	// 검색조건용 필드 추가
	private String searchCondition;
	private String searchKeyword;

	// 파일 관련 필드 추가
	private MultipartFile img1_file, img2_file, img3_file, img4_file, img5_file;

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public String getImg5() {
		return img5;
	}

	public void setImg5(String img5) {
		this.img5 = img5;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public MultipartFile getImg1_file() {
		return img1_file;
	}

	public void setImg1_file(MultipartFile img1_file) {
		this.img1_file = img1_file;
	}

	public MultipartFile getImg2_file() {
		return img2_file;
	}

	public void setImg2_file(MultipartFile img2_file) {
		this.img2_file = img2_file;
	}

	public MultipartFile getImg3_file() {
		return img3_file;
	}

	public void setImg3_file(MultipartFile img3_file) {
		this.img3_file = img3_file;
	}

	public MultipartFile getImg4_file() {
		return img4_file;
	}

	public void setImg4_file(MultipartFile img4_file) {
		this.img4_file = img4_file;
	}

	public MultipartFile getImg5_file() {
		return img5_file;
	}

	public void setImg5_file(MultipartFile img5_file) {
		this.img5_file = img5_file;
	}

	@Override
	public String toString() {
		return "BoardVO [b_id=" + b_id + ", hit=" + hit + ", m_id=" + m_id + ", t_id=" + t_id + ", u_id=" + u_id
				+ ", b_type=" + b_type + ", id=" + id + ", title=" + title + ", content=" + content + ", img1=" + img1
				+ ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5 + ", regdate=" + regdate
				+ ", name=" + name + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", img1_file=" + img1_file + ", img2_file=" + img2_file + ", img3_file=" + img3_file + ", img4_file="
				+ img4_file + ", img5_file=" + img5_file + ", getB_id()=" + getB_id() + ", getM_id()=" + getM_id()
				+ ", getHit()=" + getHit() + ", getB_type()=" + getB_type() + ", getId()=" + getId() + ", getTitle()="
				+ getTitle() + ", getContent()=" + getContent() + ", getImg1()=" + getImg1() + ", getImg2()="
				+ getImg2() + ", getImg3()=" + getImg3() + ", getImg4()=" + getImg4() + ", getImg5()=" + getImg5()
				+ ", getRegdate()=" + getRegdate() + ", getName()=" + getName() + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getU_id()=" + getU_id()
				+ ", getT_id()=" + getT_id() + ", getImg1_file()=" + getImg1_file() + ", getImg2_file()="
				+ getImg2_file() + ", getImg3_file()=" + getImg3_file() + ", getImg4_file()=" + getImg4_file()
				+ ", getImg5_file()=" + getImg5_file() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
