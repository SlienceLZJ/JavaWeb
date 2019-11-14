<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.domain.DianMingInformation" %>
       
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
  
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>点餐系统</title>
<style>
body{
  margin:0px;
  width:100%;
  height:100%;
}

</style>


</head>

<body bgcolor="#F5F5F5">


<div style="height:50px;">
<%@ include file="/WEB-INF/jsp/daohang.jsp" %>
</div>

<div>

<%
List<DianMingInformation> list=(List<DianMingInformation>)request.getAttribute("list");
%>


<div align="right" style="padding-right:40px;height:30px">
<form name="Form" action="DianMing" method="post" >
 检索店铺:<input type="text" name="jiansuo"/>&nbsp;<input type="submit" value="检索"/>
</form>
</div>


<center>
<table bgcolor="#FFFFFF">
 <tr>

<%

for(int i=0;i<list.size();i++){
	
	System.out.println("the value of i :"+i);
   DianMingInformation info=list.get(i);
   
   if(i%4==0&&i!=0){
	   out.println("</tr><tr>");                                                                                                                                                                                                                                                                            			
   
   }
	   out.println("<td><div style='width:300px;height:100px;border:1px solid #1E90FF';text-align:right;><a href='DisplayDishs?storeId='"+info.getStoreId()+"'><div style='float:left;width:34%'><img width=100px height=100px src='"+info.getPicture() +"'/></div><div style='float:left;width:66%;'>"+info.getName()+"<br><font size='2' color='blue'>"+info.getDescription()+"</font></div></a></div></td>");
	   System.out.println(info.getName());
 
}

%>

</tr>
</table>
</center>

</div>


</body>
</html>