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
 <%int i=1;%>
 <c:forEach var="s" items="${dislist}"> 
<%if(i%2!=0){ %>
<span style="float:left;"><span style="float:left; width:100px;height:100px"><img src="${s.picture}" style="vertical-align:top" width="100px" height="100px"></span><span ><table><tr><td>${s.name}</td></tr><tr><td>李大狗<td></tr><tr><td>￥0.01</td></tr></table></span></span>
<%i++;}else{%>
<span style="folat:right"><span style="float:left ;width:100px;height:100px"><img src="${s.picture}" style="vertical-align:top" width="100px" height="100px"></span><span ><table><tr><td>${s.name}</td></tr><tr><td>李xiao<td></tr><tr><td>￥0.01</td></tr></table></span></span>
<br>
<%i++;} %>
</c:forEach>
</body>
</html>