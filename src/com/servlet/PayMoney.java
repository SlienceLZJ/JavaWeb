package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JDBCDao;
import com.domain.AddressInfo;
@WebServlet("/PayMoney")
public class PayMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public PayMoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession n1=request.getSession();
		String no=(String) n1.getAttribute("no");
		String sql="SELECT * FROM user WHERE no='"+no+"'";
		ResultSet result;
		try {
			result = JDBCDao.getData(sql);
		
			AddressInfo addressinfo=new AddressInfo();
			while(result.next()) {
				String username=result.getString("name");
				addressinfo.setName(username);
				String phone=result.getString("phone");
				addressinfo.setPhone(phone);
				String address=result.getString("address");
				addressinfo.setAddress(address);
			}
			JDBCDao.closeConnecttion();
			HttpSession session=request.getSession();
			session.setAttribute("addressinfo", addressinfo);
			response.sendRedirect("Money.jsp");
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		
	}

}
