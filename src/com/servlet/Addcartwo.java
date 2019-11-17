package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.domain.DishsInformation;
import com.domain.GoodsItem;
import com.domain.ShoppingCar;

/**
 * Servlet implementation class Addcartwo
 */
@WebServlet("/Addcartwo")
public class Addcartwo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addcartwo() {
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
	    String foodname=null;
		int quantity=0;
	    foodname=request.getParameter("addcar");
	    System.out.print(foodname);
	    DishsInformation dishs=getDishsinformation(request,response,foodname);
	    if(dishs!=null) {
	    	GoodsItem goodsitem=new GoodsItem(dishs);
	    	HttpSession session=request.getSession();
	    	ShoppingCar shoppingcar=(ShoppingCar)session.getAttribute("shoppingcar");
	    	if(shoppingcar==null) {
	    		shoppingcar=new ShoppingCar();
	    	}
	    	shoppingcar.add(goodsitem);
	    	session.setAttribute("shoppingcar",shoppingcar);
	    }
	    response.sendRedirect("Findishs.jsp");
	}
	private DishsInformation getDishsinformation(HttpServletRequest request, HttpServletResponse response,String foodname) {
		HttpSession session=request.getSession();
		ArrayList<DishsInformation> dislist=(ArrayList<DishsInformation>) session.getAttribute("dislist");
		for(DishsInformation dishs: dislist) {
			if(dishs.getFoodname().equals(foodname)) {
				System.out.print(foodname+"123");
				return dishs;
			}
			else {
				System.out.print("找不到！");
			}
		}
		return null;
	}
}
