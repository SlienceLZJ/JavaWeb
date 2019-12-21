package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JDBCDao;
import com.domain.OrderBean;
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
        ArrayList<OrderBean>  order=new ArrayList<OrderBean>();
        String sql="select * from foodOrder where no='"+id+"'";
        ResultSet rs;
        try {
        	rs=JDBCDao.getData(sql);
        	while(rs.next()) {
                OrderBean a=new OrderBean();
                a.setsellerId(rs.getString("SellerId"));
                a.setCaiMing(rs.getString("CaiMing"));
                a.setNumber(rs.getString("Number"));
                a.setPrice(rs.getString("Price"));
                a.setTime(rs.getString("Time"));
                a.setFaHuo(rs.getString("FaHuo"));
                a.setTotalPrice(rs.getString("TotalPrice"));
                System.out.println(a.getsellerId());
                System.out.println(a.getCaiMing());
                System.out.println(a.getNumber());
                System.out.println(a.getPrice());
                System.out.println(a.getTime());
                System.out.println(a.getFaHuo());
                System.out.println(a.getTotalPrice());
                order.add(a);
        	}        	
        	JDBCDao.closeConnecttion();
        	rs.close();
        }catch(Exception e) {
        	e.printStackTrace();
        }        
        request.getSession().setAttribute("order", order);
        response.sendRedirect("Order.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
