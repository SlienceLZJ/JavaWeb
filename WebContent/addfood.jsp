<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList"
     import="com.domain.Menu"
     import="com.dao.*"
     import="com.mysql.cj.jdbc.result.ResultSetMetaData"
     import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加菜品</title>
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
input.yes{width:70px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
input.rel{width:70px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
div.top{background-color:#46A3FF; width:100%; height:120px;font-family:宋体}
div.picture{float:left; width:200px;height:120px;}
div.wenzi{float:left; width:300px;height:120px;line-height:120px}
div.caozuo{float:left; width:1000px;height:120px;line-height:120px;font-size:22px}
div.aa{font-size:40px;font-family:宋体;}
div.main{margin-top:40px;width:900px;margin-left:400px;height:600px;background-color:white}
a.c{text-decoration:none;color:black}
select.ty{  
    background:#fafdfe;  
    height:28px;  
    width:180px;  
    line-height:28px;  
    border:1px solid #9bc0dd;  
    -moz-border-radius:2px;  
    -webkit-border-radius:2px;  
    border-radius:2px;  
}  }
</style>
</head>
<body  bgcolor="#F5F5F5">
<div class="top">
<div class="picture"> <img src="${d.getPicture()}" height="120" width="120" ></div>
<div class="wenzi"><div class="aa">${d.getName()}</div>
<div class="caozuo"><center>
<a href="ModStoreMsg" class="c"target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改店铺信息</a><a class="c" href="DisplayOrder" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;查看订单</a>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%><a  class="c" href="addfoodtype.jsp?id=<%=id %>" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;添加菜品种类</a><a class="c" href="addfood.jsp" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;添加菜品</a>
</center></div>
</div>
</div>
<div class="main">
<font color=red>${result}</font>
<font color=red>${message}</font>
<h2 class="title">菜品添加</h2>
<center>
<form action = "addfood" enctype="multipart/form-data"  method = "post">
<table>
<%
   System.out.println("addfood id "+id);
%>
<tr><td><input type="hidden" value="<%=id%>"  name="id"></td></tr>
<tr><td>菜品名称 </td><td><input type="text" size=30 name="foodname"></td></tr>
<br>
<tr><td>菜品图片 </td><td><input type="file" size=18name="foodpicture" multiple= "multiple" ></td></tr>
<tr><td>菜品价格 </td><td><input type="text" size=30 name="foodprice"></td></tr>
<tr><td>菜品类别 </td>
<td><select size="1" class="ty" name="foodtype">

<%
	String sql="select foodtype,id from menu where id='"+id+"'";
List<Menu> list=new ArrayList<Menu>();
try {
	ResultSet rs=JDBCDao.getData(sql);
	
	while(rs.next()) {
	Menu info=new com.domain.Menu();	
	info.setId(rs.getString("id"));
	info.setFoodType(rs.getString("foodtype"));	
	list.add(info);
	System.out.println("result set is "+rs.getString("id"));
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
for(int i=0;i<list.size();i++){
	Menu m=list.get(i);	
	System.out.println("the value of i :"+i);
	System.out.println("the value of foodtype :"+m.getFoodType());
%>
<option value="<%=m.getFoodType()%>"><%=m.getFoodType()%></option>
<%} %>

</select></td></tr>

<tr><td>菜品简介 </td>
<td><textarea name="foodIntroduction" rows="5" cols="30"></textarea></td>
</tr>
</table>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="submit" class="yes" value="确定" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" class="rel" value="重置" >
</table>
</form>
</center>
</div>
</body>
</html>