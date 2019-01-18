package com.ob.biz.vo;

import java.sql.Date;

public class ReservationVO {
	private int r_id, u_id, nu_id, sch_id, seat_row, seat_col, p_id;
	private Date r_date;

	//사용 편의를 위한 변수 선언
	//세션에 모든 정보를 다 담아서 쓰면 서버가 과부하 될 수 있으므로
	//그때그때 필요한 정보들을 VO에 담아서 쓰는 형태로 쓸 수 있게함
	
	private String title, runningtime;	//영화제목,상영시간(러닝타임)	- movie
	private String t_name, t_phone, t_address;	//극장정보	- theater
	private String scr_name, etc;	//상영관 이름, 층 정보	- screen
	private String time, price;	//영화시작시간, 가격	- schedule
	private String id, name;	//예약자 아이디, 성명	- users
	private String nu_phone, nu_name;	//예약자(비회원) 핸드폰번호, 성명	- no_users
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_phone() {
		return t_phone;
	}
	public void setT_phone(String t_phone) {
		this.t_phone = t_phone;
	}
	public String getT_address() {
		return t_address;
	}
	public void setT_address(String t_address) {
		this.t_address = t_address;
	}
	public String getScr_name() {
		return scr_name;
	}
	public void setScr_name(String scr_name) {
		this.scr_name = scr_name;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNu_phone() {
		return nu_phone;
	}
	public void setNu_phone(String nu_phone) {
		this.nu_phone = nu_phone;
	}
	public String getNu_name() {
		return nu_name;
	}
	public void setNu_name(String nu_name) {
		this.nu_name = nu_name;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getNu_id() {
		return nu_id;
	}
	public void setNu_id(int nu_id) {
		this.nu_id = nu_id;
	}
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public int getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}
	public int getSeat_col() {
		return seat_col;
	}
	public void setSeat_col(int seat_col) {
		this.seat_col = seat_col;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	@Override
	public String toString() {
		return "ReservationVO [r_id=" + r_id + ", u_id=" + u_id + ", nu_id=" + nu_id + ", sch_id=" + sch_id
				+ ", seat_row=" + seat_row + ", seat_col=" + seat_col + ", r_date=" + r_date + ", title=" + title
				+ ", runningtime=" + runningtime + ", t_name=" + t_name + ", t_phone=" + t_phone + ", t_address="
				+ t_address + ", scr_name=" + scr_name + ", etc=" + etc + ", time=" + time + ", price=" + price
				+ ", id=" + id + ", name=" + name + ", nu_phone=" + nu_phone + ", nu_name=" + nu_name + "]";
	}
}
