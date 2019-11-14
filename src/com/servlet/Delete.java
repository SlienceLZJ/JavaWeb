package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JDBCDao;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foodname=new String(request.getParameter("foodname")
                .getBytes("iso-8859-1"),"UTF-8");
		System.out.println("Delete   foodname  is"+foodname);
		String id=new String(request.getParameter("id")
                .getBytes("iso-8859-1"),"UTF-8");
		System.out.println("Delete   id  is"+id);
		String sql ="delete from Dian where id='"+id+"' and foodname='"+foodname+"'";
		System.out.println(sql);
		int a=JDBCDao.insertOrDeleteOrUpdate(sql);
		System.out.println(a);
		
			request.setAttribute("id", id);
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp")
					;
			rd.forward(request, response);
		
		JDBCDao.closeConnecttion();
	}

}
