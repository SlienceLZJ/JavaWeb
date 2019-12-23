package com.servlet;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JDBCDao;
import com.domain.AddressInfo;
import com.domain.DishsInformation;
import com.domain.GoodsItem;
import com.domain.ShoppingCar;
import com.socket.TestSocket;

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
		String id=(String)request.getSession().getAttribute("no");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sellid=(String)request.getSession().getAttribute("StoreId");
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
			  System.out.print("111111111订单"+foodname);
			  //将订单插入到商家表里
			  String sql="INSERT INTO foodOrder values ('"+id+"','"+sellid+"','"+foodname+"','"+quantity+"','"+foodprice+"','"+time+"','"+fahuo+"','"+totalprice+"')";
	          JDBCDao.insertOrDeleteOrUpdate(sql);
	          JDBCDao.closeConnecttion();
	          
	          
	          //获取店家名字
	          sql="select name from DianMing where id='"+sellid+"'";
	          ResultSet rs=null;
			try {
				rs = JDBCDao.getData(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	          String storeName=null;
	          try {
				if(rs.next()) {
					  storeName=rs.getString("name");
				  }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	          
	          
	         
	          //将订单插入到客户表里 
	          sql="insert into foodOrderCus (CaiMing,Number,Price,TotalPrice,FaHuo,Time,StoreName,id) values('"+foodname+"','"+quantity+"','"+foodprice+"','"+totalprice+"','"+fahuo+"','"+time+"','"+storeName+"','"+id+"')";
	          JDBCDao.insertOrDeleteOrUpdate(sql);
	          JDBCDao.closeConnecttion();
	          
	          
	          
	          
	          //通知websocket给店家发通知
	          TestSocket.noti(sellid);
 
	          ((ServletRequest) request).getRequestDispatcher("payResult.jsp").forward(request, response);
	          //跳转到显示下单成功的界面
	         
	          
	          
	    }

}
}
