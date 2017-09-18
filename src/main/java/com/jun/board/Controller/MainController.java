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

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	BoardService boardService;
	


	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public ModelAndView main(HttpSession session, HttpServletRequest request) {

		String userEmail = request.getParameter("email");
		session.setAttribute("userEmail", userEmail);

//		HashMap<String, Object> userInformation = userInformationService
//				.userInformation(session);
		
		ArrayList<HashMap<String,Object>> boardList = boardService.boardList();
		
		ModelAndView mainModelAndView = new ModelAndView();
		//mainModelAndView.addObject("userInformation", userInformation);
		mainModelAndView.addObject("boardList",boardList);
		System.out.println(boardList);

		mainModelAndView.setViewName("/main/main");

		return mainModelAndView;
	}
}
