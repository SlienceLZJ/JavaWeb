<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*,com.domain.DianMingInformation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改店铺信息</title>
<style>
input{
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 5px;
                font-family:宋体;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
a.c{text-decoration:none;color:black}
div.top{background-color:#46A3FF; width:100%; height:120px;font-family:宋体}
div.picture{float:left; width:200px;height:120px;}
div.wenzi{float:left; width:300px;height:120px;line-height:120px}
div.caozuo{float:left; width:1000px;height:120px;line-height:120px;font-size:22px}
div.main{margin-top:40px;width:900px;margin-left:400px;height:600px;background-color:white}
input.baocun{margin-left:5px;width:340px;height:37px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
</style>
</head>
<body bgcolor="#F5F5F5">
<div class="top">
<div class="picture"> <img src="${d.getPicture()}" height="120" width="120" ></div>
<div class="wenzi"><div class="aa">${d.getName()}</div>
<div class="caozuo"><center>
<a href="ModStoreMsg" class="c"target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改店铺信息</a><a class="c" href="DisplayOrder" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;查看订单</a>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%><a class="c" href="addfood.jsp" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;添加菜品</a>
</center></div>
</div>
</div>
<div class="main">
<h2 class="title">修改店铺信息</h2>
<br>
<center>
<form action="ModStoreMsg" method="post" enctype="multipart/form-data">
	<table>					
			<tr><td>
				修改店名:
			   </td>
			   <td>
			   <input type="text" name="name" size=30 value="${info.name}">
			   </td>
			</tr>

			<tr>
			<td>修改店铺描述:</td>
			
			<td><input type="text" name="description" size=30 value="${info.description }"></td></tr>
				
	
	
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
			
			<tr><td>店铺收款码:</td>			
			<td>
			<img width=50px height=50px src="${info.payPicture}" alt="当前店铺暂无收款码"/>
			</td>			
			</tr>
			
			<tr>
			<td>
		 	更新店铺收款码
			</td>
			<td>
			<input type="file" name="payCode"/>	
			</td>			
			</tr>
			
	</table>
	<br>
	<br><input type="submit" class="baocun" value="保存">
		</form>

${update}
</center>


</div>
</body>
</html>