package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.domain.DianMingInformation;
import com.domain.DishsInformation;
import com.domain.ShoppingCar;
import com.dao.*;
import com.mysql.cj.jdbc.result.ResultSetMetaData;
import com.sun.javafx.geom.PickRay;
import java.sql.*;
import java.util.ArrayList;

/**
 * Servlet implementation class Dian
 */
@WebServlet("/Dian")
public class Dian extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		  		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("no");
		System.out.println("the session id is :"+id);
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
				String foodintroduction=result.getString("foodintroduction");
				Float foodprice=result.getFloat("foodprice");
				String foodtype=result.getString("foodtype");
				String foodpicture=result.getString("foodpicture"); 
				dis.setFoodname(foodname);
				dis.setFoodpicture(foodpicture);
				dis.setFoodintroduction(foodintroduction);
				dis.setFoodprice(foodprice); 
				dis.setFoodid(foodid);
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
			dis.setFoodtype(foodtype);
			menu.add(dis);
			}
			result.close();
			JDBCDao.closeConnecttion();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 //ShoppingCar shoppingcar=new ShoppingCar();
		request.getSession().setAttribute("dislist1", dislist);
	    request.getSession().setAttribute("menu1", menu);
		request.getSession().setAttribute("id", id);
	    DianMingInformation d = new DianMingInformation();

	    String sql2="select * from DianMing where id='"+id+"'";
	System.out.println("the sql2 is :"+sql2);
	    ResultSet rs=null;
		try{ 
		  rs = JDBCDao.getData(sql2);	  
	      //System.out.println(rs.next());
	      if(rs.next()){
	       	  System.out.println("the name of store is :"+rs.getString("picture")+"the no is :"+id);  
	       	  
	    	  d.setPicture(rs.getString("picture"));
	    	  d.setName(rs.getString("name"));
	    	  d.setDescription(rs.getString("description"));
	    	  System.out.println("picture url is ="+d.getPicture());
	    	
	      }
	      else {
	    	  d.setPicture("暂未设置商铺图片");
	    	  d.setName("暂无商铺名字");
	    	  d.setDescription("暂未设置商铺描述");
	      }
	      session.setAttribute("d", d);
	      JDBCDao.closeConnecttion();
	      rs.close();
	     }catch(Exception e){
	      e.printStackTrace();
	     }
		 RequestDispatcher rd=request.getRequestDispatcher("Dian.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
