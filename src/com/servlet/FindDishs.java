package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JDBCDao;
import com.domain.DishsInformation;
import com.mysql.cj.protocol.Resultset;
@WebServlet("/FindDishs")
public class FindDishs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindDishs() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("foodname");
		int i=0;
		if(name!="") {
		String id=request.getParameter("id");
		System.out.print(id);
		String sql="SELECT * FROM Dian WHERE id='"+id+"' AND foodname like'%"+name+"%'";
		ArrayList <DishsInformation> dislist=new ArrayList<DishsInformation>();
		ArrayList <DishsInformation> menu=new ArrayList<DishsInformation>();
		try {
			ResultSet result=JDBCDao.getData(sql);
			 
			while(result.next()) {
				i++;
				DishsInformation dis=new DishsInformation();
				String foodname=result.getString("foodname");
				String foodid=result.getString("id");
				String foodintroduction=result.getString("foodintroduction");
				Float foodprice=result.getFloat("foodprice");
				String foodtype=result.getString("foodtype");
				String foodpicture=result.getString("foodpicture"); 
				System.out.print(foodname);
				dis.setFoodname(foodname);
				dis.setFoodpicture(foodpicture);
				dis.setFoodintroduction(foodintroduction);
				dis.setFoodprice(foodprice);
				dis.setFoodid(foodid);
				dis.setFoodtype(foodtype);
			    dislist.add(dis);
			    menu.add(dis);
			}
			 JDBCDao.closeConnecttion();
			if(i==0)
				response.sendRedirect("/JavaWeb/emptygoods.jsp");
			else {	
			    result.close();
			  
			 request.getSession().setAttribute("finddislist", dislist);
			 response.sendRedirect("/JavaWeb/Findishs.jsp");}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else {
			response.sendRedirect("/JavaWeb/right.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
