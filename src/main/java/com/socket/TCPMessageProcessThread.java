package com.socket;

import com.domain.TCPMessage;
import net.sf.json.JSONObject;

/**
 * Created by jony on 3/27/18.
 */
public class TCPMessageProcessThread extends Thread{

    private String message;

    public TCPMessageProcessThread(String message) {
        this.message = message;
    }

    @Override
    public void run() {

        JSONObject jsonObject = JSONObject.fromObject(this.message);
        Object object = JSONObject.toBean(jsonObject, TCPMessage.class);

        TCPMessage tcpMessage = null;

        if (object instanceof TCPMessage){
            tcpMessage = (TCPMessage)object;
        }

        if (tcpMessage != null){
            switch (tcpMessage.getType()){
                case STATE:
                    TCPMessageProcessUtil.stateMessageProcessing(tcpMessage.getContent());
                    break;

                case NONE:
                    TCPMessageProcessUtil.noneMessageProcessing(tcpMessage.getContent());
                    break;

                case REGISTER_REPLY:
                    TCPMessageProcessUtil.regReplyMessageProcessing(tcpMessage.getContent());
                    break;

                    default:
            }
        }else {
            System.out.println("Message error ! message:"+message);
        }
    }
}
