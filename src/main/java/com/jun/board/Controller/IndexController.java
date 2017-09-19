package com.jun.board.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
public class IndexController {

    @RequestMapping("/")
    public String indexPage(HttpSession session){
    	session.invalidate();
        return "index"; 
    }
}
