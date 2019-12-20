package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import javax.websocket.Session;

import com.dao.JDBCDao;
//import com.mchange.v2.c3p0.impl.DbAuth;
import com.utils.JDBCUtil;
import com.domain.*;

@WebServlet("/Login")
public class Login extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		String no = request.getParameter("username"); // 获取客户端传过来的参数
		String pwd = request.getParameter("password");	
		System.out.println("the no is null?"+(no==null));		
		System.out.println(no+"   "+pwd);
		Connection dbconn = null;		
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession(true);
		if (no == null || no.equals("") || pwd == null || pwd.equals("")) {
			System.out.println("用户名或密码为空");
			return;
		}		
		// 打开数据库连接
		DataSource dataSource = null;
		try {
		      dataSource = JDBCUtil.getDataSource();  
	      }
		catch(Exception e){
	          System.out.println(e);
	      }
		try {
			dbconn = dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}										
		String sql = "select * from user where no='"+no+"' and password='"+pwd+"' ";		
		System.out.println("the sql is :"+sql);								
		ResultSet rs=null;
		try {
			rs=JDBCDao.getData(sql);
		} catch (Exception e) {
			// TODO: handle exception
		}								
		System.out.println("result is null?"+(rs==null));	
		try {
			if(rs.next()) {//如果查到结果
				session.setAttribute("no", no);								
				if(rs.getString("type").equals("cus")) {//如果是用户就跳到用户界面				
					response.sendRedirect("DianMing");
				}
				else {//如果是商家就跳到商家界面        	
					response.sendRedirect("Dian");
				}				
			}
			else {//如果没有查到结果
				request.setAttribute("error", "用户名或密码错误,请重新输入！");
				RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		//关闭数据库连接
		try {
			dbconn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
