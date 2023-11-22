package com.spring.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.TypeVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	

	
	
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return boardDao.selectBoardListSearch(typeVo);
	}

	@Override
	public int selectBoardCntSearch(TypeVo typeVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCntSearch(typeVo);
	}

	
}
