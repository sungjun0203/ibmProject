package com.jun.board.Controller;

import java.util.ArrayList;
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
import com.jun.board.Service.CommonService;
import com.jun.board.Service.UserInformationService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	UserInformationService userInformationService;
	
	@Autowired
	CommonService commonService;
	
	@ResponseBody
	@RequestMapping("/boardReplySubmit")
	public String boardReply(HttpServletRequest request, HttpSession session){
		
		boardService.replyInsert(request, session);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/boardLike")
	public String boardLike(HttpServletRequest request, HttpSession session){
		System.out.println("aaa");
		boardService.like(request, session);
		return "success";
	}
	
	
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
		ArrayList<HashMap<String,Object>> boardReplyInformation = boardService.replyRead(request);
		HashMap<String,Object> likeInformation = boardService.likeInformation(request,session);
		
		boardReadModel.addObject("likeInformation", likeInformation);
		boardReadModel.addObject("boardReadInformation", boardReadInformation);
		boardReadModel.addObject("boardReplyInformation", boardReplyInformation);
		boardReadModel.setViewName("/board/boardRead");

		return boardReadModel;
	}
	
	@ResponseBody
	@RequestMapping("/boardDelete")
	public String boardDelete (HttpServletRequest request, HttpSession session){
		return boardService.boardDelete(request, session);
	}
	
	@ResponseBody
	@RequestMapping("/boardUpdateCheck")
	public String boardUpdateCheck (HttpServletRequest request, HttpSession session){
		return commonService.authorityCheck(request, session);
	}
	
	@RequestMapping("/boardUpdate")
	public ModelAndView boardUpdate (HttpServletRequest request, HttpSession session){
		
		ModelAndView boardUpdate = new ModelAndView();
		HashMap<String,Object> boardInformation = boardService.boardRead(request, session);
		
		boardUpdate.addObject("boardInformation", boardInformation);
		System.out.println("nameCheck"+boardInformation);
		boardUpdate.setViewName("/board/boardUpdate");
		return boardUpdate;
	}
	
	@RequestMapping("/boardUpdateSubmit")
	public String boardUpdateSubmit(HttpServletRequest request, HttpSession session){
		
		boardService.boardUpdateSubmit(request,session);
		return "redirect:/main/main";
	}
	
}
