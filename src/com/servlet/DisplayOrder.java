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

import org.eclipse.jdt.internal.compiler.ast.ArrayAllocationExpression;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");//通知浏览器以何种码表打开
        response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");	
		String sellerNo="001";
		String userNo="101";
		
		String sql="select user.no,user.name,user.phone,user.address,foodOrder.CaiMing,foodOrder.Number,foodOrder.Price,foodOrder.TotalPrice,foodOrder.Time,foodOrder.FaHuo from user,foodOrder where foodOrder.no=user.no and foodOrder.SellerId='"+sellerNo+"'";
		
		System.out.println("the sql is :"+sql);
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
				orderInfo.setFaHuo(rs.getString("FaHuo"));
				orderInfo.setTime(rs.getString("Time"));
				list.add(orderInfo);			
			}
			
			//将订单放到数组里
			request.setAttribute("list", list);
			RequestDispatcher rd=request.getRequestDispatcher("displayOrder.jsp");
			rd.forward(request, response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
	}

}
