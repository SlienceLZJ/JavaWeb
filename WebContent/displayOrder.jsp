<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.domain.OrderBean,java.util.List" %>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示订单</title>
<style>
input{
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 5px;
                font-family:宋体;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
div.z{margin-top:1px;width:100px;height:35px;line-height:35px;background-color:#46A3FF;border-radius:3px;color:white;text-align:center}
input.yes{width:70px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
input.rel{width:70px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
div.top{background-color:#46A3FF; width:100%; height:120px;font-family:宋体}
div.picture{float:left; width:200px;height:120px;}
div.wenzi{float:left; width:300px;height:120px;line-height:120px}
div.caozuo{float:left; width:1000px;height:120px;line-height:120px;font-size:22px}
div.aa{font-size:40px;font-family:宋体;}
div.main{margin-top:40px;width:1000px;margin-left:400px;height:700px;background-color:white}
a.a{text-decoration:none;color:white}
a.c{text-decoration:none;color:black}
table        {            border-collapse: collapse;            margin: 0 auto;            text-align: center;        } 
table td, table th        {            border: 1px solid #cad9ea;            color: #666;   width:200px  ;       height: 20px;        }
table thead th        {            background-color: #CCE8EB;            width: 200px;        }        
table tr:nth-child(odd)        {            background: #fff;        }        
table tr:nth-child(even)        {            background: #F5FAFA;        }
div.queren{;background-color:#46A3FF;width:60px;height:30px;line-height:30px;border-radius:5px;}
</style>
</head>

<body bgcolor="#F5F5F5">
<div class="top">
<div class="picture"> <img src="${d.getPicture()}" height="120" width="120" ></div>
<div class="wenzi"><div class="aa">${d.getName()}</div>
<div class="caozuo"><center>
<a href="ModStoreMsg" class="c"target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改店铺信息</a><a class="c" href="DisplayOrder" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;查看订单</a>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%><a class="c" href="addfood.jsp" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;添加菜品</a>
</center></div>
</div>
</div>
<div class="main">
<h2 class="title">查看订单</h2>
<div style="width:100%;height:600px">

<div style="float:left;height:600px;background:white; width:13%;">

<br>
<br>
<div  class="z"><a href="DisplayOrder?type=no" style="text-decoration:none;color:white">未发货订单</a></div>
<br>
<br>
<br>
<div class="z"><a href="DisplayOrder?type=yes" style="text-decoration:none;color:white">已发货订单</a></div>
</div>

<div style="margin-top:40px;float:left;background:white; width:80%;height:600px;overflow-y:auto">
	<%
	  List<OrderBean>list= (List<OrderBean>)request.getAttribute("list"); 
    String type=(String)request.getAttribute("type");     	
	%>




<table class="table">
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
	<center><div class="queren"><a class="a" href="DisplayOrder?op=confirm&userId=<%=no%>&time=<%=time%>" onclick="return window.confirm('确定已发货？');">确定</a></div></center> 
 <% }
 else{%>
	<center><div class="queren"><a class="a"  href="DisplayOrder?op=delete&userId=<%=no %>&time=<%=time%>" onclick="return window.confirm('确定删除订单？');">删除</a></div></center>
 
 <%}
 out.println("</td>");
out.println("</tr>");
  	 	
     }
  
     %>


	
</table>
</div>



</div>

</div>
</body>
</html>