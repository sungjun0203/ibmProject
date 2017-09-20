package com.jun.board.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.BoardDao;

@Service
public class BoardService {

	@Autowired
	FileService fileService;

	@Autowired
	BoardDao boardDao;

	@Autowired
	CommonService commonService;
	
	public HashMap<String,Object> likeInformation(HttpServletRequest request, HttpSession session){
		
		HashMap<String,Object> likeCheck = new HashMap<String,Object>();
		HashMap<String,Object> likeInformation = new HashMap<String,Object>();
		
		String userEmail = (String)session.getAttribute("userEmail");
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		likeCheck.put("userEmail",userEmail);
		likeCheck.put("boardNumber",boardNumber);
		
		Integer myLikeCount = boardDao.myLikeCount(likeCheck);
		Integer allLikeCount = boardDao.allLikeCount(likeCheck);
		
		likeInformation.put("myLikeCount", myLikeCount);
		likeInformation.put("allLikeCount", allLikeCount);
		
		System.out.println(likeInformation);
		
		return likeInformation;
	}
	
	public ArrayList<HashMap<String,Object>> replyRead(HttpServletRequest request){
		
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		return boardDao.replyRead(boardNumber);
	}
	
	public void like(HttpServletRequest request, HttpSession session){
		
		HashMap<String,Object> boardLikeInformation = new HashMap<String,Object>();
		
		String boardNumber = request.getParameter("boardNumber");
		String likeWriter = (String)session.getAttribute("userEmail");
		String likeTime = commonService.nowTime();
		String likeCheck = request.getParameter("likeCheck");
		
		boardLikeInformation.put("boardNumber", boardNumber);
		boardLikeInformation.put("likeWriter", likeWriter);
		boardLikeInformation.put("likeTime", likeTime);
		
		System.out.println(boardLikeInformation + likeCheck);
		
		if(likeCheck.equals("unlike")){
			boardDao.likeInsert(boardLikeInformation);
		}
		else{
			boardDao.likeDelete(boardLikeInformation);
		}
	}
	
	public void replyInsert(HttpServletRequest request, HttpSession session){
		
		HashMap<String,Object> boardReplyInformation = new HashMap<String,Object>();
		
		String boardNumber = request.getParameter("boardNumber");
		String replyWriter = (String)session.getAttribute("userEmail");
		String replyContent = request.getParameter("replyContent");
		String replyTime = commonService.nowTime();
		
		boardReplyInformation.put("boardNumber", boardNumber);
		boardReplyInformation.put("replyContent", replyContent);
		boardReplyInformation.put("replyTime", replyTime);
		boardReplyInformation.put("replyWriter", replyWriter);
		
		boardDao.replyInsert(boardReplyInformation);
	}

	public HashMap<String, Object> boardUpdate(HttpServletRequest request,
			HttpSession session) {
		Integer boardNumber = Integer.parseInt(request
				.getParameter("boardNumber"));

		HashMap<String, Object> boardInformation = boardDao
				.boardRead(boardNumber);
		return boardInformation;
	}

	public String boardUpdateCheck(HttpServletRequest request,
			HttpSession session) {
		String userEmail = (String) session.getAttribute("userEmail");
		Integer boardNumber = Integer.parseInt(request
				.getParameter("boardNumber"));
		String updateResult = null;

		String boardWriter = boardDao.getBoardWriter(boardNumber);

		if (userEmail.equals(boardWriter)) {
			updateResult = "userUpdateSuccess";
		} else {
			updateResult = "userUpdateFail";
		}

		return updateResult;
	}

	public ArrayList<HashMap<String, Object>> boardList() {
		ArrayList<HashMap<String, Object>> boardList = boardDao.boardList();

		return boardList;
	}

	public HashMap<String, Object> boardRead(HttpServletRequest request,HttpSession session) {

		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		HashMap<String, Object> boardRead = boardDao.boardRead(boardNumber);
		boardRead.put("sessionId", session.getAttribute("userEmail"));

		return boardRead;
	}

	public String boardDelete(HttpServletRequest request, HttpSession session) {

		String userEmail = (String) session.getAttribute("userEmail");
		String userType = commonService.userTypeCheck(session);
		Integer boardNumber = Integer.parseInt(request
				.getParameter("boardNumber"));
		String deleteResult = null;

		if (userType.equals("관리자")) {
			boardDao.boardDelete(boardNumber);
			deleteResult = "admin";
		} else {
			String boardWriter = boardDao.getBoardWriter(boardNumber);
			if (userEmail.equals(boardWriter)) {
				boardDao.boardDelete(boardNumber);
				deleteResult = "userDeleteSuccess";
			} else {
				deleteResult = "userDeleteFail";
			}
		}

		return deleteResult;
	}

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

	public void boardUpdateSubmit(HttpServletRequest request, HttpSession session){

		HashMap<String,Object> boardInformation = new HashMap<String,Object>();
		
		String userEmail = (String) session.getAttribute("userEmail");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String imgChangeCheck = request.getParameter("imgChangeCheck");
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		String stringDateTime = commonService.nowTime();
		
		System.out.println("12313321321132132" +boardNumber);
		
		boardInformation.put("boardNumber", boardNumber);
		boardInformation.put("boardUpdateWriter", userEmail);
		boardInformation.put("boardTitle", boardTitle);
		boardInformation.put("boardContent",boardContent);
		boardInformation.put("boardUpdateDate",stringDateTime);
		
		System.out.println(imgChangeCheck + " cccccccccccc");
		
		if(imgChangeCheck.equals("change")){
			
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

					boardInformation.put("boardFileName", sFile.getName()); // 복호화된 파일 이름
					boardInformation.put("boardFilePath", sFile.getAbsolutePath()); // 물리적
					boardInformation.put("boardFileSize", sFile.length()); // 파일 크기
					boardInformation.put("boardFileOrig", request.getParameter("imgSrc")); // 원래 파일 명
					
					System.out.println("toto"+boardInformation);
					boardDao.imgTextUpdate(boardInformation);
				}
			}
			
			else{
				System.out.println("else~~~~");
				boardDao.onlyTextUpdate(boardInformation);
			}
		}
		else{
			boardDao.onlyTextUpdate(boardInformation);
		}
		
	}
}
