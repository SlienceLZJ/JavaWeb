<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.domain.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付款界面</title>
<style type="text/css">
div.top{background-color:blue;height:100px;line-height:100px}
div.left{float:left;background-color:yellow;width:45%;height:550px}
div.right{float:left;background-color:green;width:55%;height:550px}
div.xiangqing{width:400px;background-color:white;margin-left:100px}
div.Atop{width:400px;height:50px;line-height:50px}
div.Amain{width:400px;height:40px;line-height:40px;background}
hr.xian{border-top: 0.5px solid #009999;width:400px}
div.foodname{width:100px;float:left;}
div.foodquantity{width:250px;float:left;text-align:center;align-left:30px}
div.foodtotalprice{width:50px;float:left;}
div.carmains{width:400px;height:30px;background-color:white;}
div.bottom{width:400px;height:150px;background-color:white;}
div.Main{}
div.pay{width:400px;height:500px;background-color:white;margin-left:10px}
div.paytop{width:400px;height:50px;background-cloler:white;line-height:50px}
div.paytop1{width:400px;height:25px;background-color:white;line-height:25px}
div.paytop2{width:400px;height:25px;background-color:white;line-height:25px}
div.aleft{width:200px;height:25px;background-color:white;float:left}
div.aright{width:200px;height:25px;background-color:white;float:left}
div.pay2{width:400px;height:50px;background-cloler:white;line-height:50px}
div.paybottom{width:400px;height:50px;background-cloler:white;line-height:50px}
div.picture{text-align:center;width:400px;background-cloler:white;}
</style>
</head>
<body>
<div>
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
<div class="foodquantity"><div style="float:left;width:30px"><form action="RemoveDishs" method="post"><input type="hidden" name="removedishs" value="<%=dishinformation.getFoodname()%>" ><button type="submit" class="button1">-</button></form></div> &nbsp;&nbsp;<div style="float:left;width:20px"><%=goods.getQuantity()%></div>&nbsp;&nbsp;<div style="float:left;width:30px"><form action="AddDishs" method="post"><input type="hidden" name="addcar" value="<%=dishinformation.getFoodname()%>" ><button type="submit">+</button></form></div></div>
<div class="foodtotalprice"><%=((goods.getQuantity()*(int)dishinformation.getFoodprice()*100))/100.0%></div>
</div>
<%}}}%>
<div class="bottom">
<hr class="xian"></hr>
<font size="7">￥<%=shoppingcar.getTotal()%></font>
</div>
</div>
</div>
<div class="right">
<div class="pay">
<div class="paytop"><font size="4">收货地址</font>
</div>
<div class="paytop1">
<div class="aleft">${addressinfo.name }</div><div class="aright">${addressinfo.phone }</div>
</div>
<div class="paytop2">${addressinfo.address}</div>

<hr class="xian"></hr>
<div class="pay2"><font size="4">付款码</font></div>
<div class="picture"><img  width="200px" height="200px"src="storePayCode/001.jpg"></div>
<hr class="xian"></hr>
<div class="paybottom"><form action="PostGoods" method="post"><input height="10px" type="submit" value="确认发货"></form>
</div>
</div>
</div>
</div>
</body>
</html>