package com;

import com.comet4j.Comet4jUtil;
import com.socket.TcpUtil;
import com.socket.UdpUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by jony on 2/1/18.
 */
public class ServletContextListenerImpl implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        Comet4jUtil.getInstance().initializationComet4j();

        socketInitialization();

        tcpServerInitialization();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    private void socketInitialization(){

        System.out.println("UDP Socket Initialization");
        //启动udp接收
        UdpUtil sharedUdpUtil = UdpUtil.getInstance();
        //开始接收消息
        sharedUdpUtil.startReceive();
    }

    private void tcpServerInitialization(){

        System.out.println("TCP  Socket Initialization");

        TcpUtil sharedTcpUtil = TcpUtil.getInstance();

        sharedTcpUtil.startServerSocket();
    }
}
