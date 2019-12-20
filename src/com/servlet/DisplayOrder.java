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


import com.dao.JDBCDao;
import com.domain.OrderBean;

/**
 * Servlet implementation class DisplayOrder
 */
@WebServlet("/DisplayOrder")
public class DisplayOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	private void fill(String sql,HttpServletRequest request,HttpServletResponse response,String type) {
		
		ResultSet rs=null;
		
		List<OrderBean> list=new ArrayList<OrderBean>();
		
		try {
			rs=JDBCDao.getData(sql);
			while(rs.next()) {
				OrderBean orderInfo=new OrderBean();
				orderInfo.setNo(rs.getString("no"));
				orderInfo.setAddress(rs.getString("address"));
				orderInfo.setCaiMing(rs.getString("CaiMing"));
				orderInfo.setName(rs.getString("name"));
				orderInfo.setNumber(rs.getString("Number"));
				orderInfo.setPrice(rs.getString("Price"));
				orderInfo.setTotalPrice(rs.getString("TotalPrice"));
				orderInfo.setPhone(rs.getString("phone"));	
				orderInfo.setTime(rs.getString("Time"));
				list.add(orderInfo);			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block

		}
		
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		RequestDispatcher rd=request.getRequestDispatcher("displayOrder.jsp");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");//通知浏览器以何种码表打开
        response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");	
		String sellerNo="001";
		String userNo="101";
		String sql=null;
		String weiSql="select user.no,user.name,user.phone,user.address,foodOrder.CaiMing,foodOrder.Number,foodOrder.Price,foodOrder.TotalPrice,foodOrder.Time,foodOrder.FaHuo from user,foodOrder where foodOrder.no=user.no and foodOrder.SellerId='"+sellerNo+"' and FaHuo='未发货'";
		String yiSql="select user.no,user.name,user.phone,user.address,foodOrder.CaiMing,foodOrder.Number,foodOrder.Price,foodOrder.TotalPrice,foodOrder.Time,foodOrder.FaHuo from user,foodOrder where foodOrder.no=user.no and foodOrder.SellerId='"+sellerNo+"' and FaHuo='已发货'";	;
		String type=request.getParameter("type");
		String op=request.getParameter("op");
		if(type!=null) {
			if(type.equals("no")) {//如果是查询未发货的订单					
				fill(weiSql,request,response,"no");
			}
			else {
				fill(yiSql,request,response,"yes");
			}			
		}
		else if(op!=null) {//如果用户选择了删除或发货订单
			String no=request.getParameter("userId");
			String time=request.getParameter("time");
			System.out.println("the time is "+time);
			System.out.println("the op is "+op);
			if(op.equals("confirm")) {//如果选择了确认收货
				sql="update foodOrder set FaHuo='已发货'  where no='"+no+"' and Time='"+time+"'";
				System.out.println("the sql is :"+sql);
				JDBCDao.insertOrDeleteOrUpdate(sql);//执行更新语句
				fill(weiSql, request, response,"no");
				
			}
			else {//如果用户选择了删除订单
				sql="delete from foodOrder where no='"+no+"' and Time='"+time+"'";
				System.out.println("the delete sql is "+sql);
				JDBCDao.insertOrDeleteOrUpdate(sql);//执行删除语句
				fill(yiSql, request, response, "yes");
			}
			
		}
		else {//如果为null的时候就默认显示未发货的
		fill(weiSql, request, response, "no");
		}
		
	}

}
