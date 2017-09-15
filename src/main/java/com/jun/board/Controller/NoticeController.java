package com.jun.board.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jun.board.Dao.UserDao;
import com.jun.board.Service.CommonService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

//    @Autowired
//    NoticeListService noticeListService;

    @Autowired
    UserDao userDao;
    
    @Autowired
    CommonService commonService;

    @RequestMapping(value = "/noticeList")
    public ModelAndView noticeList(HttpServletRequest request, HttpSession session){
        String userEmail = (String) session.getAttribute("userEmail");
        System.out.println(userEmail);

        //ArrayList<HashMap<String,Object>> noticeInformation = noticeListService.noticeList();

        ModelAndView noticeListResult = new ModelAndView();
        noticeListResult.setViewName("/notice/noticeList");
        //noticeListResult.addObject("noticeInformation",noticeInformation);
        return noticeListResult;
    }
    
    @RequestMapping(value ="/noticeWrite")
    public String adminCheck(HttpServletRequest request, HttpSession session){
    	
    	
    	return "notice/noticeWrite";
    	
    	
    }

}