package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;

import com.dao.JDBCDao;
//import com.mchange.v2.c3p0.impl.DbAuth;
import com.utils.JDBCUtil;

@WebServlet("/Register")
public class Register extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String no;
	String pwd;
	String name;
	String type = "u";
	String repass;
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("request--->"+request.getRequestURL()+"===="+request.getParameterMap().toString());
		PrintWriter out = response.getWriter();
		no = request.getParameter("no"); // 获取客户端传过来的参数
		pwd = request.getParameter("password");
		name = request.getParameter("name");
		repass = request.getParameter("repass");
		System.out.println(no+"   "+pwd);
		Connection dbconn = null;
		
		
		
		if (no == null || no.equals("") || pwd == null || pwd.equals("") || name == null || name.equals("")) {
			System.out.println("参数为空");
			return;
		}
		if(!pwd.equals(repass)) {
			out.println("<script>alert('两次密码不一致~');  window.location='register.jsp'</script>");
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
		String sql = "insert into user (no,name,password,type) values ('"+no+"','"+name+"','"+pwd+"','"+type+"');";
		
		
		
		if(JDBCDao.insertOrDeleteOrUpdate(sql) != 0) {
			System.out.println("添加成功！");
			out.println("<script>alert('注册成功，赶快去登录吧~');  window.location='login.jsp'</script>");
		}
		try {
			dbconn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
			//dbconn.close();
		
		
		out.println("<script>alert('用户名或密码错误~');  window.location='login.jsp'</script>");
	}
}
