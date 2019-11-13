package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.domain.DianMingInformation;
import com.dao.*;
import com.mysql.cj.jdbc.result.ResultSetMetaData;
import java.sql.*;

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
	      DianMingInformation d = new DianMingInformation();
	      System.out.println(id);
	      String sql="select * from DianMing where id='"+id+"'";
	      System.out.println(sql);
	      ResultSet rs;
		  try{ 
			  rs = JDBCDao.getData(sql);	  
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
