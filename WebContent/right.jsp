<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示菜品</title>
<style type="text/css">
span.dishs{float:left;display:block;background-color:white;width:400px; height:100px ;margin-top:5px;margin-left:10px;border:0.5px solid black;}
img.img1{vertical-align:top ; width:100px;height:100px;}
span.dishs1{float:left}
div.type{width:1000px;height:200px}
div.type1{width:800px;height:50px;margin-left:10px}
</style>
</head>
<body>
 <c:forEach var="a" items="${menu}">
 <div class="type">
 <a name="${a.foodtype}"></a>
 <div class="type1"><font size=5>${a.foodtype}</font></div>
 <c:forEach var="s" items="${dislist}"> 
<c:if test="${s.foodtype==a.foodtype}">
<span class="dishs"><span class="dishs1" ><img class="img1"src="${s.foodpicture}" ></span><span><table><tr><td>${s.foodname}</td></tr></tr><tr><td>${s.foodintroduction}</td></tr><tr></tr><tr><td><td><tr></tr><tr><td>￥:${s.foodprice}</td></tr></table><span><button type="button">加入购物车</button></span></span></span>
</c:if>
</c:forEach>
</div>
</c:forEach>
</body>
</html>