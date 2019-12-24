package com.domain;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class ShoppingCar {
  HashMap<String,GoodsItem> items=null;
  public ShoppingCar() {
	  items=new HashMap<String,GoodsItem>();
  }
  public void add(GoodsItem goodsitem) {
	  String foodname=goodsitem.getDishs().getFoodname();
	  if(items.containsKey(foodname)) {
		  GoodsItem  goods=(GoodsItem)items.get(foodname);
		  goods.setQuantity(goods.getQuantity()+1);
	  }
	  else {
		  items.put(foodname, goodsitem);
	  }
  }
  public void remove(String foodname) {
	  if(items.containsKey(foodname)) {
		  GoodsItem  goods=(GoodsItem)items.get(foodname);
		  goods.setQuantity(goods.getQuantity()-1);
		  if(goods.getQuantity()<=0) {
			  items.remove(foodname);
		  }
	  }
  }
  public Collection<GoodsItem> getItems(){
	  return items.values();
  }
  public double getTotal() {
	  double amount=0.0;
	  for(Iterator<GoodsItem> i=getItems().iterator();i.hasNext();) {
		  GoodsItem goodsitem=(GoodsItem)i.next();
		  DishsInformation dishs=goodsitem.getDishs();
		  amount+=goodsitem.getQuantity()*dishs.getFoodprice();
	  }
	  amount=roundOff(amount);
	  return amount;
  }
  private double roundOff(double x) {
	  long price=Math.round(x*100);
	  return price/100.0;
  }
  public void clear() {
	  items.clear();
  }
}
