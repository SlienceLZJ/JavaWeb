<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*,com.domain.DianMingInformation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改店铺信息</title>
<style>
input{          border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                font-family:宋体;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s}
div.Top{height:50px}
div.mod{margin-top:40px;width:900px;margin-left:400px;height:600px;background-color:white;font-family:宋体}
input.baocun{margin-top:15px;width:340px;height:37px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
</style>
</head>
<body bgcolor="#F5F5F5">
<div class="Top">
<%@ include file="/WEB-INF/jsp/daohang.jsp" %>
</div>
<br>
<div class="mod">
<h2><font face="宋体">修改信息</font></h2>
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
			   <input type="text" size=30 name="name" value="${info.name}">
			   </td>
			</tr>

			<tr>
			<td>修改收货人号码:</td>			
			<td><input type="text" size=30 name="phone" value="${info.phone}"></td></tr>
			
						<tr>
			<td>修改收货人地址:</td>			
			<td><input type="text" size=30 name="address" value="${info.address}"></td></tr>
											
			<tr>			
    </table>		
			<td colspan="2">
			<center>
			<input type="submit" class="baocun" value="保存">
			</center>
		</form>

${msg}

</center>


</div>
</body>
</html>