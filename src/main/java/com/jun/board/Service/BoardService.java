package com.jun.board.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.jun.board.Dao.BoardDao;

@Service
public class BoardService {

	@Autowired
	FileService fileService;

	@Autowired
	BoardDao boardDao;

	@Autowired
	CommonService commonService;

	@Autowired
	public JavaMailSender emailSender;

	@Autowired
	HttpSession session;
	
	// 내가 쓴 글 및 게시글 수 확인
	public HashMap<String, Object> myCountInformation(HttpSession session) {
		String userEmail = (String) session.getAttribute("userEmail");

		HashMap<String, Object> countHashMap = new HashMap<String, Object>();

		countHashMap.put("myWriteCount", boardDao.myWriteCount(userEmail));
		countHashMap.put("myReplyCount", boardDao.myReplyCount(userEmail));

		return countHashMap;
	}

	// 좋아요 정보
	public HashMap<String, Object> likeInformation(HttpServletRequest request,
			HttpSession session) {

		HashMap<String, Object> likeCheck = new HashMap<String, Object>();
		HashMap<String, Object> likeInformation = new HashMap<String, Object>();

		String userEmail = (String) session.getAttribute("userEmail");
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));

		likeCheck.put("userEmail", userEmail);
		likeCheck.put("boardNumber", boardNumber);

		Integer myLikeCount = boardDao.myLikeCount(likeCheck);
		Integer allLikeCount = boardDao.allLikeCount(likeCheck);

		likeInformation.put("myLikeCount", myLikeCount);
		likeInformation.put("allLikeCount", allLikeCount);


		return likeInformation;
	}

	// 댓글 읽기
	public ArrayList<HashMap<String, Object>> replyRead(HttpServletRequest request) {

		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		return boardDao.replyRead(boardNumber);
	}

	// 좋아요 업데이트
	public String like(HttpServletRequest request, HttpSession session) {

		
		HashMap<String, Object> boardLikeInformation = new HashMap<String, Object>();

		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		String likeWriter = (String) session.getAttribute("userEmail");
		String likeTime = commonService.nowTime();
		String likeCheck = request.getParameter("likeCheck");
		String deleteResult = null;

		boardLikeInformation.put("boardNumber", boardNumber);
		boardLikeInformation.put("likeWriter", likeWriter);
		boardLikeInformation.put("likeTime", likeTime);
		
		if(boardDao.boardBeingCheck(boardNumber)==0){
			deleteResult ="notBeing";
		}
		
		else if (likeCheck.equals("unlike")) {
			boardDao.likeInsert(boardLikeInformation);
			boardDao.likeCountPlus(boardNumber);

			String nowTime = commonService.nowTime();
			String boardWriter = request.getParameter("boardWriter");
			String boardTitle = request.getParameter("boardTitle");
			
			String subject = "IBM 댓글알림 [ 제목 : " + boardTitle + " ]";
			String text = "IBM Board 댓글알림 \n" + boardWriter + "님이 "
					+ boardTitle + " 글에 좋아요를 누르셨습니다.";

			SimpleMailMessage message = new SimpleMailMessage();

			message.setTo(boardWriter);
			message.setSubject(subject);
			message.setText(text);
			emailSender.send(message);
			
			deleteResult = "likeSuccess";
		} else {
			boardDao.likeDelete(boardLikeInformation);
			boardDao.likeCountMinus(boardNumber);
			deleteResult = "likeFail";
		}
		
		return deleteResult;
	}

	// 댓글 달기
	public String replyInsert(HttpServletRequest request, HttpSession session) {

		HashMap<String, Object> boardReplyInformation = new HashMap<String, Object>();

		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		String replyWriter = (String) session.getAttribute("userEmail");
		String replyContent = request.getParameter("replyContent");
		String replyTime = commonService.nowTime();
		
		String replyResult = null;
		
		if(boardDao.boardBeingCheck(boardNumber)==0){
			replyResult ="notBeing";
		}
		else{
			boardReplyInformation.put("boardNumber", boardNumber);
			boardReplyInformation.put("replyContent", replyContent);
			boardReplyInformation.put("replyTime", replyTime);
			boardReplyInformation.put("replyWriter", replyWriter);

			boardDao.replyInsert(boardReplyInformation);
			replyResult="success";
		}
		
		return replyResult;
	}

	// 게시글 업데이트
	public HashMap<String, Object> boardUpdate(HttpServletRequest request,HttpSession session) {
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));

		HashMap<String, Object> boardInformation = boardDao.boardRead(boardNumber);
		return boardInformation;
	}
	
	// 게시글 정렬
	public ArrayList<HashMap<String, Object>> boardList(HttpServletRequest request) {
		
		ArrayList<HashMap<String, Object>> boardList = new ArrayList<HashMap<String,Object>>();
		
		if(request.getParameter("selectArray")!=null){
			String arrayCheck = request.getParameter("selectArray");
			
			if(arrayCheck.equals("normal") || arrayCheck.equals("fastWrite")){
				boardList = boardDao.boardListDateDESC();
			}
			else if(arrayCheck.equals("slowWrite")){
				boardList = boardDao.boardListDateASC();
			}
			else if(arrayCheck.equals("likeMany")){
				boardList = boardDao.boardListLikeDESC();
			}
			else{
				boardList = boardDao.boardListLikeASC();
			}
		}
		
		else{
			boardList = boardDao.boardListDateDESC();
		}
		
		return boardList;
	}

	// 내 게시글 개수
	public Integer myBoardListCount(HttpSession session) {
		String userEmail = (String) session.getAttribute("userEmail");
		return boardDao.myWriteCount(userEmail);
	}

	// 게시글 읽기
	public HashMap<String, Object> boardRead(HttpServletRequest request,HttpSession session) {

		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		HashMap<String, Object> boardRead = boardDao.boardRead(boardNumber);
		boardRead.put("sessionId", session.getAttribute("userEmail"));

		return boardRead;
	}

	// 게시글 삭제
	public String boardDelete(HttpServletRequest request, HttpSession session) {

		String userEmail = (String) session.getAttribute("userEmail");
		String userType = commonService.userTypeCheck(session);
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		String deleteResult = null;
		
		if(boardDao.boardBeingCheck(boardNumber)==0){
			deleteResult ="notBeing";
		}
		else{
			if (userType.equals("관리자")) {
				boardDao.boardDelete(boardNumber);
				boardDao.deleteBoardLike(boardNumber);
				boardDao.deleteBoardReply(boardNumber);
				deleteResult = "admin";
			} else {
				String boardWriter = boardDao.getBoardWriter(boardNumber);
				if (userEmail.equals(boardWriter)) {
					boardDao.boardDelete(boardNumber);
					boardDao.deleteBoardLike(boardNumber);
					boardDao.deleteBoardReply(boardNumber);
					deleteResult = "userDeleteSuccess";
				} else {
					deleteResult = "userDeleteFail";
				}
			}
		}
		return deleteResult;
	}

	// 게시글 쓰기 업데이트
	public void boardWriteSubmit(HttpServletRequest request, HttpSession session) {

		HashMap<String, Object> boardInformation = new HashMap<String, Object>();

		String userEmail = (String) session.getAttribute("userEmail");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");

		String stringDateTime = commonService.nowTime();

		boardInformation.put("userEmail", userEmail);
		boardInformation.put("boardTitle", boardTitle);
		boardInformation.put("boardContent", boardContent);
		boardInformation.put("boardDate", stringDateTime);

		String path = "c://webProject//ibmProject//src//main//webapp//resources//boardImage";

		Map fileInfo = null;
		fileInfo = fileService.fileUpload(request, path); // 해당 디렉토리 위치에 파일 업로드
		List files = (List) fileInfo.get("files");

		if (files.size() > 0) {

			HashMap<String, Object> fileInformation = new HashMap<String, Object>();

			fileInformation.put("file_gbn", "BD");

			for (int i = 0; i < files.size(); i++) {
				Map file = (Map) files.get(i);

				String origName = (String) file.get("origName");
				File sFile = (File) file.get("sfile");

				boardInformation.put("boardFileName", sFile.getName()); // 복호화된
																		// 파일 이름
				boardInformation.put("boardFilePath", sFile.getAbsolutePath()); // 물리적
				boardInformation.put("boardFileSize", sFile.length()); // 파일 크기
				boardInformation.put("boardFileOrig",
						request.getParameter("imgSrc")); // 원래 파일 명
				boardDao.imgTextWrite(boardInformation);
			}
		}

		else {
			boardDao.onlyTextWrite(boardInformation);
		}
	}

	
	// 게시판 수정 업데이트
	public void boardUpdateSubmit(HttpServletRequest request,
			HttpSession session) {

		HashMap<String, Object> boardInformation = new HashMap<String, Object>();

		String userEmail = (String) session.getAttribute("userEmail");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String imgChangeCheck = request.getParameter("imgChangeCheck");
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));

		String stringDateTime = commonService.nowTime();

		boardInformation.put("boardNumber", boardNumber);
		boardInformation.put("boardUpdateWriter", userEmail);
		boardInformation.put("boardTitle", boardTitle);
		boardInformation.put("boardContent", boardContent);
		boardInformation.put("boardUpdateDate", stringDateTime);

		if (imgChangeCheck.equals("change")) {

			String path = "c://webProject//ibmProject//src//main//webapp//resources//boardImage";

			Map fileInfo = null;
			fileInfo = fileService.fileUpload(request, path); // 해당 디렉토리 위치에 파일
																// 업로드
			List files = (List) fileInfo.get("files");

			if (files.size() > 0) {

				HashMap<String, Object> fileInformation = new HashMap<String, Object>();

				fileInformation.put("file_gbn", "BD");

				for (int i = 0; i < files.size(); i++) {
					Map file = (Map) files.get(i);

					String origName = (String) file.get("origName");
					File sFile = (File) file.get("sfile");

					boardInformation.put("boardFileName", sFile.getName()); // 복호화된
																			// 파일
																			// 이름
					boardInformation.put("boardFilePath",
							sFile.getAbsolutePath()); // 물리적
					boardInformation.put("boardFileSize", sFile.length()); // 파일
																			// 크기
					boardInformation.put("boardFileOrig",
							request.getParameter("imgSrc")); // 원래 파일 명

					boardDao.imgTextUpdate(boardInformation);
				}
			}

			else {
				boardDao.onlyTextUpdate(boardInformation);
			}
		} else {
			boardDao.onlyTextUpdate(boardInformation);
		}

	}
}
