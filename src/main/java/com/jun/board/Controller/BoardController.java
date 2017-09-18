package com.jun.board.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jun.board.Service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/boardWrite")
	public String boardWrite(){
		return "/board/boardWrite";
		
	}
	
	@RequestMapping("/boardWriteSubmit")
	public String boardWriteSubmit(HttpServletRequest request, HttpSession session){
		
		boardService.boardWriteSubmit(request, session);
		
		return "/main/main";
	}
	
	@RequestMapping("/boardRead")
	public ModelAndView boardRead(HttpServletRequest request, HttpSession session){
		
		System.out.println("hello");
		System.out.println(request.getParameter("boardSeq"));
		
		ModelAndView boardRead = new ModelAndView();
		boardRead.setViewName("/board/boardRead");
		
		
		
		return boardRead;
		
	}
	
	
	
	
	
}
