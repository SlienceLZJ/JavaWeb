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
        setMessageInnerHTML("close");
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
#Diantop{border:5px solid #F00; width:1220px; height:150px}
#Diantop1{border:5px solid #F00;float:left; width:150px  ;height:150px}
#Diantop2{border:5px solid #F00;float:left; width:520px;  height:150px}
#Dianmid{border:5px solid #F00;  width:1220px;display: table;}
#Dianleft{border:5px solid #F00;float:left; width:150px ;display:table-cell;}
#Dianright{border:5px solid #F00;float:right; width:1050px;display:table-cell;}
</style>
<div id="Diantop" >
  <div id="Diantop1" position:fixed>
    <%@ include file="Diantop.jsp" %>
  </div>
  <div id="Diantop2" position:fixed>
   <%@ include file="Diantop1.jsp" %>
  </div>
  <div id="Diantop2" position:fixed>
   <%@ include file="Diantop2.jsp" %>
  </div>
</div>
<div id="Dianmid">
  <div id="Dianleft" position:fixed>
    <%@ include file="Dianleft.jsp" %>
  </div>
  <div id="Dianright">
  <%@ include file="Dianright.jsp" %>
  <!--  <iframe  name="Dianright" width=1050px; height=400px src="Dianright.jsp" >
  
  
  </iframe>-->

  </div>
</div>
</body>
</html>