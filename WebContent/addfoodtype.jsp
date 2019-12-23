<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>测试添加</title>
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
a.c{text-decoration:none;color:black}
div.main{margin-top:40px;width:900px;margin-left:400px;height:600px;background-color:white}
</style>
</head>
<body >
<div class="top">
<div class="picture"> <img src="${d.getPicture()}" height="120" width="120" ></div>
<div class="wenzi"><div class="aa">${d.getName()}</div>
<div class="caozuo"><center>
<a href="ModStoreMsg" class="c"target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改店铺信息</a><a class="c" href="DisplayOrder" target="_blank">&nbsp;&nbsp;查看订单</a>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%><a  class="c" href="addfoodtype.jsp?id=<%=id %>" target="_blank">&nbsp;&nbsp;添加菜品种类</a><a class="c" href="addfood.jsp" target="_blank">&nbsp;&nbsp;添加菜品</a>
</center></div>
</div>
</div>
<div class="main">
<font color=red>${result}</font>

<h2>添加种类</h2>
<center>
<form action = "addfoodtype" method = "post">
 <table>
   <tr><td><input type="hidden" value="<%=request.getParameter("id")%>"  name="id"></td></tr>
   <tr><td>菜品种类：</td> <td><input type="text" name="foodtype" ></td></tr>
   <tr><td><input type="submit" class="yes" value="确定" ></td>
      <td><input type="reset"  class="rel" value="重置" ></td>
  </tr>
</table>
</form>
</center>
</div>
</body>
</html>