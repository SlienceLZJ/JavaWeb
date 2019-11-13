<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList"
     import="com.domain.DianMingInformation"
     import="com.dao.*"
     import="com.mysql.cj.jdbc.result.ResultSetMetaData"
     import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<p>修改店铺信息</p>
<p>查看订单</p>
<% String id=(String)request.getAttribute("id");
   System.out.println("Diantop2  id"+id);
%>
<p><a href="addfood.jsp?id=<%= id %>">添加菜品</a></p>
</center>

</body>
</html>