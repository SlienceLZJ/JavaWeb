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
		
		
		
		String sql;
		//当用户输入检索词的时候
		 if((jiansuo!=null)&&(!jiansuo.equals(""))) {
			 
			 jiansuo="%"+CommonUtil.hexStr2Str(jiansuo)+"%";
			 
		sql="select * from DianMing where name like '"+jiansuo+"';";	
		System.out.println("sql 语句为:"+sql);
		jiansuo = null;
		 }else {//无检索词则检索所有店铺			 
			 sql="select * from DianMing;";				
		 }
		
		List<DianMingInformation> list=new ArrayList<DianMingInformation>();
						
		try {
			ResultSet rs=JDBCDao.getData(sql);	
			//System.out.println("no hava");
			if(rs != null) {
				System.out.println("数据集不为空");
			}
			System.out.println(rs.next());
			System.out.println(rs.getString(0));
			while(rs.next()) {
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				String id = rs.getString("id");
				System.out.println(name);
				DianMingInformation info=new DianMingInformation();	
				info.setName(name);
				info.setPicture(picture);
				info.setStoreId(id);
				list.add(info);	
		
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
