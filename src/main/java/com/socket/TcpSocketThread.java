package com.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by jony on 3/12/18.
 */
public class TcpSocketThread extends Thread {

    private Socket socket = null;
//    private DataInputStream dataInputStream = null;
//    private DataOutputStream dataOutputStream = null;

    private BufferedReader in = null;
    private OutputStream out = null;

    private boolean isReceive = true;


    private Timer timer = null;


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

        //started heart beat

        heartBeat();

        try {

            String message = null;
//            只有遇到"/r"、"/n"、"/r/n"才会返回
            while (this.isReceive && (message = in.readLine()) != null) {
                System.out.println("TCP Client Message:" + message);

                new MessageProcessThread(message).start();
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
            str = str + "\n";
            out.write(str.getBytes());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }

    private void heartBeat() {

        this.timer = new Timer();

        timer.schedule(new TimerTask() {
            @Override
            public void run() {

                if (!(MessageProcessUtil.codeHeartBeatMessageAndSend())){
                    this.cancel();
                }
            }
        }, 10 * 1000, 10 * 1000);

    }

    public void destory() {

        System.out.println("Destory old TCP socket thread");

        if (this.timer != null) {
            this.timer.cancel();
        }

        this.isReceive = false;

        try {

            if (this.in != null) {
                this.in.close();
            }

            if (this.out != null) {
                this.out.close();
            }

            if (this.socket != null) {
                this.socket.close();
            }

        } catch (IOException e) {

        }


    }
}
