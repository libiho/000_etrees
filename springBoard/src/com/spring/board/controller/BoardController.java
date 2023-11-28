package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	/**
	 * @Comment : 게시글 전체 조회 - 첫화면 로딩
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
//	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
//	public String boardList(Locale locale, Model model, TypeVo typeVo) throws Exception {
//
//		List<BoardVo> boardList = new ArrayList<BoardVo>();
//		List<CodeVo> boardType = new ArrayList<CodeVo>();
//
//		int pageNo = 1;
//		int totalCnt = 0;
//
//		if (typeVo.getPageNo() == 0) {
//			typeVo.setPageNo(pageNo);
//		}
//
//		boardList = boardService.selectBoardList(typeVo);
//		totalCnt = boardService.selectBoardCnt(typeVo);
//
//		boardType = boardService.selectBoardType();
//
//		model.addAttribute("boardType", boardType);
//		model.addAttribute("boardList", boardList);
//		model.addAttribute("totalCnt", totalCnt);
//		model.addAttribute("pageNo", pageNo);
//
//		return "board/boardList";
//	}

	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, TypeVo typeVo,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage) throws Exception {

		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<CodeVo> boardType = new ArrayList<CodeVo>();

		int pageNo = 1;
		int totalCnt = 0;

		if (typeVo.getPageNo() == 0) {
			typeVo.setPageNo(pageNo);
		}

		boardList = boardService.selectBoardList(typeVo);
		totalCnt = boardService.selectBoardCnt(typeVo);

		PageInfo pi = Pagination.getPageInfo(totalCnt, currentPage, 10, 5);

		boardType = boardService.selectBoardType();

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pi", pi);

		return "board/boardList";
	}

	/**
	 * @Comment : 게시글 목록 체크박스 - map
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/board/boardListSearch.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> boardListSearch(Locale locale, Model model, TypeVo typeVo,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage) throws Exception {

		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<CodeVo> boardType = new ArrayList<CodeVo>();

		int totalCnt = 0;
		int page = 1;

		if (typeVo.getPageNo() == 0) {
			typeVo.setPageNo(page);
		}else {
			typeVo.setPageNo(typeVo.getPageNo());
		}

		// Java 코드에서 type이 null 또는 빈 문자열인 경우에 따라 처리
		if (typeVo.getBoardType().equals("on")) {
			typeVo.setBoardType(null);
		}

		boardList = boardService.selectBoardListSearch(typeVo);

		totalCnt = boardService.selectBoardCntSearch(typeVo);
		boardType = boardService.selectBoardType();

		PageInfo pi = Pagination.getPageInfo(totalCnt, currentPage, 10, 5);

		Map<String, Object> response = new HashMap<>();
		response.put("boardList", boardList);
		response.put("totalCnt", totalCnt);
		response.put("boardType", boardType);
		response.put("pageNo", page);
		response.put("pi", pi);
		


		
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	/**
	 * @Comment : 게시글 상세 조회
	 * @version : 1.0
	 * @date : 2023. 11. 27.
	 */
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

	/**
	 * @Comment : 게시글 작성 jsp 이동
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception {

		List<CodeVo> boardType = new ArrayList<CodeVo>();

		boardType = boardService.selectBoardType();

		model.addAttribute("boardType", boardType);

		return "board/boardWrite";
	}

	/**
	 * @Comment : 게시글 작성 완료
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
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

	/**
	 * @Comment : 게시글 업데이트 jsp 이동
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.POST)
	public String boardUpdate(Locale locale, Model model, int boardNum, String boardType) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);

		return "board/boardUpdate";
	}

	/**
	 * @Comment : 게시글 업데이트 완료
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale, BoardVo boardVo) throws Exception {
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardUpdate(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		return callbackMsg;

	}

	/**
	 * @Comment : 게시글 삭제
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.POST)
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
