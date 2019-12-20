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
  div.main{width:400px;height:250px;background-color:white;margin-top:100px;font-family:宋体;}
  div.mains{width:400px;height:215px;background-color:white;font-family:宋体;}
  div.black{background:url(Picture/background1.png); width:100%;height: 100%;position: absolute;}
  input.denglu{width:250px;height:40px;border:1px solid #1e7db9; font-size:15px;color:white;

box-shadow: 0 1px 2px #8fcaee inset,0 -1px 0 #497897 inset,0 -2px 3px #8fcaee inset;

background: -webkit-linear-gradient(top,#42a4e0,#2e88c0);

background: -moz-linear-gradient(top,#42a4e0,#2e88c0);

background: linear-gradient(top,#42a4e0,#2e88c0);}
  input{
                border: 1px solid #ccc;
                padding: 10px 0px;
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

   <form action="Login" method="post" onsubmit="return checkForm(this);">                
        <input size="35" type="text" placeholder="用户名" name="username"/><br><br>                   
        <input type="password" size="35"  placeholder="密码" name="password"><br><br>
        <input class="denglu" type="submit" value="登录"><br>
        <tr><td colspan="2">${error}</td></tr>        

   </form>  
<br>
<br>
<div style="float:right;"><a  href="register.jsp" style="text-decoration:none"><font size="3" face="宋体" color="black">注册账号</font></a></div>
</div>
</div>
</center>
</body>
</div>
</html>