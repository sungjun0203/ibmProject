package com.jun.board.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jun.board.Dao.UserDao;
import com.jun.board.Service.CommonService;
import com.jun.board.Service.NoticeListService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

//    @Autowired
//    NoticeListService noticeListService;

    @Autowired
    UserDao userDao;
    
    @Autowired
    CommonService commonService;
    
    @Autowired
    NoticeListService noticeListService;

    @RequestMapping(value = "/noticeList")
    public ModelAndView noticeList(HttpServletRequest request, HttpSession session){
        String userEmail = (String) session.getAttribute("userEmail");

        ArrayList<HashMap<String,Object>> noticeInformation = noticeListService.noticeList();
        System.out.println(noticeInformation);

        ModelAndView noticeListResult = new ModelAndView();
        noticeListResult.setViewName("/notice/noticeList");
        noticeListResult.addObject("noticeInformation",noticeInformation);
        return noticeListResult;
    }
    
    @RequestMapping(value ="/noticeWrite")
    public String adminCheck(HttpServletRequest request, HttpSession session){
    	
    	
    	return "notice/noticeWrite";
    	
    	
    }

}