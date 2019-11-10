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
		JDBCDao jd=new JDBCDao();
		String name=request.getParameter("foodname");
		String id=request.getParameter("id");
		String sql="SELECT * FROM Dian";
		String sql1="SELECT * FROM menu";
		ArrayList <DishsInformation> dislist=new ArrayList<DishsInformation>();
		ArrayList <DishsInformation> menu=new ArrayList<DishsInformation>();
		try {
			ResultSet result=jd.getData(sql);
			while(result.next()) {
				DishsInformation dis=new DishsInformation();
				String foodname=result.getNString("foodname");
				if(foodname.contains(name)) {
				String foodid=result.getNString("id");
				String foodintroduction=result.getNString("foodintroduction");
				Float foodprice=result.getFloat("foodprice");
				String foodtype=result.getNString("foodtype");
				String foodpicture=result.getNString("foodpicture"); 
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
			}
			    result.close();
			    jd.closeConnecttion();
			 request.getSession().setAttribute("dislist", dislist);
			 response.sendRedirect("/JavaWeb/right.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
