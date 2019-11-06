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
 <c:forEach var="s" items="${dislist}">
  <tr>
     <td>${s.name}</td><img src="${s.picture}" width="50px" height="50px"><td>
  </tr><p>
</c:forEach>
</body>
</html>