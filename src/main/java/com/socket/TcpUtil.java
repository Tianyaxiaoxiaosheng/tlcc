package com.socket;

import com.comet4j.Comet4jUtil;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * Created by jony on 3/12/18.
 */
public class TcpUtil {


    private static final int LOCALPORT = 6666;
    private static final int BACKLOG = 1; //连接请求队列长度
    private ServerSocket serverSocket = null;
    private boolean isAccept = true;

    private TcpSocketThread tcpSocketThread = null;


    private TcpUtil() {

    }

    private static TcpUtil sharedTcpUtil = new TcpUtil();

    public static TcpUtil getInstance() {
        return sharedTcpUtil;
    }

    public void setTcpSocketThread(TcpSocketThread tcpSocketThread) {
        this.tcpSocketThread = tcpSocketThread;
    }

    /**
     * Opening Tcp Server
     */
    public boolean startServerSocket() {

        try {
            serverSocket = new ServerSocket(LOCALPORT, BACKLOG);
            System.out.println("TCP Server starts");
            System.out.println("TCP ip:"+serverSocket.getInetAddress().getHostAddress()+"\tport:"+serverSocket.getLocalPort());

            new Thread(new Runnable() {

                @Override
                public void run() {
                    while (isAccept){
                        try {
                            //开始监听等待连接
                            Socket socket = serverSocket.accept();

                            String str = "TCP Client IP: "+socket.getInetAddress().getHostAddress()+"\tPort: "+socket.getPort();
                            System.out.println(str);

                            if (tcpSocketThread != null)
                                tcpSocketThread.destory();

                            tcpSocketThread = new TcpSocketThread(socket);
                            tcpSocketThread.start();

                            //给web客户端广播
                            Comet4jUtil.getInstance().sendMessageToAll(str);

                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }).start();

            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     *  Closed Tcp Server
     */
    public boolean closeServerSocket() {

        if (serverSocket != null) {
            try {
                serverSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    public boolean sendByTcp(String str){

        boolean isSuccess = false;

        if (this.tcpSocketThread != null){

            isSuccess = this.tcpSocketThread.sendMessage(str);
        }else {
            System.out.println("tcpSocketThread is null");
        }

        return isSuccess;
    }
}
