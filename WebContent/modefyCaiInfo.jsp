<%@page import="com.domain.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ page import="com.domain.*"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改菜品信息</title>
<style>
 .file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
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
div.aa{font-size:40px;font-family:宋体;}
select.try{  
    background:#fafdfe;  
    height:28px;  
    width:215px;  
    line-height:28px;  
    border:1px solid #9bc0dd;  
    -moz-border-radius:2px;  
    -webkit-border-radius:2px;  
    border-radius:5px;  
}
textarea.miaoshu{border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 5px;
                font-family:宋体;
                width:210px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s}
input.baocun{margin-left:5px;width:320px;height:37px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
</style>
</head>
<body bgcolor="#F5F5F5">
<div class="top">
<div class="picture"> <img src="${d.getPicture()}" height="120" width="120" ></div>
<div class="wenzi"><div class="aa">${d.getName()}</div></div>
<div class="caozuo"><center>
<a href="ModStoreMsg" class="c"target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改店铺信息</a><a class="c" href="DisplayOrder" target="_blank">&nbsp;&nbsp查看订单</a>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%><a class="c" href="addfood.jsp" target="_blank">&nbsp;&nbsp;添加菜品</a>
</center></div>
</div>
<div class="main">
<h2>修改菜品信息</h2>
<center>
<form action="modefyCaiInfo" method="post"	enctype="multipart/form-data">
<table>
  <input type="hidden" name="xiugai" value="true">
   <input type="hidden" name="picPath" value="${info.foodPicture }">
<tr>
<td>菜品名称:</td><td><input type="text" name="name" size=30 value="${info.foodName}"></td>
</tr>
<tr>
<td>菜品价格:</td><td><input type="text" name="price" size=30 value="${info.foodPrice}"></td>
</tr>

<tr>
<td>菜品类别</td>
<td>
<select  class="try" size="1" name="foodType">

<%

List<Menu> list=(List<Menu>)request.getAttribute("list");
Dian info=(Dian)request.getAttribute("info");	

for(int i=0;i<list.size();i++){
	Menu menu=(list.get(i));
	
	out.println("<option value='"+menu.getFoodType()+"'");
			if(info.getFoodType().equals(menu.getFoodType())){
				out.println(" selected='selected' ");
			}
			
			out.print(">"+menu.getFoodType()+"</option>");

}


%>

<!--
<c:forEach items="${list}" var="type">
<option value="${type.foodType}" >${type.foodType}</option>
</c:forEach>
  -->




</select>
</td>
</tr>

<tr><td>菜品图片:</td><td><img src="${info.foodPicture}" alt="暂无图片" width=100px height=100px/></td></tr>
<tr><td>修改店铺图片</td><td><a href="javascript:;" class="file"><input type="file" name="picture">点此选择图片</a></td></tr>
<tr><td>商品描述：</td><td><textarea name="description" class="miaoshu" rows="5" cols="30" >${info.foodIntroduction}</textarea></td></tr>
</table>
<br>
<input type="submit" class="baocun" value="保存">
 </form>
 ${msg}
</center>
</div>
</body>
</html>