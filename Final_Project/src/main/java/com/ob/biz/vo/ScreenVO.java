package com.ob.biz.vo;

public class ScreenVO {
	private String scr_name,scr_seat_row,scr_seat_col,scr_seat_tot;
	private int t_id,scr_id;
	
	//남은 좌석 수
	private int restSeat;
	
	public String getScr_name() {
		return scr_name;
	}
	public void setScr_name(String scr_name) {
		this.scr_name = scr_name;
	}
	public String getScr_seat_row() {
		return scr_seat_row;
	}
	public void setScr_seat_row(String scr_seat_row) {
		this.scr_seat_row = scr_seat_row;
	}
	public String getScr_seat_col() {
		return scr_seat_col;
	}
	public void setScr_seat_col(String scr_seat_col) {
		this.scr_seat_col = scr_seat_col;
	}
	public String getScr_seat_tot() {
		return scr_seat_tot;
	}
	public void setScr_seat_tot(String scr_seat_tot) {
		this.scr_seat_tot = scr_seat_tot;
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
	public int getRestSeat() {
		return restSeat;
	}
	public void setRestSeat(int restSeat) {
		this.restSeat = restSeat;
	}
	@Override
	public String toString() {
		return "ScreenVO [scr_name=" + scr_name + ", scr_seat_row=" + scr_seat_row + ", scr_seat_col=" + scr_seat_col
				+ ", scr_seat_tot=" + scr_seat_tot + ", t_id=" + t_id + ", scr_id=" + scr_id + ", restSeat=" + restSeat
				+ "]";
	}
}
