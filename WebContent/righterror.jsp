<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示菜品</title>
<style type="text/css">
span.dishs{float:left;display:block;background-color:white;width:400px; height:100px ;margin-top:2px;margin-left:10px;border:0.5px solid black;}
img.img1{vertical-align:top ; width:100px;height:100px;}
span.dishs1{float:left}
div.type{width:830px;height:150px;background-color:green}
div.type1{width:820px;height:30px;margin-left:10px;background-color:yellow}
div.daohang{height:250px}
div.main{background-color:red;width:1200px}
div.Menu{height:800px;width:100px;text-align:right;background-color:black;}
div.a{width:830px;background-color:blue;float:left}
div.sousou{width:200px;background-color:yellow;height:600px;float:left}
</style>
<script type="text/JavaScript">
  function Addcar(String){
  }
</script>
</head>
<body>
<div >
<div class="main">
    <div class=a>
    <c:forEach var="a" items="">
      <div class="type"><a name="${a.foodtype }"></a>
       <div class="type1"><font size=5>${a.foodtype}</font></div>
      <c:forEach var="s" items="${finddislist}"> 
       <c:if test="${s.foodtype==a.foodtype}">
         <span class="dishs"><span class="dishs1" ><img class="img1"src="${s.foodpicture}" ></span><span><table><tr><td>${s.foodname}</td></tr></tr><tr><td>${s.foodintroduction}</td></tr><tr></tr><tr><td>￥:${s.foodprice}</td></tr></table><span><button type="button" onclick="Addcar();">加入购物车</button></span></span></span>
       </c:if>
      </c:forEach>
      </div>
    </c:forEach>
</div>
<div class="sousou">
<form action="FindDishs">
<input type="text" name="foodname" size=10>
<input name="id" type="hidden"value="${dislist[0].foodid}">
<input type="submit" name="id" value="查询">
</form>
</div>
</div>
</div>
</body>
</html>