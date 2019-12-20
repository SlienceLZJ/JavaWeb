<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>

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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
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


<center>
<table>
   <form action="Register" method="post" onsubmit="return check()">                
        <tr><td>用户名:</td><td> <input type="text" name="username"/>  </td></tr>                    
        <tr><td>输入密码:</td><td><input type="password" name="password">  </td></tr>
        <tr><td>再次输入密码:</td><td><input type="password" name="passwordAgain">  </td></tr>
        <tr><td><input type="radio" name="choice" value="cus" checked="checked"/>&nbsp;消费者</td><td><input type="radio" name="choice" value="sell"/>&nbsp;商家</td></tr>
        <tr><td colspan="2"><center><input type="submit" value="注册"/>  <a href="login.jsp">跳转到登录界面</a></center></td></tr>              
   </form>  
</table>
</center>



</body>
</html>