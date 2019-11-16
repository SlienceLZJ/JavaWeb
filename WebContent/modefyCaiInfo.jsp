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
<form action="modefyCaiInfo?xiugai=true" method="post">
<tr>
<td>菜名:</td><td><input type="text" name="name" value="${info.foodName}"></td>
</tr>
<tr>
<td>菜品价格:</td><td><input type="text" name="price" value="${info.foodPrice}"></td>
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

<tr><td>菜品图片:</td><td><img src="${info.foodPicture}" alt="暂无图片" width=100px height=100px/></td></tr>
<tr><td>修改店铺图片</td><td><input type="file" name="picture"></td></tr>
<tr><td>商品描述：</td><td><textarea name="description" rows="5" cols="30"></textarea></td></tr>

<tr><td colspan="2"><center><input type="submit" value="保存"></center></td></tr>
 </form>
</table>
</center>

</body>
</html>