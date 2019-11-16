package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JDBCDao;
import com.domain.AddressInfo;
import com.domain.DishsInformation;
import com.domain.GoodsItem;
import com.domain.ShoppingCar;
import javafx.scene.chart.XYChart.Data;

/**
 * Servlet implementation class PostGoods
 */
@WebServlet("/PostGoods")
public class PostGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostGoods() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShoppingCar shoppingcar=(ShoppingCar) request.getSession().getAttribute("shoppingcar");
		String id="101";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sellid="111";
		Date date=new Date();
		String time=sdf.format(date);
		AddressInfo addressinfo=(AddressInfo) request.getSession().getAttribute("addressinfo");
		String name=addressinfo.getName();
		String address=addressinfo.getAddress();
		String phone=addressinfo.getPhone();
		String fahuo="未发货";
	    for(Iterator<GoodsItem> i=shoppingcar.getItems().iterator();i.hasNext();) {
			  GoodsItem goodsitem=(GoodsItem)i.next();
			  DishsInformation dishs=goodsitem.getDishs();
			  String quantity=String.valueOf(goodsitem.getQuantity());
			  String foodname=dishs.getFoodname();
			  String foodprice=String.valueOf(dishs.getFoodprice());
			  String totalprice=String.valueOf(shoppingcar.getTotal());
			  String sql="INSERT INTO foodOrder values ('"+id+"','"+sellid+"','"+foodname+"','"+quantity+"','"+foodprice+"','"+time+"','"+fahuo+"','"+totalprice+"')";  
	          JDBCDao.insertOrDeleteOrUpdate(sql);
	    }

}
}
