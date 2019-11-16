<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList"
     import="com.domain.Menu"
     import="com.dao.*"
     import="com.mysql.cj.jdbc.result.ResultSetMetaData"
     import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加菜品</title>
</head>
<body>
<font color=red>${result}</font>
<font color=red>${message}</font>
<h2 class="title">菜品添加</h2>
<form action = "addfood" enctype="multipart/form-data"  method = "post">
<table>
<%
	String id= (String)request.getSession().getAttribute("no");
   System.out.println("addfood id "+id);
%>
   
   
<tr><td><input type="hidden" value="<%=id%>"  name="id"></td></tr>
<tr><td>菜名</td><td><input type="text" name="foodname"></td></tr>
<tr><td>菜品图片</td><td><input type="file" name="foodpicture" multiple= "multiple" ></td></tr>
<tr><td>菜品价格</td><td><input type="text" name="foodprice"></td></tr>
<tr><td>菜品类别</td>
<td><select size="1" name="foodtype">

<%
	String sql="select foodtype,id from menu where id='"+id+"'";
List<Menu> list=new ArrayList<Menu>();
try {
	ResultSet rs=JDBCDao.getData(sql);
	
	while(rs.next()) {
	Menu info=new Menu();	
	info.setId(rs.getString("id"));
	info.setFoodType(rs.getString("foodtype"));	
	list.add(info);
	System.out.println("result set is "+rs.getString("id"));
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
for(int i=0;i<list.size();i++){
	Menu m=list.get(i);	
	System.out.println("the value of i :"+i);
	System.out.println("the value of foodtype :"+m.getFoodType());
%>
<option value="<%=m.getFoodType()%>"><%=m.getFoodType()%></option>
<%} %>

</select></td></tr>

<tr><td>菜品简介</td>
<td><textarea name="foodIntroduction" rows="5" cols="30"></textarea></td>
</tr>
 <tr><td><input type="submit" value="确定" ></td>
      <td><input type="reset" value="重置" ></td>
  </tr>
</table>
</form>
</body>
</html>