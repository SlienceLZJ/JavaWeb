package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JDBCDao;
import com.domain.AddressInfo;

/**
 * Servlet implementation class UserAddrInfor
 */
@WebServlet("/UserAddrInfor")
public class UserAddrInfor extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);		
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");//通知浏览器以何种码表打开
        response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");	
		
		
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String name=request.getParameter("name");
		String type=request.getParameter("type");
				String no="101";
				String sql;
				
				System.out.println("the value of type is :"+type);
				
				if(type!=null&&type.equals("biaodan")) {//如果是从表单传来的请求
					System.out.println("biaodan request is executed");
					
					sql="update user set name='"+name+"',phone='"+phone+"' ,address='"+address+"' where no='"+no+"'";
					
					int result=JDBCDao.insertOrDeleteOrUpdate(sql);
					JDBCDao.closeConnecttion();
					System.out.println("the value of result is "+result);
					request.setAttribute("msg", "更新成功");

				}

				
				
				/*--------------------从数据库获取数据----------------------*/
		
				sql="select phone,name,address from user where no='"+no+"'";
				AddressInfo info=new AddressInfo();
				try {
					ResultSet rs=JDBCDao.getData(sql);
				
					while(rs.next()) {
						info.setAddress(rs.getString("address"));
						info.setPhone(rs.getString("phone"));
						info.setName(rs.getString("name"));						
					}
					JDBCDao.closeConnecttion();
	
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//将消息bean里的消息发送给jsp
				request.setAttribute("info", info);
				RequestDispatcher rd=request.getRequestDispatcher("modUserAddrInfo.jsp");
				rd.forward(request, response);
	
	}

}
