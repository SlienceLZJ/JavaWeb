
package com.socket;

import java.io.IOException;

import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import com.sun.javafx.collections.MappingChange.Map;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;


@ServerEndpoint(value = "/helloSocket")
public class TestSocket {
	 private static Session session;
	    private static ConcurrentHashMap<String, TestSocket> webSocketSet = new ConcurrentHashMap<String, TestSocket>();
	    
	 
    /***
     * 当建立链接时，调用的方法.
     * @param session
     * @throws InterruptedException 
     */
    @OnOpen
    public void open(Session session) throws InterruptedException {
		  this.session = session;
		  String no=session.getQueryString();    
               //当商家登录之后把socket放到socketmap里
               webSocketSet.put(no, this);
               System.out.println(no+"is comming");    
               System.out.println("the current socketset's size is "+webSocketSet.size());
     
               
    }
    
    public static void noti(String id) { 	
    	TestSocket socket=webSocketSet.get(id);
    	if(socket!=null) {//如果商家在线的话，给商家发通知
    	 	try {
				socket.session.getBasicRemote().sendText("尊敬的商家："+id+"您好！您有一份订单，请及时查看！");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
   
    }   
    
    /**
              *  连接关闭调用的方法
     * @throws Exception 
     */
    @OnClose
    public void onClose() throws Exception{
    	//sendMessageToUser(session.getQueryString(), "close");
    	//从map中删除
    	webSocketSet.remove(session.getQueryString());
    	System.out.println("the closing socket is "+session.getQueryString());

    }
    
    
}