<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"> 
  <title>登录</title>  
<script type="text/javascript">
// 验证输入不为空的脚本代码
function checkForm(form) {
if(form.username.value == "") {
alert("用户名不能为空!");
form.username.focus();
return false;
}
if(form.password.value == "") {
alert("密码不能为空!");
form.password.focus();
return false;
}
return true;
}
</script>  

  <style type="text/css">
  div.main{width:450px;height:250px;background-color:white;margin-top:100px;font-family:宋体;}
  div.mains{width:450px;height:190px;background-color:white;font-family:宋体;}
  div.black{background:url(Picture/background1.png); width:100%;height: 100%;position: absolute;}
  input.denglu{text-decoration:none;
	           background:#2f435e;
	           width:218px;
	           color:#f2f2f2;
	           padding: 10px 10px 10px 10px;
	           font-size:16px;
	           font-weight:bold;
	           border-radius:7px;
	           -webkit-transition:all linear 0.30s;
	           -moz-transition:all linear 0.30s;
	           transition:all linear 0.30s;}
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
<br>
<br>
<br>
<center>
<font size=6 face='宋体'>在线点餐系统</font>
<div class="main">
<br>
<font size=5>账号密码登录</font>
<br><br><br>
  <div class="mains">

<table >
   <form action="Login" method="post" onsubmit="return checkForm(this);">                
        <tr><td><font size="4">用户名:</font></td><td> <input size="30" type="text" name="username"/> </td><td>&nbsp;&nbsp;</td></tr>                    
        <tr><td><font size="4">密&nbsp;码:</font></td><td><input type="password" size="30" name="password"></td><td>&nbsp;</td></tr>
        <tr><td></td></tr> <tr><td></td></tr>
         <tr><td></td><td><input class="denglu" type="submit" value="登录"></center></td><td>&nbsp;&nbsp;</td></tr>  
        <tr><td colspan="2">${error}</td></tr>        

   </form>  
</table>
<br>
<br>
<div style="float:right;"><a  href="register.jsp"><font size="2" face="宋体">注册账号</font></a></div>
</div>
</div>
</center>
</body>
</div>
</html>