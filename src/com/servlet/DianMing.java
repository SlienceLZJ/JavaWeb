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
import com.utils.*;
import com.dao.JDBCDao;
import com.domain.DianMingInformation;
import com.mysql.cj.jdbc.result.ResultSetMetaData;
import com.sun.javafx.reflect.MethodUtil;


/**
 * Servlet implementation class DianMing
 */
@WebServlet("/DianMing")

public class DianMing extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);		
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");//通知浏览器以何种码表打开
        response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");	
		
		
		HttpSession session=request.getSession(true);
		String jiansuo=request.getParameter("jiansuo");
		
		
	String sql="select * from DianMing";	

		List<DianMingInformation> list=new ArrayList<DianMingInformation>();
	System.out.println("sql is :"+sql);
		try {
			ResultSet rs=JDBCDao.getData(sql);	



			while(rs.next()) {

				DianMingInformation info1=new DianMingInformation();	
				String name=rs.getString("name");
				
				if(jiansuo!=null) {//当有检索词的时候
					System.out.println("-----------");
					if(jiansuo.contains(name)||name.contains(jiansuo)) {//如果模糊匹配上了
					
						info1.setName(rs.getString("name"));
						info1.setPicture(rs.getString("picture"));
						info1.setStoreId(rs.getString("id"));
						info1.setDescription(rs.getString("description"));
						list.add(info1);	
					}
					else {
						continue;
					}
		
				}
				else {//当无检索词的时候
				
						info1.setName(rs.getString("name"));
			info1.setPicture(rs.getString("picture"));
			info1.setStoreId(rs.getString("id"));
			info1.setDescription(rs.getString("description"));
			list.add(info1);	
					
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("the list size is:"+list.size());
		
		request.setAttribute("list", list);
          
		 RequestDispatcher rd = request.getRequestDispatcher("dianming.jsp");
		 rd.forward(request, response);
	
		 
		 
		 
	}

}
