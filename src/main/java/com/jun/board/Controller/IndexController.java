package com.jun.board.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
public class IndexController {

    @RequestMapping("/")
    public String indexPage(){
    	System.out.println("abb");
        return "index"; 
    }
}
