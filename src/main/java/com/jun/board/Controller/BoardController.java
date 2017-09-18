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
	
	@RequestMapping(value="/boardRead", method=RequestMethod.GET)
	public ModelAndView boardRead(HttpServletRequest request, HttpSession session){
		
		ModelAndView boardRead = new ModelAndView();
		
		
		return boardRead;
		
	}
	
	
	
	
	
}
