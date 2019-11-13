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
<form action="UserAddrInfor?type=biaodan" method="post">
	<table>					
			<tr><td>
				修改收货人名称:
			   </td>
			   <td>
			   <input type="text" name="name" value="${info.name}">
			   </td>
			</tr>

			<tr>
			<td>修改收货人号码:</td>			
			<td><input type="text" name="phone" value="${info.phone}"></td></tr>
			
						<tr>
			<td>修改收货人地址:</td>			
			<td><input type="text" name="address" value="${info.address}"></td></tr>
											
			<tr>					
			<td colspan="2">
			<center>
			<input type="submit" value="保存">
			</center>
			</td>					
			</tr>
				
	</table>
		</form>

${msg}

</center>



</body>
</html>