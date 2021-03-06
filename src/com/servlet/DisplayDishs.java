package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.dao.JDBCDao;
import com.domain.DishsInformation;
import com.domain.ShoppingCar;
import com.utils.JDBCUtil;

@WebServlet("/DisplayDishs")
public class DisplayDishs extends HttpServlet {
	private static final long serialVersionUID = 1L;
    JDBCDao jdbcdao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayDishs() {
        super();
        // TODO Auto-generated constructor stub
    }
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("storeId");
		HttpSession storeId=request.getSession();
		storeId.setAttribute("StoreId", id);
		System.out.println("DisplayDishs   id   "+id);
		String sql="SELECT * FROM Dian where id='"+id+"'";
		String sql1="SELECT * FROM menu where id='"+id+"'";
		ArrayList <DishsInformation> dislist=new ArrayList<DishsInformation>();
		ArrayList <DishsInformation> menu=new ArrayList<DishsInformation>();
		ResultSet result;
		try {		
	        result=JDBCDao.getData(sql);
			while(result.next()){ 
				DishsInformation dis=new DishsInformation();
				String foodname=result.getString("foodname");
				String foodid=result.getString("id");
				System.out.print(foodname);
				String foodintroduction=result.getString("foodintroduction");
				Float foodprice=result.getFloat("foodprice");
				String foodtype=result.getString("foodtype");
				String foodpicture=result.getString("foodpicture"); 
				dis.setFoodname(foodname);
				dis.setFoodpicture(foodpicture);
				dis.setFoodintroduction(foodintroduction);
				dis.setFoodprice(foodprice); 
				dis.setFoodid(foodid);//商家id
				dis.setFoodtype(foodtype);
				dislist.add(dis);
			}
			JDBCDao.closeConnecttion();
			result.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			result=JDBCDao.getData(sql1);
			while(result.next()) {
			DishsInformation dis=new DishsInformation();
			String foodtype=result.getString("foodtype");
			System.out.print(foodtype);
			dis.setFoodtype(foodtype);
			menu.add(dis);
			}
			result.close();
			JDBCDao.closeConnecttion();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 request.getSession().setAttribute("dislist", dislist);
		 request.getSession().setAttribute("menu", menu);
		 
		 ShoppingCar shopcar=(ShoppingCar)request.getAttribute("shoppingcar");
		 if(shopcar==null) {
			shopcar=new ShoppingCar();
		 request.getSession().setAttribute("shoppingcar",shopcar);
		 }
		 response.sendRedirect("/JavaWeb/right.jsp");
		 
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
