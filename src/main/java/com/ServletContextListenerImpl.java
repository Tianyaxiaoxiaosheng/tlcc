package com;

import com.socket.UdpUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by jony on 2/1/18.
 */
public class ServletContextListenerImpl implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        socketInitialization();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    private void socketInitialization(){

        System.out.println("Socket Initialization");
        //启动udp接收
        UdpUtil sharedUdpUtil = UdpUtil.getInstance();
        //开始接收消息
        sharedUdpUtil.startReceive();
    }
}
