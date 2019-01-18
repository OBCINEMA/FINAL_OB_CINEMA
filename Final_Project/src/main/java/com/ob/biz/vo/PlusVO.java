package com.ob.biz.vo;

// screen table , schedule, table ,theater table , movie 4개 vo 필요한것 합친거
public class PlusVO {
	private int sch_id, m_id, t_id, scr_id, scr_seat_row, scr_seat_col, scr_seat_tot, scr_num;
	private String time, price, scr_name, name, phone, adress, content, img1, img2, img3, img4, img5;
	private String title, gnr, director, runningtime, restrict, poster;
	private int onair , vote;
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getScr_id() {
		return scr_id;
	}
	public void setScr_id(int scr_id) {
		this.scr_id = scr_id;
	}
	public int getScr_seat_row() {
		return scr_seat_row;
	}
	public void setScr_seat_row(int scr_seat_row) {
		this.scr_seat_row = scr_seat_row;
	}
	public int getScr_seat_col() {
		return scr_seat_col;
	}
	public void setScr_seat_col(int scr_seat_col) {
		this.scr_seat_col = scr_seat_col;
	}
	public int getScr_seat_tot() {
		return scr_seat_tot;
	}
	public void setScr_seat_tot(int scr_seat_tot) {
		this.scr_seat_tot = scr_seat_tot;
	}
	public int getScr_num() {
		return scr_num;
	}
	public void setScr_num(int scr_num) {
		this.scr_num = scr_num;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getScr_name() {
		return scr_name;
	}
	public void setScr_name(String scr_name) {
		this.scr_name = scr_name;
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
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getOnair() {
		return onair;
	}
	public void setOnair(int onair) {
		this.onair = onair;
	}
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	@Override
	public String toString() {
		return "PlusVO [sch_id=" + sch_id + ", m_id=" + m_id + ", t_id=" + t_id + ", scr_id=" + scr_id
				+ ", scr_seat_row=" + scr_seat_row + ", scr_seat_col=" + scr_seat_col + ", scr_seat_tot=" + scr_seat_tot
				+ ", scr_num=" + scr_num + ", time=" + time + ", price=" + price + ", scr_name=" + scr_name + ", name="
				+ name + ", phone=" + phone + ", adress=" + adress + ", content=" + content + ", img1=" + img1
				+ ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5 + ", title=" + title
				+ ", gnr=" + gnr + ", director=" + director + ", runningtime=" + runningtime + ", restrict=" + restrict
				+ ", poster=" + poster + ", onair=" + onair + ", vote=" + vote + "]";
	}
	
	
	
}
