<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.domain.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示菜品</title>
<style type="text/css">
span.dishs{float:left;display:block;background-color:white;width:400px; height:100px ;margin-top:2px;margin-left:10px;border:0.5px solid black;}
img.img1{vertical-align:top ; width:100px;height:100px;}
span.dishs1{float:left;}
div.type{width:830px;height:300px;}
div.type1{width:820px;height:30px;margin-left:10px;margin-top:10px;margin-botton:10px}
div.tibu{float:left;display:block;width:400px; height:100px ;margin-top:2px;margin-left:10px;}
div.daohang{height:250px}
div.main{background-color:gray;width:1200px;}
div.Menu{height:800px;width:100px;text-align:right;}
div.a{width:830px;float:left;}
div.sousou{float:left;}
div.cartop{width:300px;height:30px;line-height:30px;}
div.shopcar{ bottom:0;right:0;position:fixed;background-color:yellow;width:300px}
div.carmain{background-color:white;width:300px;background-color:white;}
div.carbottom{width:300px;height:50px;background-color:blue;line-height:50px;}
div.bottomleft{width:200px;float:left;height:50px}
div.bottomright{width:100px;float:right;height:50px}
div.foodname{width:50px;float:left}
div.foodquantity{width:200px;float:left}
div.foodtotalprice{width:50px;float:left}
div.carmains{width:300px;height:30px;background-color:white;}
div.ab{width:300px;height:10px;background-color:white;}
</style>
</head>
<body>
<div >
<div class="main">
    <div class=a>
    <c:forEach var="a" items="${menu1}">
      <div class="type"><a name="${a.foodtype }"></a>
       <div class="type1"><font size=5>${a.foodtype}</font></div>
       <%int i=0;%>
      <c:forEach var="s" items="${dislist1}"> 
       <c:if test="${s.foodtype==a.foodtype}">
       <%i++;%>
         <span class="dishs"><span class="dishs1" ><img class="img1"src="${s.foodpicture}" ></span>
         <span>
          <table>
           <tr>
            <td>${s.foodname}</td>
          </tr>
          <tr>
            <td>${s.foodintroduction}</td>
          </tr>
         <tr></tr>
         <tr>
           <td>￥:${s.foodprice}</td>
        </tr>
        </table>
        <span>
         <table>
        <tr><td><form action="zhenyuan修改" method="post">
          <input type="hidden" name="foodname" value="${s.foodname}">
          <input type="hidden" name="id" value="<%= (String)request.getAttribute("id")%>">
          <input type="submit" value="修改">
          </form>
          </td><td>
          <form action="Delete" method="post">
          <input type="hidden" name="foodname" value="${s.foodname}">
          <input type="hidden" name="id" value="${s.foodid}">
          <input type="submit" value="删除">
          </form>
          </td></tr>
          </table>
        
        </span>
        </span>
        </span>
       </c:if>
      </c:forEach>
      <%if(i%2!=0){%>
      <div class="tibu"></div>
      <%} %>
      </div>
    </c:forEach>
</div>
<div class="sousou">
<div>
<form action="FindDishs">
<input type="text" name="foodname" size=20>
<input name="id" type="hidden"value="${dislist[0].foodid}">
<input type="submit" name="id" value="查询">
</form>
</div>

</div>
</div>
</div>
</body>
</html>