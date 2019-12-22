<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%String id=(String)session.getAttribute("no"); %>
<table align=center>
    <tr>
           
           <td>订单的店铺名&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>订单菜名&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>菜品数量&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>菜品单价&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>下单时间&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>是否发货&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>订单总价&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
    </tr>
    <c:forEach var="s" items="${order}"> 
          
           <tr>
           
           <td>${s.sellerId}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </td>    
           <td>${s.caiMing}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>${s.number}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>￥:${s.price}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>￥:${s.time}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>￥:${s.faHuo}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           <td>￥:${s.totalPrice}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           </tr>
      </c:forEach>
</table>
<%  %>
</body>
</html>