package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.dao.JDBCDao;
//import com.mchange.v2.c3p0.impl.DbAuth;
import com.utils.JDBCUtil;

@WebServlet("/Login")
public class Login extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String no;
	String pwd;
	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("request--->"+request.getRequestURL()+"===="+request.getParameterMap().toString());
		no = request.getParameter("username"); // 获取客户端传过来的参数
		pwd = request.getParameter("password");
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
		String sql = "select * from user;";
		
		
		ResultSet rs = null;
		try {
			rs = JDBCDao.getData(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			dbconn.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (rs != null) {
			try {
				while (rs.next()) { // 遍历结果集
					if (rs.getString("no").equals(no)) {
						if (rs.getString("password").equals(pwd)) {
							response.sendRedirect("DianMing");
							session.setAttribute("no", no);
							break;
						}
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
			//dbconn.close();
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('用户名或密码错误~');  window.location='login.jsp'</script>");
	}
}
