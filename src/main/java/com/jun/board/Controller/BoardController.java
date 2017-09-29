package com.jun.board.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	// 댓글 작성 완료
	@ResponseBody
	@RequestMapping("/boardReplySubmit")
	public String boardReply(HttpServletRequest request, HttpSession session){
		String replyResult = boardService.replyInsert(request, session);
		return replyResult;
	}
	
	// 좋아요
	@ResponseBody
	@RequestMapping("/boardLike")
	public String boardLike(HttpServletRequest request, HttpSession session){
		String likeResult = boardService.like(request, session);
		return likeResult;
	}
	
	// 글 작성 페이지 이동
	@RequestMapping("/boardWrite")
	public String boardWrite(){
		return "/board/boardWrite";
	}
	
	// 글 작성 완료
	@RequestMapping("/boardWriteSubmit")
	public String boardWriteSubmit(RedirectAttributes redirectAttr,HttpServletRequest request, HttpSession session){
		boardService.boardWriteSubmit(request, session);
		return "redirect:/main/main";
	}
	
	// 게시글 상세보기
	@RequestMapping(value = "/boardRead", method = {RequestMethod.GET})
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
	
	// 게시글 삭제
	@ResponseBody
	@RequestMapping("/boardDelete")
	public String boardDelete (HttpServletRequest request, HttpSession session){
		return boardService.boardDelete(request, session);
	}
	
	// 게시글 업데이트 유무 확인
	@ResponseBody
	@RequestMapping("/boardUpdateCheck")
	public String boardUpdateCheck (HttpServletRequest request, HttpSession session){
		return commonService.authorityCheck(request, session);
	}
	
	// 게시글 수정 화면
	@RequestMapping("/boardUpdate")
	public ModelAndView boardUpdate (HttpServletRequest request, HttpSession session){
		
		ModelAndView boardUpdate = new ModelAndView();
		HashMap<String,Object> boardInformation = boardService.boardRead(request, session);
		
		boardUpdate.addObject("boardInformation", boardInformation);
		boardUpdate.setViewName("/board/boardUpdate");
		return boardUpdate;
	}
	
	// 게시글 수정 완료
	@RequestMapping("/boardUpdateSubmit")
	public String boardUpdateSubmit(HttpServletRequest request, HttpSession session){
		
		boardService.boardUpdateSubmit(request,session);
		return "redirect:/main/main";
	}
	
}
