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
import javax.sql.DataSource;

import com.dao.JDBCDao;
import com.domain.DishsInformation;
import com.mchange.v2.c3p0.ComboPooledDataSource;
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
		String sql="SELECT * FROM DianMing";
		ArrayList <DishsInformation> dislist=new ArrayList<DishsInformation>();
		try {
			JDBCDao jdbc=new JDBCDao();
			ResultSet result;
	        result=jdbc.getData(sql);
			while(result.next()) {
				DishsInformation dis=new DishsInformation();
				String name=result.getNString("name");
				String picture=result.getNString("picture");
				dis.setName(name);
				dis.setPicture(picture);
				dislist.add(dis);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("dislist", dislist);
		 response.sendRedirect("/JavaWeb/frame.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
