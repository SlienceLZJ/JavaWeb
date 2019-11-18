<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.domain.DianMingInformation" %>
       
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
  
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>点餐系统</title>
<style>
div.main{margin-left:70px;margin-right:50px;margin-top:30px;background-color:white;}
 input{      
                border: 1px solid #ccc;
                padding: 3px 0px;
                border-radius: 3px;
                font-family:宋体;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
body{
  margin:0px;
  width:100%;
  height:100%;
}

</style>


</head>

<body bgcolor="#F5F5F5">


<div style="height:50px;">
<%@ include file="/WEB-INF/jsp/daohang.jsp" %>
</div>

<div>
<%
List<DianMingInformation> list=(List<DianMingInformation>)request.getAttribute("list");
%>

<div class="main">
<br>
<div align="right" style="padding-right:40px;height:30px">
<form name="Form" action="DianMing" method="post" ><font face="宋体">
 检索店铺:</font><input type="text" name="jiansuo"/>&nbsp;<input type="submit" value="检索"/>
</form>
</div>
<center>
<br>
<table bgcolor="white">
 <tr>
<%

for(int i=0;i<list.size();i++){
	
	System.out.println("the value of i :"+i);
   DianMingInformation info=list.get(i);
   
   if(i%4==0&&i!=0){
	   out.println("</tr><tr><td></td></tr><tr><td></td></tr><tr>");                                                                                                                                                                                                                                                                            			
    
   }
   System.out.println("dianming.jsp id  "+info.getStoreId());
	   out.println("<td></td><td></td><td border=0.5><div style='width:300px;height:100px; solid #1E90FF;text-align:left;background-color:#F5F5DC'><a href='DisplayDishs?storeId="+info.getStoreId()+"'><div style='float:left;width:34%'><img width=100px height=100px src='"+info.getPicture() +"'/></div><div style='float:left;width:66%;'>"+info.getName()+"<br><br><font size=3>简介:</font><font size='2' color='blue'>"+info.getDescription()+"</font></div></a></div></td>");
	   System.out.println(info.getName());
 
}

%>
</tr>
</table>
</div>
</center>
</div>
</body>
</html>