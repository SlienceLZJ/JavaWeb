package com.domain;

public class OrderBeanCus {
	private String caiMing;
	private String number;
	private String price;
	private String totalPrice;
	private String faHuo;
	private String time;
	private String storeName;
	private String id;	
	public String getCaiMing() {
		return caiMing;
	}
	public void setCaiMing(String caiMing) {
		this.caiMing = caiMing;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getFaHuo() {
		return faHuo;
	}
	public void setFaHuo(String faHuo) {
		this.faHuo=faHuo;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName=storeName;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
