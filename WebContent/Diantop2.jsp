<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList"
     import="com.domain.DianMingInformation"
     import="com.dao.*"
     import="com.mysql.cj.jdbc.result.ResultSetMetaData"
     import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a.c{text-decoration:none;color:black}
div.main{font-size:25px;font-family:宋体;}
</style>
</head>

<body>
  <script type="text/javascript">
    function tuiChui(){    	
    	//清空sesson信息
    	
    	if 
    	(confirm("您确定要关闭本页吗？")){
    		window.open("CleanSession");
    	window.opener=null;
    	window.open('','_self'); 
    	window.close();
    	}
    }
    </script>  
    
<center>
<a href="ModStoreMsg" class="c"target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改店铺信息</a><a class="c" href="DisplayOrder" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;查看订单</a>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%><a class="c" href="addfood.jsp" target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;添加菜品</a><a class="c" href="CleanSession" onclick="tuiChui()">&nbsp;&nbsp;&nbsp;&nbsp;退出系统</a>
</center>
</body>
</html>