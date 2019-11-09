<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单</title>
<style type="text/css">
div.menu{height:50px;width:200px;background-color:red;text-algin:right;float:right}
</style>
</head>
<body>
<div>
<a:forEach var="s" items="${menu}"> 
<div class="menu" width="50px" background-color="red">
<a href="right.jsp#${s.foodtype}" target="right" >${s.foodtype }</a>
</div >
</a:forEach>
</div>
</body>
</html>