<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改菜品信息</title>
</head>
<body>

<center>
<table>

<tr>
<td>菜名:</td><td><input type="text" value="${info.foodName}"></td>
</tr>
<tr>
<td>菜品价格:</td><td><input type="text" value="${info.foodPrice}"></td>
</tr>

<tr>
<td>菜品类别</td>
<td>
<select size="1" name="foodType">
<c:forEach items="${list}" var="type">
<option value="${type.foodType}">${type.foodType}</option>
</c:forEach>
</select>
</td>
</tr>

<tr><td>菜品图片:</td><td><img src="${info.foodPicture}" width=100px height=100px/></td></tr>
<tr><td>修改店铺图片</td><input ></tr>

</table>
</center>

</body>
</html>