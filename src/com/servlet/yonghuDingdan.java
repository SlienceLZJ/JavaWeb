package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JDBCDao;
import com.domain.OrderBean;
import com.domain.OrderBeanCus;
import com.mysql.cj.xdevapi.Result;

/**
 * Servlet implementation class yonghuDingdan
 */
@WebServlet("/yonghuDingdan")
public class yonghuDingdan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id= (String)request.getSession().getAttribute("no");
        System.out.println(id);
        ArrayList<OrderBeanCus>  order=new ArrayList<OrderBeanCus>();
        String sql="select * from foodOrderCus where Id='"+id+"'";
        ResultSet rs;
        try {
        	rs=JDBCDao.getData(sql);
        	while(rs.next()) {
                OrderBeanCus a=new OrderBeanCus();
                a.setId(rs.getString("Id"));
                a.setCaiMing(rs.getString("CaiMing"));
                a.setNumber(rs.getString("Number"));
                a.setPrice(rs.getString("Price"));
                a.setTotalPrice(rs.getString("TotalPrice"));
                a.setFaHuo(rs.getString("FaHuo"));
                a.setTime(rs.getString("Time"));
                a.setStoreName(rs.getString("StoreName"));
                System.out.println(a.getId());
                System.out.println(a.getCaiMing());
                System.out.println(a.getNumber());
                System.out.println(a.getPrice());
                System.out.println(a.getTotalPrice());
                System.out.println(a.getFaHuo());
                System.out.println(a.getTime());
                System.out.println(a.getStoreName());
                order.add(a);
        	}        	
        	JDBCDao.closeConnecttion();
        	rs.close();
        }catch(Exception e) {
        	e.printStackTrace();
        }        
        request.setAttribute("order", order);
        RequestDispatcher rd=request.getRequestDispatcher("Order.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
