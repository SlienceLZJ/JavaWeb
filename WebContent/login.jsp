<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"> 
  <title>登录</title>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<center>
<table>
   <form action="Login" method="post" >                
        <tr><td>用户名:</td><td> <input type="text" name="username"/>  </td></tr>                    
        <tr><td>密码:</td><td><input type="password" name="password">  </td></tr>
        <tr><td><input type="radio" name="choice" value="cus" checked="checked"/>&nbsp;消费者</td><td><input type="radio" name="choice" value="sell"/>&nbsp;商家</td></tr>
        <tr><td colspan="2"><center><input type="submit" value="登录"/><a href="register.jsp">注册账号</a></center></td></tr>  
        <tr><td colspan="2">${error}</td></tr>
        
   </form>  
</table>
</center>
    
</body>
</html>