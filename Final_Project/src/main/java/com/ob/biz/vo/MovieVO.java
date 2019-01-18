package com.ob.biz.vo;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {
	private int m_id, vote;
	private String title;
	private String gnr;
	private String director;
	private String runningtime;
	private String restrict;
	private int onair;
	private String poster, img1, img2, img3, img4, img5;
	private String content;

	// 파일 관련 필드 추가
	private MultipartFile poster_file, img1_file, img2_file, img3_file, img4_file, img5_file;

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGnr() {
		return gnr;
	}

	public void setGnr(String gnr) {
		this.gnr = gnr;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getRunningtime() {
		return runningtime;
	}

	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}

	public String getRestrict() {
		return restrict;
	}

	public void setRestrict(String restrict) {
		this.restrict = restrict;
	}

	public int getOnair() {
		return onair;
	}

	public void setOnair(int onair) {
		this.onair = onair;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getPoster_file() {
		return poster_file;
	}

	public void setPoster_file(MultipartFile poster_file) {
		this.poster_file = poster_file;
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
		return "MovieVO [m_id=" + m_id + ", vote=" + vote + ", title=" + title + ", gnr=" + gnr + ", director="
				+ director + ", runningtime=" + runningtime + ", restrict=" + restrict + ", onair=" + onair
				+ ", poster=" + poster + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4
				+ ", img5=" + img5 + ", content=" + content + ", poster_file=" + poster_file + ", img1_file="
				+ img1_file + ", img2_file=" + img2_file + ", img3_file=" + img3_file + ", img4_file=" + img4_file
				+ ", img5_file=" + img5_file + "]";
	}

}
