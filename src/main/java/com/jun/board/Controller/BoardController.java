package com.jun.board.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jun.board.Service.BoardService;
import com.jun.board.Service.UserInformationService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	UserInformationService userInformationService;
	
	@RequestMapping("/boardWrite")
	public String boardWrite(){
		return "/board/boardWrite";
		
	}
	
	@RequestMapping("/boardWriteSubmit")
	public String boardWriteSubmit(RedirectAttributes redirectAttr,HttpServletRequest request, HttpSession session){
		
		boardService.boardWriteSubmit(request, session);
		return "redirect:/main/main";
	}
	
	@RequestMapping("/boardRead")
	public ModelAndView boardRead(HttpServletRequest request, HttpSession session){
		
		ModelAndView boardReadModel = new ModelAndView();
		
		HashMap<String,Object> boardReadInformation = boardService.boardRead(request, session);
		boardReadModel.addObject("boardReadInformation", boardReadInformation);
		boardReadModel.setViewName("/board/boardRead");

		return boardReadModel;
	}
	
	@ResponseBody
	@RequestMapping("/boardDelete")
	public String boardDelete (HttpServletRequest request, HttpSession session){
		
		return boardService.boardDelete(request, session);
		
		//return "redirect:/main/main";
	}
	
	
	
	
	
}
