<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*,com.domain.DianMingInformation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改店铺信息</title>
</head>
<body>


<br>
<br>
<br>
<br>
<br>
<br>
<center>
<form action="ModStoreMsg" method="post" enctype="multipart/form-data">
	<table>					
			<tr><td>
				修改店名:
			   </td>
			   <td>
			   <input type="text" name="name" value="${info.name}">
			   </td>
			</tr>

			<tr>
			<td>修改店铺描述:</td>
			
			<td><input type="text" name="description" value="${info.description }"></td></tr>
				
	
	
			<tr><td>店铺图片:</td>			
			<td>
			<img width=50px height=50px src="${info.picture}" alt="当前店铺暂无图片"/>
			</td>			
			</tr>
			
			<tr>
			<td>
		 	更新店铺图片
			</td>
			<td>
			<input type="file" name="picture"/>	
			</td>			
			</tr>
			
			<tr>					
			<td colspan="2">
			<center>
			<input type="submit" value="保存">
			</center>
			</td>					
			</tr>
			
				
	
		
	</table>
		</form>

${update}
</center>



</body>
</html>