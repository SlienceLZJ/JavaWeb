<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>测试添加</title>
</head>
<body>
<font color=red>${result}</font>

<p>请输入您想添加的菜品种类</p>
<form action = "addfoodtype.do" method = "post">
 <table>
   <tr><td>店号：</td> <td><input type="text" name="id" ></td></tr>
   <tr><td>菜品种类：</td> <td><input type="text" name="foodtype" ></td></tr>
   <tr><td><input type="submit" value="确定" ></td>
      <td><input type="reset" value="重置" ></td>
  </tr>
</table>
</form>
</body>
</html>