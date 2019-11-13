<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店铺页</title>
</head>
<body> 
<% System.out.println((String)request.getAttribute("id")); %>
<style>
#Diantop{border:5px solid #F00; width:1220px; height:150px}
#Diantop1{border:5px solid #F00;float:left; width:150px  ;height:150px}
#Diantop2{border:5px solid #F00;float:left; width:520px;  height:150px}
#Dianmid{border:5px solid #F00;  width:1220px;display: table;}
#Dianleft{border:5px solid #F00;float:left; width:150px ;display:table-cell;}
#Dianright{border:5px solid #F00;float:right; width:1050px;display:table-cell;}
</style>
<div id="Diantop" >
  <div id="Diantop1">
    <%@ include file="Diantop.jsp" %>
  </div>
  <div id="Diantop2">
   <%@ include file="Diantop1.jsp" %>
  </div>
  <div id="Diantop2">
   <%@ include file="Diantop2.jsp" %>
  </div>
</div>

<div id="Dianmid">
  <div id="Dianleft">
    <%@ include file="Dianleft.jsp" %>
  </div>
  <div id="Dianright">
  <%@ include file="Dianright.jsp"  %>
  </div>
</div>
</body>
</html>