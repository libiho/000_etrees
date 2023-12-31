package com.spring.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.TypeVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		return boardDao.selectTest();
	}
	

	
	
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		return boardDao.boardInsert(boardVo);
	}
	
	
	
	@Override
	public int boardUpdate(BoardVo boarVo) throws Exception {
		return boardDao.boardUpdate(boarVo);
	}
	
	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		return boardDao.boardDelete(boardVo);
	}

	@Override
	public List<BoardVo> selectBoardListSearch(TypeVo typeVo) throws Exception {
		return boardDao.selectBoardListSearch(typeVo);
	}

	@Override
	public int selectBoardCntSearch(TypeVo typeVo) throws Exception {
		return boardDao.selectBoardCntSearch(typeVo);
	}





	@Override
	public List<CodeVo> selectBoardType() throws Exception {
		return boardDao.selectBoardType();
	}





	@Override
	public List<BoardVo> selectBoardList(TypeVo typeVo) throws Exception {
		return boardDao.selectBoardList(typeVo);
	}





	@Override
	public int selectBoardCnt(TypeVo typeVo) throws Exception {
		return boardDao.selectBoardCnt(typeVo);
	}

	
}
