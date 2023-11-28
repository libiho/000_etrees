package com.spring.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.TypeVo;

public interface boardService {

	public String selectTest() throws Exception;


	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;


	public int boardInsert(BoardVo boardVo) throws Exception;

	public int boardUpdate(BoardVo boardVo) throws Exception;

	public int boardDelete(BoardVo boardVo) throws Exception;

	public List<BoardVo> selectBoardListSearch(TypeVo typeVo) throws Exception;

	public int selectBoardCntSearch(TypeVo typeVo) throws Exception;

	public List<CodeVo> selectBoardType() throws Exception;

	public List<BoardVo> selectBoardList(TypeVo typeVo) throws Exception;

	public int selectBoardCnt(TypeVo typeVo) throws Exception;






}
