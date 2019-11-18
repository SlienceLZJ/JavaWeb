package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.domain.GoodsItem;
import com.domain.ShoppingCar;

/**
 * Servlet implementation class EmptyRemovecar
 */
@WebServlet("/EmptyRemovecar")
public class EmptyRemovecar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmptyRemovecar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");			
		HttpSession session=request.getSession();
	    ShoppingCar shoppingcar=(ShoppingCar)session.getAttribute("shoppingcar");
	    String foodname=request.getParameter("removedishs");
	    System.out.print(foodname);
	    GoodsItem goodsitem=null;
	    for(GoodsItem goods:shoppingcar.getItems()) {
	    	if(goods.getDishs().getFoodname().equals(foodname)) {
	    		goodsitem=goods;
	    		break;
	    	}
	    	
	    }
	    shoppingcar.remove(goodsitem.getDishs().getFoodname());
	    session.setAttribute("shoppingcar", shoppingcar);
	    response.sendRedirect("emptygoods.jsp");
	    
	}
	}


