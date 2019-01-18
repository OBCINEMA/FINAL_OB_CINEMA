package com.ob.biz.vo;

import java.sql.Date;

public class Pay_infoVO {
	private String pay_type;
	private int pay_id,	pay_price, u_id;
	private Date pay_date;
	
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public int getPay_id() {
		return pay_id;
	}
	public void setPay_id(int pay_id) {
		this.pay_id = pay_id;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	@Override
	public String toString() {
		return "Pay_info [pay_type=" + pay_type + ", pay_id=" + pay_id + ", pay_price=" + pay_price + ", u_id=" + u_id
				+ ", pay_date=" + pay_date + "]";
	}
}
