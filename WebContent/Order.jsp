<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="com.domain.OrderBeanCus,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户订单</title>
</head>
<body>
 <% 
	List<OrderBeanCus>list= (List<OrderBeanCus>)request.getAttribute("order");  	
 %>
<table align=center border='1'>
    <tr>
          <td>订单详情</td><td>总价</td><td>下单日期</td><td>卖家</td><td>是否收货</td>
    </tr>
    
     <%
   
     
     while(list.size()>0){
    	 OrderBeanCus order=list.get(0);
    	 String caiMing=order.getCaiMing();    	 
    	 String number=order.getNumber();
    	 String price=order.getPrice();
    	 String totalPrice=order.getTotalPrice();
    	 String faHuo=order.getFaHuo();    	 
    	 String time=order.getTime();
    	 String storeName=order.getStoreName();	 
    	 String id=order.getId();    	 
    	 list.remove(0);
    	 out.println("<tr>");
    	 out.println("<td>");
    	 out.println("<font size='1'>");
    	 out.println(caiMing+"X"+number+" 单价:"+price+"元<br>");//输出菜品详情
    	 out.println("</font>");
    	 
         for(int i=0;i<list.size();){//合并菜品详情
	     order=list.get(i);
	     if(id.equals(order.getId())&&(order.getTime().equals(time))){//如果是同一个客户的订单，并且是在同一时间下的订单则将菜品合并
	     caiMing=order.getCaiMing();
	     price=order.getPrice();
	     number=order.getNumber();
	     out.println("<font size='1'>");
	     out.println(caiMing+"X"+number+" 单价:"+price+"元<br>");//输出菜品详情
	     out.println("</font>");
	     list.remove(i);
	     }
	 else{
	    	i++;
	     }
}
out.println("</td>");
out.println("<td>");
out.println(totalPrice);//输出总价格
out.println("</td>");
out.println("<td>");
out.println(time);//输出下单日期
out.println("</td>");
out.println("<td>");
out.println(storeName);//输出卖家
out.println("</td>");
out.println("<td>");
out.println(faHuo);//输出是否发货
out.println("</td>");
out.println("</tr>");


     }
    	 %>
</table>

</body>
</html>