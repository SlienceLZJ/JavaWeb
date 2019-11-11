<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.domain.DianMingInformation" %>
       
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
  
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>通讯录</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="src/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="src/layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="src/layuiadmin/style/template.css" media="all">

  <script type="text/javascript" src="js/convert.js"></script>

</head>

<body>


<div style="height:50px;">
<%@ include file="/WEB-INF/jsp/daohang.jsp" %>
</div>

<div>

<%
List<DianMingInformation> list=(List<DianMingInformation>)request.getAttribute("list");
%>


<div align="right" style="padding-right:40px;height:30px">
<form name="Form" action="DianMing" method="get" onsubmit="return myFunction()">
 检索店铺:<input type="text" value="" name="jiansuo"/>&nbsp;<input type="submit" value="检索"/>
</form>
</div>



<%
 out.println("<div class='layui-fluid layadmin-maillist-fluid'>");
 out.println("<div class='layui-row layui-col-space15'>");
 for(int i=0;i<list.size();i++){

	System.out.println("the value of i :"+i);
    DianMingInformation info1=list.get(i);
    out.println("<div class='layui-col-md4 layui-col-sm6'>");
    out.println("<div class='layadmin-contact-box'> ");
    out.println("<div class='layui-col-md4 layui-col-sm6'>");
    out.println("<a href='javascript:;''>");
    out.println("<div class='layadmin-text-center'>");
    out.println("<img src='"+info1.getPicture() +"'>");
    out.println("<div class='layadmin-maillist-img layadmin-font-blod'>'"+info1.getName()+"'</div>");
    out.println("</div>");
    out.println("</a>");
    out.println("</div>");
    out.println("<div class='layui-col-md8 layadmin-padding-left20 layui-col-sm6'>");
    out.println("<a href='javascript:;''>");
    out.println("<h3 class='layadmin-title'>");
    out.println("<strong>'"+info1.getName()+"'</strong>");
    out.println("</h3>");
    out.println("<p class='layadmin-textimg'>");
    out.println("<i class='layui-icon layui-icon-location'></i>");
    out.println("商业街");
    out.println("</p>");
    out.println("</a>");
    out.println("<div class='layadmin-address'>");
    out.println("<a href='javascript:;''>");
    //out.println("<strong>Hu Ge studio</strong>");
    out.println("<br>");
    //out.println("E-mail:xxx@baidu.com");
    //out.println("<br>");
    out.println("'"+info1.getDescription()+"'");
    out.println("<br>");
    //out.println("<addr title='phone'>Tel:</addr>");
    //out.println("(123) 456-7890");
    out.println("</a>");
    out.println("</div>");
    out.println("</div>");
    out.println("</div>");
    out.println("</div>");
    /*//out.println("<div class='layui-col-md2 layui-col-sm4'>");
    out.println("<div class='cmdlist-container'>");
    out.println("<a href='javascript:;'>");
    out.println("<img width=100px height=100px src='"+info.getPicture() +"'>");
    out.println("</a>");
    out.println("<a href='javascript:;'>");
    out.println("<div class='cmdlist-text'>");
    out.println("<p class='info'>"+info.getDescription()+"</p>");
    out.println("<div class='price'>");
    
    out.println(""+info.getName()+"");
    out.println("</p>");
    ;
    out.println("</div>");
    out.println("</div>");
    out.println("</a>");
    out.println("</div>");
    out.println("</div>");*/
    

	   //out.println("<td><div style='width:300px;height:100px;border:1px solid #1E90FF';text-align:right;><a href='DisplayDishs?storeId="+info.getStoreId()+"'><div style='float:left;width:34%'><img width=100px height=100px src='"+info.getPicture() +"'/></div><div style='float:left;width:66%;'>"+info.getName()+"<br><font size='2' color='blue'>"+info.getDescription()+"</font></div></a></div></td>");
	  //System.out.println(info.getName());
 
}

%>



</div>


</body>
</html>