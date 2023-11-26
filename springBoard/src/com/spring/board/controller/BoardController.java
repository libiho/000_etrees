package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.TypeVo;
import com.spring.common.CommonUtil;
import com.spring.common.model.vo.PageInfo;
import com.spring.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);



	
	
//	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
//	public String boardList(Locale locale, Model model, TypeVo typeVo) throws Exception {
//
//		
//		List<BoardVo> boardList = new ArrayList<BoardVo>();
//
//		int page = 1;
//		int totalCnt = 0;
//
//		if (typeVo.getPageNo() == 0) {
//			typeVo.setPageNo(page);
//		}
//		
//	
//		boardList = boardService.selectBoardListSearch(typeVo);
//		totalCnt = boardService.selectBoardCntSearch(typeVo);
//		
//
//		model.addAttribute("boardList", boardList);
//		model.addAttribute("totalCnt", totalCnt);
//		model.addAttribute("pageNo", page);
//
//		return "board/boardList";
//	}
	
	
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, TypeVo typeVo) throws Exception {

		System.out.println("ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		List<BoardVo> boardList = new ArrayList<BoardVo>();

		int page = 1;
		int totalCnt = 0;

		if (typeVo.getPageNo() == 0) {
			typeVo.setPageNo(page);
		}
		
	
		boardList = boardService.selectBoardListSearch(typeVo);
		totalCnt = boardService.selectBoardCntSearch(typeVo);
		

		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);

		return "board/boardList";
	}	

	
	@RequestMapping(value = "/board/boardListSearch.do", method = RequestMethod.GET)
	public String boardListSearch(Locale locale, Model model, TypeVo typeVo) throws Exception {

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		List<BoardVo> boardList = new ArrayList<BoardVo>();

		int page = 1;
		int totalCnt = 0;

		if (typeVo.getPageNo() == 0) {
			typeVo.setPageNo(page);
		}
		
	
		boardList = boardService.selectBoardList(typeVo);
		totalCnt = boardService.selectBoardCnt(typeVo);
		

		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);

		return "board/boardList";
	}
	
	

	
	
	
	
	
	


	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		

		return "board/boardView";
	}
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception {


		List<CodeVo> boardType = new ArrayList<CodeVo>();
		
		boardType = boardService.selectBoardType();
		
		model.addAttribute("boardType",boardType);
		
		return "board/boardWrite";
	}

	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardInsert(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.POST)
	public String boardUpdate(Locale locale, Model model, int boardNum, String boardType) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);

		return "board/boardUpdate";
	}
	
	
	
	
	
	@RequestMapping(value="/board/boardUpdateAction.do", method= RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale, BoardVo boardVo) throws Exception {
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardUpdate(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);


		return callbackMsg;

	}
	
	
	@RequestMapping(value="/board/boardDelete.do", method= RequestMethod.POST)
	@ResponseBody
	public String boardDelete(Locale locale, BoardVo boardVo) throws Exception {
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardDelete(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		
		 return callbackMsg;

	}
	

} // end
