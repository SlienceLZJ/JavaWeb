<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.domain.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付款界面</title>
<style type="text/css">
div.top{margin-top:70px;font-family:"宋体";background-color:white;height:70px;line-height:70px;margin-top:100px;}
div.a{margin-left:200px;margin-right:200px}
div.left{font-family:"宋体";float:left;background-color:white;width:50%;height:550px;}
div.right{font-family:"宋体";float:left;background-color:white;width:50%;height:550px}
div.xiangqing{width:400px;background-color:white;margin-left:70px}
div.Atop{width:400px;height:50px;line-height:50px}
div.Amain{width:400px;height:40px;line-height:40px;background}
hr.xian{border-top: 0.5px solid #2894FF;width:400px;background-color:black}
hr.xian{border-top: 0.5px solid black;width:400px;background-color:black}
div.foodname{width:100px;float:left;}
div.foodquantity{width:250px;float:left;text-align:center;align-left:30px}
div.foodtotalprice{width:50px;float:left;}
div.carmains{width:400px;height:30px;background-color:white;}
div.bottom{width:400px;height:150px;background-color:white;line-height:200px;}
div.Main{}
input.tijiao{width:400px;height:45px;color:white;background-color:#2894FF;border-radius:5px;font-family:雅黑;font-size:20px;border:none}
div.pay{width:400px;height:500px;background-color:white;margin-left:90px}
div.paytop{width:400px;height:50px;background-cloler:white;line-height:50px}
div.paytop1{width:400px;height:25px;background-color:white;line-height:25px}
div.paytop2{width:400px;height:25px;background-color:white;line-height:25px}
div.aleft{width:200px;height:25px;background-color:white;float:left}
div.aright{width:200px;height:25px;background-color:white;float:left}
div.pay2{width:400px;height:50px;background-cloler:white;line-height:50px}
div.paybottom{width:400px;height:50px;background-cloler:white;line-height:50px;margin-top:50px}
div.picture{text-align:center;width:400px;background-cloler:white;}
</style>
</head>
<body bgcolor="#F5F5F5">
<div class="Top">
<%@ include file="/WEB-INF/jsp/daohang.jsp" %></div>
<div class="a">
<div class="top" >
<font size="6">订单信息</font>
</div>
<div class="left">
<div class="xiangqing">
<div class="Atop"><font size="4">订单详情</font></div>
<hr class="xian"></hr>
<div class="Amain">
<div class></div>
</div>
<div class="Main"> </div>
<%ShoppingCar shoppingcar=(ShoppingCar)session.getAttribute("shoppingcar");
if(shoppingcar!=null){
ArrayList<GoodsItem> goodsitem=new ArrayList<GoodsItem>(shoppingcar.getItems());%>          
<%if(goodsitem!=null){
for(GoodsItem goods:goodsitem){
	DishsInformation dishinformation=goods.getDishs();
%>
<div class="carmains">
<div class="foodname"><%=dishinformation.getFoodname()%></div>
<div class="foodquantity"><div style="float:left;width:30px"><form action="RemoveDishspay" method="post"><input type="hidden" name="removedishs" value="<%=dishinformation.getFoodname()%>" ><button type="submit" class="button1" style="border-color:black;background-color:white">-</button></form></div> &nbsp;&nbsp;<div style="float:left;width:20px"><%=goods.getQuantity()%></div>&nbsp;&nbsp;<div style="float:left;width:30px"><form action="ShoppingCarpay" method="post"><input type="hidden" name="addcar" value="<%=dishinformation.getFoodname()%>" ><button type="submit"style="border-color:black;background-color:white">+</button></form></div></div>
<div class="foodtotalprice"><%=((goods.getQuantity()*(int)dishinformation.getFoodprice()*100))/100.0%></div>
</div>
<%}}}%>
<br>
<div class="bottom">
<hr class="xian"></hr>
<font size="7">￥<%=shoppingcar.getTotal()%></font>
</div>
<hr class="xian"></hr>
</div>
</div>
<div class="right">
<div class="pay">
<div class="paytop"><font size="4">收货地址</font>
</div>
<div class="paytop1">
<div class="aleft">姓名:${addressinfo.name }</div><div class="aright">电话:${addressinfo.phone }</div>
</div>
<div class="paytop2">地址:${addressinfo.address}</div>

<hr class="xian" ></hr>
<div class="pay2"><font size="4">付款码</font></div>
<div class="picture"><img  width="200px" height="200px"src="storePayCode/<%=request.getSession().getAttribute("StoreId")%>.jpg"></div>
<hr class="xian"></hr>
<center>
<div class="paybottom"><form action="PostGoods" method="post"><input height="10px" class="tijiao" type="submit" value="提交订单"></form>
</div>
</center>
</div>
</div>
</div>
</body>
</html>