<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"> 
  <title>登录</title>
  <style type="text/css">
  div.main{width:400px;height:240px;background-color:white;margin-top:100px}
  div.mains{width:400px;height:190px;background-color:white}
  div.black{background:url(Picture/background1.png); width:100%;height: 100%;position: absolute;}
  input.denglu{text-decoration:none;
	           background:#2f435e;
	           width:205px;
	           color:#f2f2f2;
	           padding: 10px 10px 10px 10px;
	           font-size:16px;
	           font-family: 微软雅黑,宋体,Arial,Helvetica,Verdana,sans-serif;
	           font-weight:bold;
	           border-radius:7px;
	           -webkit-transition:all linear 0.30s;
	           -moz-transition:all linear 0.30s;
	           transition:all linear 0.30s;}
  input{
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 5px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
            input:focus{
                    border-color: #66afe9;
                    outline: 0;
                    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
                    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
            }
  </style>
</head>
<div class="black">
<body>
<center>
<div class="main">
<br>
<br>
<font size=5>账号密码登录</font>
<br><br><br>
  <div class="mains">
<table>
   <form action="Login" method="post" >                
        <tr><td><font size="4">用户名:</font></td><td> <input size="30" type="text" name="username"/> </td></tr>                    
        <tr><td><font size="4">密&nbsp;&nbsp;&nbsp;&nbsp;码:</font></td><td><input type="password" size="30" name="password"></td></tr>
        <tr><td></td></tr>
         <tr><td></td><td><input class="denglu" type="submit" value="登录"></center></td></tr>  
        <tr><td colspan="2">${error}</td></tr>        
   </form>  
</table>
<br>
<br>
<div style="float:right;"><a  href="register.jsp"><font size="2">注册账号</font></a></div>
</div>
</div>
</center>
</body>
</div>
</html>