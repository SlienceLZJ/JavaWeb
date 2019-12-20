<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>
<style>
 input{
                border: 1px solid #ccc;
                padding: 10px 0px;
                border-radius: 5px;
                font-family:宋体;
                padding-left:5px;
                size:3;
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
            div.ma{width:400px;background-color:white;height:400px;margin-top:100px}
            div.main{background:url(Picture/background1.png);;width:100%;height:100%;position: absolute;}
            div.ma1{margin-top:50px}
            input.zhuce{width:250px;height:40px;border:1px solid #1e7db9;

box-shadow: 0 1px 2px #8fcaee inset,0 -1px 0 #497897 inset,0 -2px 3px #8fcaee inset;

background: -webkit-linear-gradient(top,#42a4e0,#2e88c0);

background: -moz-linear-gradient(top,#42a4e0,#2e88c0);

background: linear-gradient(top,#42a4e0,#2e88c0);}
</style>
<script>
function check()
{ 
with(document.all){
if(password.value!=passwordAgain.value)
{
alert("两次密码不一致，请重新输入!")
password.value = "";
passwordAgain.value = "";
return false;
}
else return true;
}
}
</script>

</head>
<body>
<%String msg=(String)request.getAttribute("msg");
System.out.println("msg is null?"+(msg==null));
if(msg!=null){
	if(msg.equals("failed")){
		System.out.println("the jsp result is failed");
		
		%>
		
		<script type="text/javascript" language="javascript">
		alert("该账号已被注册，请重新输入！");
		
		</script> 
		<%
		}
	else{
		System.out.println("the jsp result is success");
		%>
						
		<script type="text/javascript" language="javascript">
		alert("注册成功，请跳转到登录界面进行登录!");  
		document.location.href="login.jsp";
		</script> 				
		<% 
	}

}

%>

<div class="main">
<center>
<div class="ma">
<br>
<font size=5 family="宋体">注册账户</font>
<br>
<div class="ma1">
   <form action="Register" method="post" onsubmit="return check()">
               
         <input type="text" size="35" placeholder="用户名" name="username"/> <br><br>                    
        <input type="password" size="35" placeholder="输入密码" name="password">  <br><br>
        <input type="password" size="35" placeholder="确认密码" name="passwordAgain"> <br><br>
       <input type="radio" name="choice" value="cus" checked="checked"/>&nbsp;用户&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="choice" value="sell"/>&nbsp;商家
        <br><br>
        <input type="submit" class="zhuce"  value="注册"/>
   </form>  
</div>
</div>
</center>
</div>
</body>
</html>