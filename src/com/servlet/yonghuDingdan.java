package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	
	
private void fill(String sql,HttpServletRequest request,HttpServletResponse response,String type) {

		ResultSet rs=null;
		
		List<OrderBeanCus> list=new ArrayList<OrderBeanCus>();
		
		try {
			System.out.println("the sql is------:"+sql);
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
				list.add(a);			
			}
			JDBCDao.closeConnecttion();
			

			if(rs==null) {
				System.out.println("the rs is null");
			}
			else {
				System.out.println("the rs is not null");
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block

		}
		
		request.setAttribute("list", list);
		request.setAttribute("type", type);
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id= (String)request.getSession().getAttribute("no");
        System.out.println(id);
        ArrayList<OrderBeanCus>  order=new ArrayList<OrderBeanCus>();
		String sql=null;
        String weiSql="select * from foodOrderCus where Id='"+id+"' and FaHuo='确认收货'";
        String yiSql="select * from foodOrderCus where Id='"+id+"' and FaHuo='已收货'";
        String type=request.getParameter("type");
    	String op=request.getParameter("op");
    	
    	
    	System.out.println("the value of type is :"+type);
    	System.out.println("the value of op is :"+op);
    	if(type!=null) {
    		if(type.equals("no")) {//如果是查询未发货的订单					
				fill(weiSql,request,response,"no");
			}
			else {
				fill(yiSql,request,response,"yes");
			}	
    	}
    	else if(op!=null) {
    		String time=request.getParameter("time");
    		if(op.equals("confirm")) {//如果选择了确认收货
				sql="update foodOrderCus set FaHuo='已收货'  where Id='"+id+"' and Time='"+time+"'";
				System.out.println("the sql is :"+sql);
				JDBCDao.insertOrDeleteOrUpdate(sql);//执行更新语句
				fill(weiSql, request, response,"no");
				JDBCDao.closeConnecttion();
			}
			else {//如果用户选择了删除订单
				sql="delete from foodOrderCus where Id='"+id+"' and Time='"+time+"'";
				System.out.println("the delete sql is "+sql);
				JDBCDao.insertOrDeleteOrUpdate(sql);//执行删除语句
				JDBCDao.closeConnecttion();
				fill(yiSql, request, response, "yes");
			}
    		
    	}
    	else {//如果为type和op都为null的时候就默认显示为确认收货的
    		fill(weiSql, request, response, "no");
    	}

	}
    	
    	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
