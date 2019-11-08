<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.domain.DianMingInformation" %>
       
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
  
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>点餐系统</title>
</head>

<body bgcolor="#F5F5F5">


<div style="height:50px;">
<%@ include file="/WEB-INF/jsp/daohang.jsp" %>
</div>

<div>

<%
List<DianMingInformation> list=(List<DianMingInformation>)request.getAttribute("list");
%>


<div align="right" style="padding-right:20px;height:30px">
<form action="addStudent.do?action=addStudent" method="post">
 检索店铺:<input type="text" name="jiansuo"/>&nbsp;<input type="submit" value="检索"/>
</form>
</div>


<center>
<table bgcolor="#FFFFFF">
 <tr>

<%

System.out.println("the list size is :"+list.size());

for(int i=0;i<list.size();i++){
	
	System.out.println("the value of i :"+i);
   DianMingInformation info=list.get(i);
   
   if(i%4==0&&i!=0){
	   out.println("</tr><tr>");
   
   }
	   out.println("<td><div style='width:200px;height:100px;border:1px solid #1E90FF';text-align:right;><div style='float:left;width:50%'><img width=100px height=100px src='"+info.getPicture() +"'/></div><div style='float:left;width:50%;'>"+info.getName()+"</div></div></td>");
	   System.out.println(info.getName());
 
}

%>

</tr>
</table>
</center>

</div>


</body>
</html>