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
<style>
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
div.q{width:100px;height:100px;}
div.e{width:100px;height:100px}
input.yes{width:100px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
input.rel{width:100px;height:30px;background-color:#2894FF;font-family:宋体;font-size:15px;border-radius:5px;color:white;border:none}
div.top{background-color:#46A3FF; width:100%; height:120px;font-family:宋体}
div.picture{float:left; width:200px;height:120px;}
div.wenzi{float:left; width:200px;height:120px;line-height:120px}
div.caozuo{margin-left:500px; width:1000px;height:120px;line-height:120px;font-size:22px}
div.aa{font-size:40px;font-family:宋体;}
div.main{margin-top:40px;width:900px;margin-left:400px;height:600px;background-color:white}
a.c{text-decoration:none;color:black}
 .file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
select.ty{  
    background:#fafdfe;  
    height:28px;  
    width:215px;  
    line-height:28px;  
    border:1px solid #9bc0dd;  
    -moz-border-radius:2px;  
    -webkit-border-radius:2px;  
    border-radius:5px;  
}

select.ty_default{
width:80px;
height:32px;
line-height:32px;
padding:0 10px;
border:solid 1px #ccc;
}
textarea.miaoshu{border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 5px;
                font-family:宋体;
                width:210px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s}
</style>
<script src="jquery-1.7.js"></script>
<script type="text/javascript">
		//获取一个上传文件的扩展名
		var myfile = document.getElementById('myfile');
		var mybtn = document.getElementById('mybtn');
		file.onclick = function(){
			//获取文件上传文件的文件名和扩展名
			if(myfile.files[0] == undefined){
				alert('未上传文件！');
			}else{
				//获取上传文件的文件名
				alert(<span style="color:#FF0000;">myfile.files[0].name</span>);
			}
			//获取上传文件的扩展名
			var filevalue = myfile.value;
			var index = filevalue.lastIndexOf('.');
			alert(<span style="color:#FF0000;">filevalue.substring(index)</span>);
		}
	</script>
<script type="text/javascript">
$("file").on("change","input[type='file']",function(){
    var filePath=$(this).val();
    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
        $(".fileerrorTip").html("").hide();
        var arr=filePath.split('\\');
        var fileName=arr[arr.length-1];
        $(".showFileName").html(fileName);
    }else{
        $(".showFileName").html("");
        System.out.printf(filename);
        $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
        return false 
    }
})
</script>
</head>
<body  bgcolor="#F5F5F5">
<div class="top">
<div class="picture"> <img src="${d.getPicture()}" height="120" width="120" ></div>
<div class="wenzi"><div class="aa">${d.getName()}</div></div>
<div class="caozuo"><center>
<a href="ModStoreMsg" class="c"target="_blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改店铺信息</a><a class="c" href="DisplayOrder" target="_blank">&nbsp;&nbsp查看订单</a>
<% String id=(String)session.getAttribute("no");
   System.out.println("Diantop2  id"+id);
%><a class="c" href="addfood.jsp" target="_blank">&nbsp;&nbsp;添加菜品</a>
</center></div>
</div>
<div class="main">
<font color=red>${result}</font>
<font color=red>${message}</font>
<h2 class="title">菜品添加</h2>
<center>
<form action = "addfood" enctype="multipart/form-data"  method = "post">
<table>
<%
   System.out.println("addfood id "+id);
%>
<tr><td><input type="hidden" value="<%=id%>"  name="id"></td></tr>
<tr><td>菜品名称 </td><td><input type="text" size=30 name="foodname"></td></tr>
<br>
<tr><td>菜品图片 </td><td><a href="javascript:;" class="file"><input type="file" size=18 name="foodpicture" id="file" multiple= "multiple" >点击此处上传图片</a></td></tr>
<tr><td>菜品价格 </td><td><input type="text" size=30 name="foodprice"></td></tr>
<tr><td>菜品类别 </td>
<td><select  size="1" class="ty" name="foodtype">

<%
	String sql="select foodtype,id from menu where id='"+id+"'";
List<Menu> list=new ArrayList<Menu>();
try {
	ResultSet rs=JDBCDao.getData(sql);

	while(rs.next()) {
	Menu info=new com.domain.Menu();	
	info.setId(rs.getString("id"));
	info.setFoodType(rs.getString("foodtype"));	
	list.add(info);
	System.out.println("result set is "+rs.getString("id"));
	}
	JDBCDao.closeConnecttion();
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
<td><textarea name="foodIntroduction" class="miaoshu" rows="5" cols="30"></textarea></td>
</tr>
</table>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <span class="q"><input type="submit" class="yes" value="确定" ></span>&nbsp;&nbsp;
  <span class="e"><input type="reset" class="rel" value="重置" ></span>
</table>
</form>
</center>
<div>
<h2 class="title">类别添加</h2>
<center>
<form action = "addfoodtype" method = "post">
 <table >
   <tr><td><input type="hidden" value="<%=request.getParameter("id")%>"  name="id"></td></tr>
   <tr><td>菜品种类</td><td><input size=30 type="text" name="foodtype"></td>
   </tr>
   </table><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <span class="q"></span><input type="submit" class="yes" value="确定" ></span>&nbsp;&nbsp;
    <span class="e"></span><input type="reset"  class="rel" value="重置" ></span>
  </tr>
</form>
</center>
</div>
</div>
</body>
</html>