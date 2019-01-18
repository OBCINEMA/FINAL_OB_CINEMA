package com.ob.biz.vo;

import org.springframework.web.multipart.MultipartFile;

public class TheaterVO {
	private int t_id, scr_num;
	private String name, phone, adress, content, img1, img2, img3, img4, img5, restraunt_title, restraunt_phone, restraunt_address; 
	

	// 파일 관련 필드 추가
	private MultipartFile img1_file, img2_file, img3_file, img4_file, img5_file;

	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public int getScr_num() {
		return scr_num;
	}

	public void setScr_num(int scr_num) {
		this.scr_num = scr_num;
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

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
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

	public String getRestraunt_title() {
		return restraunt_title;
	}

	public void setRestraunt_title(String restraunt_title) {
		this.restraunt_title = restraunt_title;
	}

	public String getRestraunt_phone() {
		return restraunt_phone;
	}

	public void setRestraunt_phone(String restraunt_phone) {
		this.restraunt_phone = restraunt_phone;
	}

	public String getRestraunt_address() {
		return restraunt_address;
	}

	public void setRestraunt_address(String restraunt_address) {
		this.restraunt_address = restraunt_address;
	}

	@Override
	public String toString() {
		return "TheaterVO [t_id=" + t_id + ", scr_num=" + scr_num + ", name=" + name + ", phone=" + phone + ", adress="
				+ adress + ", content=" + content + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4="
				+ img4 + ", img5=" + img5 + ", restraunt_title=" + restraunt_title + ", restraunt_phone="
				+ restraunt_phone + ", restraunt_address=" + restraunt_address + ", img1_file=" + img1_file
				+ ", img2_file=" + img2_file + ", img3_file=" + img3_file + ", img4_file=" + img4_file + ", img5_file="
				+ img5_file + "]";
	}
}
