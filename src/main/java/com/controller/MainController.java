package com.controller;

import com.comet4j.Comet4jUtil;
import com.domain.TCPMessageType;
import com.socket.TCPMessageProcessUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by jony on 2/1/18.
 */

@Controller
public class MainController {

    @RequestMapping(value = "/bind.do", method = RequestMethod.POST)
    @ResponseBody
    public String bind(String clientId, String connId){
        boolean isSuccess = Comet4jUtil.getInstance().bindingConnect(clientId, connId);
        Comet4jUtil.getInstance().showCometConnectList();

        return "bind "+isSuccess;
    }

    @RequestMapping(value = "/web/login.do", method = RequestMethod.POST)
    @ResponseBody
    public String webLogin(String username,String password) {

        System.out.println("login:username:"+username+"password:"+password);
        return "webLogin server";
    }

    @RequestMapping(value = "/ipadweb.do", method = RequestMethod.GET)
    public String ipadweb(){


       return "ipadweb";
    }

    @RequestMapping(value = "/mpweb.do", method = RequestMethod.GET)
    public String mbweb(){


        return "mpweb";
    }

    @RequestMapping(value = "/comet4jtest.do", method = RequestMethod.GET)
    public String comet4jtest(){
        return "comet4jtest";
    }

    @RequestMapping(value = "/send.do", method = RequestMethod.POST)
    @ResponseBody
    public String send(String str){

        boolean isSuccess = TCPMessageProcessUtil.codeTCPMessageAndSend(TCPMessageType.CONTROL, str);

        return "send "+isSuccess;
    }
}
