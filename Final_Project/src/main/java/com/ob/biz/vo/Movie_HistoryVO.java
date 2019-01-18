package com.ob.biz.vo;

import java.sql.Date;

public class Movie_HistoryVO {
	private int h_id, m_id;
	private Date day_start, day_end;
	
	
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public Date getDay_start() {
		return day_start;
	}
	public void setDay_start(Date day_start) {
		this.day_start = day_start;
	}
	public Date getDay_end() {
		return day_end;
	}
	public void setDay_end(Date day_end) {
		this.day_end = day_end;
	}
	
}
