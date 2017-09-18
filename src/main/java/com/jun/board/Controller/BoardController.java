package com.jun.board.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
}
