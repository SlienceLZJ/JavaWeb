package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JDBCDao;

/**
 * Servlet implementation class addfoodtype
 */
@WebServlet("/addfoodtype")
public class addfoodtype extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addfoodtype() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=new String(request.getParameter("id")
                .getBytes("iso-8859-1"),"UTF-8");
		String foodtype=new String(request.getParameter("foodtype")
                .getBytes("iso-8859-1"),"UTF-8");
		
		String sql ="INSERT INTO menu VALUES ('"+id+"','"+foodtype+"')";
		
			int a=JDBCDao.insertOrDeleteOrUpdate(sql);
			JDBCDao.closeConnecttion();
			if(a==0) {
			request.setAttribute("result", "您的店铺已有该菜品");
			}
			else {
				request.setAttribute("result", "成功添加菜品种类：    "+foodtype);
			}
		
		RequestDispatcher rd = request.getRequestDispatcher("addfood.jsp");
		 rd.forward(request, response);
	}

}
