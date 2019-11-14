
package com.socket;

import java.io.IOException;

import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnMessage;
@ServerEndpoint(value = "/helloSocket")
public class TestSocket {
	 private Session session;

	 TestSocket socket;
	 
	 
    /***
     * 当建立链接时，调用的方法.
     * @param session
     */
    @OnOpen
    public void open(Session session) {
		  this.session = session;
		  socket=this;
        System.out.println("开始建立了链接...");
        System.out.println("当前session的id是：" + session.getId());
        System.out.println("querystring is :"+session.getQueryString());
                       
        try {
			socket.session.getBasicRemote().sendText("hello nice to meet you！");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    
}