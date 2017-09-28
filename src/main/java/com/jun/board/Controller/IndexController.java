package com.jun.board.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class IndexController {
	

	// 첫 화면
    @RequestMapping("/")
    public String indexPage(HttpSession session){
    	session.invalidate();
        return "index"; 
    }
}
