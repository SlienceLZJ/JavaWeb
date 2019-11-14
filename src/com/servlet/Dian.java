package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.domain.DianMingInformation;
import com.domain.DishsInformation;
import com.domain.ShoppingCar;
import com.dao.*;
import com.mysql.cj.jdbc.result.ResultSetMetaData;
import java.sql.*;
import java.util.ArrayList;

/**
 * Servlet implementation class Dian
 */
@WebServlet("/Dian")
public class Dian extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dian() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		String id=(String)request.getAttribute("id");
		String sql="SELECT * FROM Dian where id='"+id+"'";
		String sql1="SELECT * FROM menu where id='"+id+"'";
		ArrayList <DishsInformation> dislist=new ArrayList<DishsInformation>();
		ArrayList <DishsInformation> menu=new ArrayList<DishsInformation>();
		ResultSet result;
		try {
			JDBCDao jdbc=new JDBCDao();
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
 		 //request.getSession().setAttribute("shoppingcar",shoppingcar);
		
		
		
		
		
		
		  
		
		
		
		
		
		
		  

	    DianMingInformation d = new DianMingInformation();
	    System.out.println(id);
	    String sql2="select * from DianMing where id='"+id+"'";
	    System.out.println(sql2);
	    ResultSet rs;
		try{ 
		  rs = JDBCDao.getData(sql2);	  
	      //System.out.println(rs.next());
	      if(rs.next()){
	       	  System.out.println(d.getName());    		  
	    	  d.setPicture(rs.getString("picture"));
	    	  d.setName(rs.getString("name"));
	    	  d.setDescription(rs.getString("description"));
	    	  System.out.println("picture url is ="+d.getPicture());
	    	  request.setAttribute("d", d);
	    	  
	      }
	      JDBCDao.closeConnecttion();
	     }catch(Exception e){
	      e.printStackTrace();
	     }
		 RequestDispatcher rd=request.getRequestDispatcher("Dian.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	
	
	
	
	
}
