<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单</title>
<style type="text/css">
div.menu{height:50px;width:50px;margin-top:5px}
</style>
</head>
<body>
<div style="float:right;position:fixed">
<a:forEach var="s" items="${menu1}"> 
<div class="menu" >
<a href="Login#${s.foodtype}" target="_blank"><font size=4>${s.foodtype }</font></a>
</div >
</a:forEach>
</div>

</body>
</html>