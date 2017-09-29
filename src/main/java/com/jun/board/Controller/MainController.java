package com.jun.board.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jun.board.Service.BoardService;
import com.jun.board.Service.NoticeListService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	NoticeListService noticeListService;
	
	// 메인화면 출력
	@RequestMapping(value = "/main", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView main(HttpSession session, HttpServletRequest request) {
		
		String userEmail = request.getParameter("email");
		if(session.getAttribute("userEmail")==null){
			session.setAttribute("userEmail", userEmail);
		}
		
		ArrayList<HashMap<String,Object>> boardList = boardService.boardList(request);
		HashMap<String,Object> myCountInformation = boardService.myCountInformation(session);
		ArrayList<HashMap<String,Object>> noticeInformation = noticeListService.noticeList();
		
		ModelAndView mainModelAndView = new ModelAndView();
		mainModelAndView.addObject("userEmail",userEmail);
		mainModelAndView.addObject("boardList",boardList);
		mainModelAndView.addObject("myCountInformation",myCountInformation);
		mainModelAndView.addObject("noticeInformation",noticeInformation);
		
		mainModelAndView.setViewName("/main/main");

		return mainModelAndView;
	}
	
	
}
