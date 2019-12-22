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
span.dishs{float:left;display:block;background-color:white;width:400px; height:100px ;margin-top:2px;margin-left:10px;background:#D2E9FF;font-size:15px}
img.img1{vertical-align:top ; width:100px;height:100px;}
span.dishs1{float:left;font-size:15px}
div.menu{height:50px;width:70px;margin-top:5px;margin-top:12px}
div.type{width:830px;height:300px;}
div.type1{width:820px;height:30px;margin-left:10px;margin-top:10px;margin-botton:10px；font-family:宋体}
div.tibu{float:left;display:block;width:400px; height:100px ;margin-top:2px;margin-left:10px;}
div.main{background-color:white;width:1200px;}
div.Menu{height:800px;width:100px;text-align:right;}
div.a{width:830px;float:left;}
div.sousou{float:left;}
div.ab{width:300px;height:10px;background-color:white;}
div.left{width:100px;float:left;background-color:white}
div.ma{background-color:white}
span.l{font-size:10px}
input.mod{width:70px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
input.del{width:70px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
</style>
</head>
<body bgcolor="#F5F5F5">
<div class="left" ">
<c:forEach var="s" items="${menu1}"> 
<div class="menu" >
<a href="#${s.foodtype}" style="text-decoration:none" ><font size=4 color="black">&nbsp;${s.foodtype }</font></a>
</div >
</c:forEach>
</div>
<div class=""ma>
<div class="main">
    <div class=a>
    <c:forEach var="a" items="${menu1}">
      <div class="type"><a style="" name="${a.foodtype }"></a>
       <div class="type1"><font size=5" ">${a.foodtype}</font></div>
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
        <span class="l">
         <table>
        <tr><td><form action="modefyCaiInfo" method="post" target="_blank">
          <input type="hidden" name="foodname" value="${s.foodname}">
          <input type="hidden" name="foodpicture" value="${s.foodpicture}">
          <input type="hidden" name="foodprice" value="${s.foodprice}">
          <input type="hidden" name="foodtype" value="${s.foodtype}">
          <input type="hidden" name="foodIntroduction" value="${s.foodintroduction}">
          <input type="hidden" name="foodid" value="${s.foodid}">       
          <input type="hidden" name="id" value="<%= (String)request.getAttribute("id")%>">
          <input type="submit" class="mod"  size="25" value="修改">
          </form>
          </td><td>
          <form action="Delete" method="post" >
          <input type="hidden" name="foodname" value="${s.foodname}">
          <input type="hidden" name="id" value="${s.foodid}">
          <input type="submit" class="del" size="25" value="删除">
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
</div>
</div>
</body>
</html>