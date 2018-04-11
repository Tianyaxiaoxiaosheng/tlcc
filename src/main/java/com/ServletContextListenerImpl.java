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

    private static final int UDP_LOCALPORT = 7000;
    private static final int UDP_DESPORT = 7000;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        Comet4jUtil.getInstance().initializationComet4j();

        tcpServerInitialization();

        udpInitialization();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    private void udpInitialization(){

        System.out.println("UDP Socket Initialization");
        //启动udp接收
        UdpUtil sharedUdpUtil = UdpUtil.getInstance();
        sharedUdpUtil.setServerPort(UDP_LOCALPORT);
        sharedUdpUtil.setDesPort(UDP_DESPORT);
        sharedUdpUtil.start();
    }

    private void tcpServerInitialization(){

        System.out.println("TCP  Socket Initialization");

        TcpUtil sharedTcpUtil = TcpUtil.getInstance();

        sharedTcpUtil.startServerSocket();
    }
}
