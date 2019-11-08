<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.domain.DianMingInformation" %>
       
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
  
    
<!DOCTYPE html>
<html>
<head>


 <style>
.box{width:100px; text-align:center; font-szie:5px;margin:10px 10px 10px 10px;}
.box img {width:100px;height:100px}
</style> 

<meta charset="UTF-8">
<title>点餐系统</title>
</head>

<body bgcolor="#D3D3D3">



<div>
<%@ include file="/WEB-INF/jsp/daohang.jsp" %>
</div>



<%
List<DianMingInformation> list=(List<DianMingInformation>)request.getAttribute("list");
%>


<center>
<table bgcolor="#FFFFFF">
 <tr>

<%

System.out.println("the list size is :"+list.size());

for(int i=0;i<list.size();i++){
	
	System.out.println("the value of i :"+i);
   DianMingInformation info=list.get(i);
   
   if(i%3==0&&i!=0){
	   out.println("</tr><tr>");
   
   }
	   out.println("<td><div class='box'><img src='"+info.getPicture() +"'/>"+info.getName()+"</div></td>");
	   System.out.println(info.getName());
	   
   
   
}

%>

</tr>
</table>
</center>


</body>
</html>