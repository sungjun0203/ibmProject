package com.jun.meeting.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping("/")
    public String index(){
    	   
        return "index";
    }
}
