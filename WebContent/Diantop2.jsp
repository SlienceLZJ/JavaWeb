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
<p><a href="ModStoreMsg" target="_blank">修改店铺信息</a></p>
<p><a href="DisplayOrder" target="_blank">查看订单</a></p>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%>
<p><a href="addfoodtype.jsp?id=<%=id %>" target="_blank">添加菜品种类</a></p>
<p><a href="addfood.jsp" target="_blank">添加菜品</a></p>
</center>
</body>
</html>