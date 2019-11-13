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

@WebServlet("/RemoveDishs")
public class RemoveDishs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveDishs() {
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
		response.setCharacterEncoding("UTF-8");//通知浏览器以何种码表打开
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
	    response.sendRedirect("/JavaWeb/right.jsp");
	    
	}

}
