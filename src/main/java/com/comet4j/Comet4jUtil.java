package com.comet4j;

import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;
import org.comet4j.core.event.*;
import org.comet4j.core.listener.*;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by jony on 3/2/18.
 */
public class Comet4jUtil {


    //链接列表
    private HashMap<String, String> connList = new HashMap<String, String>();


    //Order channel
    private static final String CHANNEL_ORDER = "order";
    //Status channel
    private static final String CHANNEL_STATUS = "status";


    private static Comet4jUtil sharedCometConnect = new Comet4jUtil();
    public static Comet4jUtil getInstance(){
        return sharedCometConnect;
    }



    /**
     * initialization Comet4j
     */
    public void initializationComet4j(){

        //Comet4J上下文，负责初始化配置、引擎对象、连接器对象、消息缓存等。
        CometContext cometContext = CometContext.getInstance();

        // 注册频道，即标识哪些字段可用当成频道，用来作为向前台传送数据的“通道”
        cometContext.registChannel(CHANNEL_ORDER);
        cometContext.registChannel(CHANNEL_STATUS);

        //获取引擎对象，并通过引擎添加监听
        CometEngine cometEngine = cometContext.getEngine();

        //添加监听
        cometEngine.addConnectListener(new ConnectListener() {
            @Override
            public boolean handleEvent(ConnectEvent connectEvent) {
                System.out.println("Comet4j Client Connect: "+connectEvent.getConn().getId());
                return true;
            }
        });

        cometEngine.addDyingListener(new DyingListener() {
            @Override
            public boolean handleEvent(DyingEvent dyingEvent) {

                System.out.println("Comet4j Client Dying: "+dyingEvent.getConn().getId());
                return false;
            }
        });

        cometEngine.addRevivalListener(new RevivalListener() {
            @Override
            public boolean handleEvent(RevivalEvent revivalEvent) {

                System.out.println("Comet4j Client Revival: "+revivalEvent.getConn().getId());
                return false;
            }
        });

        cometEngine.addRemovedListener(new RemovedListener() {
            @Override
            public boolean handleEvent(RemovedEvent removedEvent) {

                System.out.println("Comet4j Client Removed: "+removedEvent.getConn().getId());
                return false;
            }
        });

        cometEngine.addDropListener(new DropListener() {
            @Override
            public boolean handleEvent(DropEvent dropEvent) {

                System.out.println("Comet4j Client Drop: "+dropEvent.getConn().getId());


                //Destroyed connect where drop
                boolean isSuccess = Comet4jUtil.getInstance().destroyedConnect(dropEvent.getConn().getId());
                Comet4jUtil.getInstance().showCometConnectList();
                return false;

            }
        });

    }

    /**
     *
     * @param clientId Client side marking
     * @param connId comet connect id
     * @return The client side and the comet link binds whether to succeed
     */
    public boolean bindingConnect(String clientId, String connId){

        if (null == connList.get(clientId)){

            connList.put(clientId, connId);
            return true;
        }else {

            return false;
        }

    }

    /**
     *
     * @param connId comet connect id
     * @return Whether to destroy successfully
     */
    public boolean destroyedConnect(String connId){

        String keyStr= findClientIdByConnectId(connId);

        if (keyStr != null){

            connList.remove(keyStr);
            return true;
        }else {
            System.out.println("key find failed");
        }

        return false;
    }

    /**
     * @param connId comet connect id
     * @return  client Id
     */
    private String findClientIdByConnectId (String connId){

        Iterator iterator = connList.entrySet().iterator();
        while (iterator.hasNext()){
            Map.Entry<String, String> entry = (Map.Entry<String, String>) iterator.next();

            if (connId.equals(entry.getValue()))
                return entry.getKey();
        }

        return null;
    }


    /**
     * Show comet connect list
     */
    public void showCometConnectList(){

        System.out.println("comet connect list:");

        Iterator iterator = connList.entrySet().iterator();
        while (iterator.hasNext()){
            Map.Entry<String, String> entry = (Map.Entry<String, String>) iterator.next();
            System.out.println("|"+entry.getKey()+"\t"+entry.getValue());
        }
    }

    /**
     * send Message To All
     */
    public boolean sendMessageToAll(String str){

        CometEngine engine = CometContext.getInstance().getEngine();
        engine.sendToAll(CHANNEL_ORDER, str);

        return true;
    }
}
