package com.controller;

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
        return "";
    }

    @RequestMapping(value = "/ipadweb.do", method = RequestMethod.GET)
    public String ipadweb(){


       return "ipadweb";
    }

    @RequestMapping(value = "/mbweb.do", method = RequestMethod.GET)
    public String mbweb(){


        return "mpweb";
    }
}
