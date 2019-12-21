<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <script type="text/javascript">
    function tuiChui(){    	
    	//清空sesson信息
    	
    	if 
    	(confirm("您确定要关闭本页吗？")){
    		window.open("CleanSession");
    	window.opener=null;
    	window.open('','_self');
    	window.close();
    	}
    }
    </script>
   
    


    
    <div style="text-align:center;line-height:50px;background-color:#1E90FF;width:100%;height:50px;position:fixed;left:0px;top:0px;">
    
   <div style="color:#FFFFFF;font-size:20px"><a href="DianMing" style="color:#FFFFFF">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="yonghuDingdan" style="color:#FFFFFF">我的订单<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="UserAddrInfor" style="color:#FFFFFF">个人中心</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="" style="color:#FFFFFF" onclick="tuiChui()">退出</a></div>


</div>