package com.socket;

import com.domain.Message;
import net.sf.json.JSONObject;

/**
 * Created by jony on 3/27/18.
 */
public class MessageProcessThread extends Thread{

    private String message;

    public MessageProcessThread(String message) {
        this.message = message;
    }

    @Override
    public void run() {

        JSONObject jsonObject = JSONObject.fromObject(this.message);
        Object object = JSONObject.toBean(jsonObject, Message.class);

        Message message = null;

        if (object instanceof Message){
            message = (Message)object;
        }

        if (message != null){
            switch (message.getType()){
                case STATE:
                    MessageProcessUtil.stateMessageProcessing(message.getContent());
                    break;

                case NONE:
                    MessageProcessUtil.noneMessageProcessing(message.getContent());
                    break;

                case REGISTER_REPLY:
                    MessageProcessUtil.regReplyMessageProcessing(message.getContent());
                    break;

                    default:
                        System.out.println("Unknown message type");
            }
        }else {
            System.out.println("Message error ! message:"+ this.message);
        }
    }
}
