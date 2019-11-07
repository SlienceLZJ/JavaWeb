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
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sql="select * from DianMing";
		ResultSet rs=JDBCDao.getData(sql);
		DianMingInformation info=new DianMingInformation();	
		
		List<DianMingInformation> list=new ArrayList<DianMingInformation>();
		
		try {
								
			while(rs.next()) {
			info.setName(rs.getString("name"));
			info.setPicture(rs.getString("picture"));	
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		 RequestDispatcher rd = request.getRequestDispatcher("dianming.jsp");
		 rd.forward(request, response);
		
		
		
		
		
		
		
	}

}
