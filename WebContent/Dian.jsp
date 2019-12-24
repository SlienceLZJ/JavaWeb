<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店铺页</title>
<%String no=(String)request.getSession().getAttribute("no");%>

<script type="text/javascript">

    var websocket = null;
    var target = "ws://localhost:8080/JavaWeb/helloSocket?<%=no%>";
    
    window.onload=buildConnection();
    
    function buildConnection() {
    	 
        if('WebSocket' in window) {
            websocket = new WebSocket(target);        
        } else {
            window.alert("浏览器不支持WebSocket");
        }

  //连接成功建立的回调方法
    websocket.onopen = function(event){
        
    };
    
    //连接发生错误的回调方法
    websocket.onerror = function(){
        setMessageInnerHTML("error");
    };
    
    
    //连接关闭的回调方法
    websocket.onclose = function(){
        setMessageInnerHTML("已退出系统");
    };
  
 
    //接收到消息的回调方法
    websocket.onmessage = function(event){
        setMessageInnerHTML("recieved message is :"+event.data);
    };
    
    
    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }    
    }
    
    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //将消息显示出来
    function setMessageInnerHTML(innerHTML){

        window.alert(innerHTML);
    }
    
</script>
</head>
<body> 
<% System.out.println((String)request.getAttribute("id")); %>
<style>
#Diantop{background-color:#46A3FF; width:100%; height:120px;font-family:宋体}
#Diantop1{float:left; width:200px;height:120px;}
#Diantop2{float:left; width:300px;height:120px;line-height:120px}
#Diantop3{float:left; width:1000px;height:120px;line-height:120px;font-size:22px}
#Dianmid{width:1220px;margin-left:115px;margin-top:25px}
#Dianright{float:left; width:1050px;font-family:宋体;background-color:white}
div.jianjie{width:300px;background-color:white;height:250px;margin-right:30px;float:right;}
div.v{margin-top:25px;margin-left:10px;margin-right:10px;font-family:宋体;font-size:20px;background-color:#ECF5FF;height:180px}
</style>
<div id="Diantop" >
  <div id="Diantop1" >
    <%@ include file="Diantop.jsp" %>
  </div>
  <div id="Diantop2">
   <%@ include file="Diantop1.jsp" %>
  </div>
  <div id="Diantop3" >
   <%@ include file="Diantop2.jsp" %>
  </div>
</div>
<div id="Dianmid">
  <div id="Dianright">
  <%@ include file="Dianright.jsp" %>
  </div>
</div>
<div class="jianjie">
<center>
<font size=6 face="宋体" color="black">店家简介</font>
<div class="v">
<br>
${d.getDescription()}
</div>
</center>
</div>
</body>
</html>