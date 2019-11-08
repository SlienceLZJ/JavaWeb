<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.domain.DianMingInformation" %>
       
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
  
    
<!DOCTYPE html>
<html>
<head>

 <style>
.box{width:150px; text-align:center; font-szie:18px;}
.box img {width:100%;}
</style> 

<meta charset="UTF-8">
<title>点餐系统</title>
</head>

<body>


<%
List<DianMingInformation> list=(List<DianMingInformation>)request.getAttribute("list");
%>

<table>


 <tr>

<%
for(int i=0;i<list.size();i++){
   DianMingInformation info=list.get(i);
   
   if(i%3==0){
	   out.println("</tr><tr>");
   }
   else{
	   out.println("<td><div class='box'><img src='"+info.getPicture() +"'/>"+info.getName()+"</div></td>");
	   System.out.println(info.getName());
	   
   }
   
}

%>

</tr>
</table>



</body>
</html>