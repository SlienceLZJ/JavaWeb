package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utils.*;


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
		no = request.getParameter("no"); // 获取客户端传过来的参数
		pwd = request.getParameter("pwd");
		response.setContentType("text/html;charset=utf-8");
		if (no == null || no.equals("") || pwd == null || pwd.equals("")) {
			System.out.println("用户名或密码为空");
			return;
		}
		
		// 打开数据库连接
		
	
		
		
			response.getWriter().close(); // 关闭这个流，不然会发生错误的
		
	}
}
