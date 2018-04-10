package com.socket;

import com.comet4j.Comet4jUtil;
import com.domain.RegReplyMessage;
import com.domain.RegisterMessage;
import com.domain.TCPMessage;
import com.domain.TCPMessageType;
import net.sf.json.JSONObject;

import java.util.Date;

/**
 * Created by jony on 3/27/18.
 */
public class TCPMessageProcessUtil {

    private static Comet4jUtil sharedComet4jUtil = Comet4jUtil.getInstance();
    private static TcpUtil sharedTcpUtil = TcpUtil.getInstance();

    static void stateMessageProcessing(String content){
        System.out.println(content);

        boolean isSuccess = false;
        isSuccess = sharedComet4jUtil.sendMessageToAll(content);
        System.out.println("Broadcast "+isSuccess);

    }

    public static boolean codeTCPMessageAndSend(TCPMessageType tcpMessageType, String content){

        TCPMessage tcpMessage = new TCPMessage(tcpMessageType, content);
        JSONObject jsonObject = JSONObject.fromObject(tcpMessage);

        boolean isSuccess = sharedTcpUtil.sendByTcp(jsonObject.toString());
        System.out.println("TCP send "+isSuccess);

        return isSuccess;
    }

    public static boolean codeRegisterMessageAndSend(RegisterMessage registerMessage){

        boolean isSucess = false;

        JSONObject jsonObject = JSONObject.fromObject(registerMessage);

        isSucess = codeTCPMessageAndSend(TCPMessageType.REGISTER, jsonObject.toString());

        return  isSucess;
    }

    public static boolean codeHeartBeatMessageAndSend(){

        String content = String.valueOf(new Date().getTime());

        TCPMessage tcpMessage = new TCPMessage(TCPMessageType.HEART_BEAT, content);
        JSONObject jsonObject = JSONObject.fromObject(tcpMessage);

        boolean isSuccess = sharedTcpUtil.sendByTcp(jsonObject.toString());
        System.out.println("Heart Beat send "+isSuccess);

        return isSuccess;
    }

    static void regReplyMessageProcessing(String content){

        JSONObject jsonObject = JSONObject.fromObject(content);

        Object object = JSONObject.toBean(jsonObject, RegReplyMessage.class);

        if (object instanceof RegReplyMessage){
            RegReplyMessage regReplyMessage = (RegReplyMessage) object;

            System.out.println("REGISTER REPLY MESSAGE： "+ regReplyMessage.toString());


            boolean isSuccess = sharedComet4jUtil.sendMessageToAll("REGISTER REPLY MESSAGE： "+ regReplyMessage.toString());
            System.out.println("Broadcast "+isSuccess);
        }
    }

    static void noneMessageProcessing(String content){

       System.out.println("NONE MESSAGE:" + content);
    }
}







