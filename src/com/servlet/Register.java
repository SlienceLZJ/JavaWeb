package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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



	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("request--->"+request.getRequestURL()+"===="+request.getParameterMap().toString());
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username"); // 获取客户端传过来的参数
		String password = request.getParameter("password");
		String type=request.getParameter("choice");
		Connection dbconn = null;
		
		
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
		/*---------------------访问数据库↓--------------------*/
		
		
		String sql="insert into user (no,password,type,name,phone,address) values ('"+username+"','"+password+"','"+type+"','暂无','暂无','暂无')";
		
		System.out.println("the sql is "+sql);
		
		int result=JDBCDao.insertOrDeleteOrUpdate(sql);
		System.out.println("the result is"+result );
		if(result==0) {//如果等于0代表该账号已被注册														
			System.out.println("the jsp result is failed-----");
			request.setAttribute("msg", "failed");
			RequestDispatcher rd=request.getRequestDispatcher("/register.jsp");
			rd.forward(request, response);
		}
		else {//注册成功
		
			
			
			
			
			
			
			
			
			
			
			System.out.println("the jsp result is success-----");
			request.setAttribute("msg", "success");
			RequestDispatcher rd=request.getRequestDispatcher("/register.jsp");
			rd.forward(request, response);			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*---------------------访问数据库↑--------------------*/
		//关闭数据库连接
				try {
					dbconn.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		
		
		
		
		
		
		
		
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
