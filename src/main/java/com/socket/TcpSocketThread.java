package com.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

/**
 * Created by jony on 3/12/18.
 */
public class TcpSocketThread extends Thread {

    private Socket socket = null;
//    private DataInputStream dataInputStream = null;
//    private DataOutputStream dataOutputStream = null;

    private BufferedReader in = null;
    private OutputStream out = null;



    public TcpSocketThread(Socket socket) {
        this.socket = socket;

        try {
//            this.dataInputStream = new DataInputStream(socket.getInputStream());
//            this.dataOutputStream = new DataOutputStream(socket.getOutputStream());

            this.in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            this.out = socket.getOutputStream();

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void run() {

        try {

//            while (true) {
//
////                System.out.println("Wait ......");
//                int length = in.read(); //会导致丢失首个字符
//                System.out.println("Received, length: "+length+", analysis...");
//
//                char[] body = new char[length];
//                in.read(body);
//                String message = new String(body);
//
//
//                System.out.println("Client Message:" + message);
//            }

            String message = null;
//            只有遇到"/r"、"/n"、"/r/n"才会返回
            while ((message = in.readLine()) != null){
                System.out.println("TCP Client Message:" + message);

                new TCPMessageProcessThread(message).start();
//                boolean isSuccess = false;
//                isSuccess = Comet4jUtil.getInstance().sendMessageToAll(message);
//                sendMessage("status: "+isSuccess);
            }


        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public boolean sendMessage(String str) {

        try {
            str = str+"\n";
            out.write(str.getBytes());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }
}
