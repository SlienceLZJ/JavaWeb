package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.eclipse.jdt.internal.compiler.apt.model.NoTypeImpl;

import com.dao.JDBCDao;
import com.domain.*;

@WebServlet("/modefyCaiInfo")
@MultipartConfig(location="C:\\jspCache",fileSizeThreshold=1024*5)
public class modefyCaiInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		
		
		
		HttpSession session=request.getSession();
		String xiuGai=request.getParameter("xiugai");
		
		String no=(String)session.getAttribute("no");	
		String name;
		String price;
		String describtion;
		String type;
		String picture;
		
		if(xiuGai!=null&&xiuGai.equals("true")) {//如果是用户提交的表单请求,则将修改内容保存到数据库
			 picture=request.getParameter("picPath");
			 String A=picture;
			// A.replaceAll("\\", "\\\\");
			 System.out.println("pic path is "+A);
			 
			name=request.getParameter("name");
			price=request.getParameter("price");
			describtion=request.getParameter("description");
			System.out.println("the description is "+describtion);
			type=request.getParameter("foodType");
			String path = this.getServletContext().getRealPath("/")+picture;	
			System.out.println("the path is "+path);
			Part part=request.getPart("picture");
			if(part.getSize()!=0.0) {
				part.write(path);
			}
			
			String sql="update Dian set 			foodname='"+name+"',foodprice='"+price+"',foodintroduction='"+describtion+"',foodtype='"+type+"' 			where id='"+no+"' and foodpicture='"+picture+"'";
			System.out.println("sql is "+sql);
			JDBCDao.insertOrDeleteOrUpdate(sql);
			
			request.setAttribute("msg", "修改成功!");
			
		}
		else {
			System.out.println("the else is executed");
			name=request.getParameter("foodname");
			price=request.getParameter("foodprice");
			describtion=request.getParameter("foodIntroduction");
			type=request.getParameter("type");	
			picture=request.getParameter("foodpicture");
		}
		
		
		
		System.out.println("the name of cai is :"+name);
		com.domain.Dian info=new com.domain.Dian();
		info.setId(no);
		info.setFoodName(name);
		info.setFoodIntroduction(describtion);
		info.setFoodType(type);
		info.setFoodPicture(picture);
		info.setFoodPrice(price);
		request.setAttribute("info", info);
		
		
		/*---------------获取店铺类别↓-------------------*/
		 String sql="select foodtype,id from menu where id='"+no+"'";
		 List<Menu> list=new ArrayList<Menu>();
		 try {
		 	ResultSet rs=JDBCDao.getData(sql);
		 	
		 	while(rs.next()) {
		 	Menu leibie=new Menu();	
		 	leibie.setId(rs.getString("id"));
		 	leibie.setFoodType(rs.getString("foodtype"));	
		 	list.add(leibie);
		 	System.out.println("result set is "+rs.getString("id"));
		 	}
		 } catch (SQLException e) {
		 	// TODO Auto-generated catch block
		 	e.printStackTrace();
		 }
		
		 request.setAttribute("list", list);
		 
		/*---------------获取店铺类别↑-------------------*/
		

			RequestDispatcher rd=request.getRequestDispatcher("modefyCaiInfo.jsp");
			rd.forward(request, response);
	}

}
