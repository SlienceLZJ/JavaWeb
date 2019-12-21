<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.domain.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示菜品</title>
<style type="text/css">
span.dishs{float:left;display:block;background-color:#ECF5FF;width:400px; height:112px ;margin-top:2px;margin-left:10px;}
img.img1{vertical-align:top ; width:110px;height:110px;}
input{          border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                font-family:宋体;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s}
                input.sou{width:50px;height:32px;color:white;background-color:#66B3FF}
                input.spcar{width:150px;height:32px;color:white;background-color:#66B3FF}
                input.car{width:90px;height:37px;background-color:#FBFBFF;font-family:雅黑;font-size:15px}
span.dishs1{float:left;}
div.type{width:830px;}
div.type1{width:820px;height:30px;margin-left:10px;margin-top:10px;margin-botton:10px}
div.tibu{float:left;display:block;width:400px; height:112px ;margin-top:2px;margin-left:10px;background-color:white}
div.daohang{height:250px}
div.main{width:1400px;margin-left:270px;margin-top:70px}
div.Menu{height:800px;width:100px;text-align:right;float:right}
div.a{width:830px;float:left;background-color:white;height:1000px}
div.sousou{float:left;}
div.cartop{width:300px;height:30px;line-height:30px;}
div.shopcar{font-family:宋体; bottom:0;right:0;position:fixed;background-color:#0080FF;width:300px;margin-right:20px;border-radius:10px;border-bottom-right-radius:10px;border-bottom-left-radius:10px }
div.carmain{background-color:white;width:300px;background-color:white;}
div.carbottom{width:300px;height:50px;background-color:#0080FF;line-height:50px;}
div.bottomleft{width:200px;float:left;height:50px}
div.bottomright{width:100px;float:right;height:50px}
div.foodname{width:100px;float:left}
div.foodquantity{width:150px;float:left;text-align:center}
div.foodtotalprice{width:50px;float:left}
div.carmains{width:300px;height:30px;background-color:white;}
div.ab{width:300px;height:10px;background-color:white;}
div.menu{height:50px;width:50px;margin-top:5px;}
div.leftk{ float:left;width:70px;height:100px";position:fixed;}
div.top{width:1000px;height:100px;background-color:blue;}
div.Top{height:50px}
div.aa{margin-left:200px}
btn.button1{radius:20px}
div.find{top:0;right:0;position:fixed;width:100px}
.box{height:50px;background:#ccc;width:100%;}
</style>
</head>
<body  bgcolor="#F5F5F5">
<div class="Top">
<%@ include file="/WEB-INF/jsp/daohang.jsp" %></div>
<div class=""style="width:70px">
<div class="box1" id="box" style="float:left;width:70px;position:fixed;margin-left:200px" >
<a href="http://localhost:8080/JavaWeb/right.jsp" style="text-decoration:none"><font size=3 face="宋体" color=#1E90FF>全部商品</font></a> 
</div>
</div>
<div class="main">
    <div class=a>
    <img height="490px";width="490px";alt="" src="https://img.zcool.cn/community/01594c5b21c6a0a80121bbec90da3c.jpg@1280w_1l_2o_100sh.jpg">
      </div>
</div>
<div class="sousou">
<div>
<form action="FindDishs"  style="top:0;right:0;position:fixed;margin-top:70px;margin-right:20px">
<input type="text" name="foodname" size=30>
<input name="id" type="hidden"value="<%=request.getSession().getAttribute("StoreId") %>">
<input type="submit" name="id" class="sou"value="查询">
</form>
</div>
<div class="shopcar">
<div class="cartop">&nbsp;<font family="宋体">购物车</font><a href="ClearDishs" ><font family="宋体" color="white">清空</font></a>
</div>
<div class="carmain">
<br>
<%ShoppingCar shoppingcar=(ShoppingCar)session.getAttribute("shoppingcar");
if(shoppingcar!=null){
ArrayList<GoodsItem> goodsitem=new ArrayList<GoodsItem>(shoppingcar.getItems());%>          
<%if(goodsitem!=null){
for(GoodsItem goods:goodsitem){
	DishsInformation dishinformation=goods.getDishs();
%>
<div class="carmains">
<div class="foodname">&nbsp;<%=dishinformation.getFoodname()%></div>
<div class="foodquantity"><div style="float:left;width:30px;text-aliagn:center"><form action="EmptyRemovecar" method="post"><input type="hidden" name="removedishs" value="<%=dishinformation.getFoodname()%>" ><button type="submit" class="button1"style="border-color:#0080FF;background-color:white">-</button></form></div> &nbsp;&nbsp;<div style="float:left;width:20px;text-align:center"><%=goods.getQuantity()%></div>&nbsp;&nbsp;<div style="float:left;width:30px"><form action="EmptyAddcar" method="post"><input type="hidden" name="addcar" value="<%=dishinformation.getFoodname()%>" ><button type="submit"style="border-color:#0080FF;background-color:white">+</button></form></div></div>
<div class="foodtotalprice"><%=((goods.getQuantity()*(int)dishinformation.getFoodprice()*100))/100.0%></div>
</div>
<%}}}%>
</div>
<div class="carbottom">
<div class="bottomleft">&nbsp;价格:<%=shoppingcar.getTotal()%></div>
<form action="PayMoney" method="post"><div class="bottomright"><input type="submit"  class="car" value="去结算"></input></div></form>
</div>
</div>
</div>
</body>
</html>