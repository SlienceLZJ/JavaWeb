package com.domain;

public class GoodsItem {
	private DishsInformation dishs;
    private int quantity;
    public GoodsItem(DishsInformation s) {
      this.dishs=s;
      this.quantity=1;
}
    public DishsInformation getDishs() {
		return dishs;
	}
	public void setDishs(DishsInformation dishs) {
		this.dishs = dishs;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public GoodsItem(DishsInformation s,int q) {
        this.dishs=s;
        this.quantity=q;
  }
}
