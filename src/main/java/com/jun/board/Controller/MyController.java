package com.jun.board.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jun.board.Dao.UserDao;
import com.jun.board.Service.MyService;


@Controller
@RequestMapping("/my")
public class MyController {
	
	

    @Autowired
    private UserDao userDao;
    
    @Autowired
    MyService myService;
    
    // 내 정보 첫화면
    @RequestMapping("/index")
    public ModelAndView adminIndex(HttpSession session){
    	ArrayList<HashMap<String,Object>> myWrite = myService.myWrite(session);
    	ArrayList<HashMap<String,Object>> myReply = myService.myReply(session);
    	
    	ModelAndView myIndex = new ModelAndView();
    	myIndex.addObject("myWrite",myWrite);
    	myIndex.addObject("myReply",myReply);
    	myIndex.setViewName("myInformation/myInformationIndex");
    	
    	return myIndex;
    }
}
