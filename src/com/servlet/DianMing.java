package com.servlet;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JDBCDao;
import com.domain.DianMingInformation;
import com.mysql.cj.jdbc.result.ResultSetMetaData;

/**
 * Servlet implementation class DianMing
 */
@WebServlet("/DianMing")

public class DianMing extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);		
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sql="select * from DianMing";				
		List<DianMingInformation> list=new ArrayList<DianMingInformation>();
						
		try {
			ResultSet rs=JDBCDao.getData(sql);			
			while(rs.next()) {
			DianMingInformation info=new DianMingInformation();	
			info.setName(rs.getString("name"));
			info.setPicture(rs.getString("picture"));	
			list.add(info);
			System.out.println("resut set is "+rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
	
		
		System.out.println("the size is :"+list.size());
		System.out.println("the first is "+list.get(0).getName());
		System.out.println("the second is "+list.get(1).getName());
		
		 RequestDispatcher rd = request.getRequestDispatcher("dianming.jsp");
		 rd.forward(request, response);
	
		 
		 
		 
	}

}
