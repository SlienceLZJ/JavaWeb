<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.domain.OrderBean,java.util.List" %>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示订单</title>
</head>

<body>

<div style="width:100%;height:600px">

<div style="float:left;height:600px;background:#AA00FF; width:20%;">

<br>
<br>
<a href="DisplayOrder?type=no">未发货订单</a>
<br>
<br>
<br>
<a href="DisplayOrder?type=yes">已发货订单</a>
</div>

<div style="float:left;background:#AA0000; width:80%;height:600px;overflow-y:auto">
	<%
	  List<OrderBean>list= (List<OrderBean>)request.getAttribute("list"); 
    String type=(String)request.getAttribute("type");     	
	%>




<table border='1'>
	<tr>
	<td>姓名</td><td>电话</td><td>收货地址</td><td>订单详情</td><td>下单日期</td><td>总价</td>
	<%
	if(type.equals("no")){	
		out.println("<td>确认发货</td>");
	}
	else{
		out.println("<td>删除订单</td>");
	}
	%>
	
	</tr>
	
     <%
   
     
     while(list.size()>0){
    
    	 OrderBean order=list.get(0);
    	
    	 
    	 String no=order.getNo();    	 
    	 String name=order.getName();
    	 String address=order.getAddress();
    	 String phone=order.getPhone();
    	 String totalPrice=order.getTotalPrice();
    	 String time=order.getTime();
    	 String caiMing=order.getCaiMing();
    	 String price=order.getPrice();
    	 String number=order.getNumber();
    
    	 list.remove(0);
    	 
    	 out.println("<tr>");
    	 out.println("<td>");
    	 out.println(name);//输出姓名
    	 out.println("</td>");
    	 
    	 out.println("<td>");
    	 out.println(phone);//输出手机号
    	 out.println("</td>");
    	 
    	 out.println("<td>");
    	 out.println(address);//输出地址
    	 out.println("</td>");

    	 
    	 out.println("<td>");
    	 out.println("<font size='1'>");
    	 out.println(caiMing+"X"+number+" 单价:"+price+"元<br>");//输出菜品详情
    	 out.println("</font>");
    	 
for(int i=0;i<list.size();){//合并菜品详情
	 order=list.get(i);
	if(no.equals(order.getNo())&&(order.getTime().equals(time))){//如果是同一个客户的订单，并且是在同一时间下的订单则将菜品合并
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
out.println(time);//输出下单日期
out.println("</td>");



 out.println("<td>");
 out.println(totalPrice);//输出总价格
 out.println("</td>");

 out.println("<td>");
 if(type.equals("no")){%>	
	<a href="DisplayOrder?op=confirm&userId=<%=no%>&time=<%=time%>" onclick="return window.confirm('确定已发货？');">已发货</a> 
 <% }
 else{%>
	<a href="DisplayOrder?op=delete&userId=<%=no %>&time=<%=time%>" onclick="return window.confirm('确定删除订单？');">删除</a>
 
 <%}
 out.println("</td>");

 
 
out.println("</tr>");
  	 	
     }
  
     %>


	
</table>
</div>



</div>


</body>
</html>