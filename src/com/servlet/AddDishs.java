package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.domain.DishsInformation;
import com.domain.GoodsItem;
import com.domain.ShoppingCar;
import com.mysql.cj.Session;

@WebServlet("/AddDishs")
public class AddDishs extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddDishs() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String foodname=null;
		int quantity=0;
	    foodname=request.getParameter("addcar");
	    DishsInformation dishs=getDishsinformation(request,response,foodname);
	    if(dishs!=null) {
	    	GoodsItem goodsitem=new GoodsItem(dishs);
	    	HttpSession session=request.getSession();
	    	ShoppingCar shoppingcar=(ShoppingCar)session.getAttribute("shoppingcar");
	    	if(shoppingcar==null) {
	    		shoppingcar=new ShoppingCar();
	    		session.setAttribute("shoppingcar",shoppingcar);
	    	}
	    	shoppingcar.add(goodsitem);
	    	response.sendRedirect("right.jsp");
	    }
		}catch(Exception e) {
			e.printStackTrace();
		}
	    
	}
	private DishsInformation getDishsinformation(HttpServletRequest request, HttpServletResponse response,String foodname) {
		HttpSession session=request.getSession();
		ArrayList<DishsInformation> dislist=(ArrayList<DishsInformation>) session.getAttribute("dislist");
		for(DishsInformation dishs: dislist) {
			if(dishs.getFoodname()==foodname) {
				return dishs;
			}
		}
		return null;
	}
}
