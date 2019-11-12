package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dao.JDBCDao;
import com.domain.DianMingInformation;

/**
 * Servlet implementation class ModStoreMsg
 */
@WebServlet("/ModStoreMsg")
public class ModStoreMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		Part picture=request.getPart("picture");
		System.out.println("the name is :"+name);
		System.out.println("the part is null?"+(picture==null));
		
		
		
		
					//如果用户提交了保存的信息，则将表单的数据进行更新
				if(name!=null) {
					
				
				String description=request.getParameter("description");
				//Part picture=request.getPart("picture");
				System.out.println("name is :"+name);
				/*
				if(picture==null) {
					System.out.println("picture is null");
				}
				else {
					System.out.println("picture is not null");
				}
				
				
				String path=this.getServletContext().getRealPath("/")+"WebContent\\storePicture\\"+"001.jpg";					
				//File f=new File(path);
			    picture.write(path);
						
				System.out.println("文件目录为："+path);
							*/			
				}
		
		
		
		
		
		
		String sql;
		DianMingInformation info=new DianMingInformation();	
		sql="select * from DianMing where id='001'";	
		try {
			ResultSet rs=JDBCDao.getData(sql);	
			System.out.println("have");
			while(rs.next()) {
				System.out.println("no have");
			info.setName(rs.getString("name"));
			info.setPicture(rs.getString("picture"));
			info.setStoreId(rs.getString("id"));
			info.setDescription(rs.getString("description"));
			}
						
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

		
		
		
		 request.setAttribute("info", info);
		 RequestDispatcher rd = request.getRequestDispatcher("modStoreMsg.jsp");
		 rd.forward(request, response);
		
	}
}
