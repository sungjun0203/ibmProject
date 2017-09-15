package com.jun.board.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")
public class MainController {
	


	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public ModelAndView main(HttpSession session, HttpServletRequest request) {

		String userEmail = request.getParameter("email");
		session.setAttribute("userEmail", userEmail);

//		HashMap<String, Object> userInformation = userInformationService
//				.userInformation(session);

		ModelAndView mainModelAndView = new ModelAndView();
		//mainModelAndView.addObject("userInformation", userInformation);

		mainModelAndView.setViewName("/main/main");

		return mainModelAndView;
	}
}
