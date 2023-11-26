package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.TypeVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		return sqlSession.update("board.boardUpdate", boardVo);
	}
	
	
	@Override
	public int boardDelete(BoardVo boardVo) {
		return sqlSession.delete("board.boardDelete", boardVo);
	}
	@Override
	public List<BoardVo> selectBoardListSearch(TypeVo typeVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardSearch",typeVo);
	}
	@Override
	public int selectBoardCntSearch(TypeVo typeVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardSearchTotal",typeVo);
	}


	@Override
	public List<CodeVo> selectBoardType() throws Exception {
	
		return sqlSession.selectList("board.boardType");
	}


	@Override
	public List<BoardVo> selectBoardList(TypeVo typeVo) throws Exception {
		return sqlSession.selectList("board.boardSelect",typeVo);
	}


	@Override
	public int selectBoardCnt(TypeVo typeVo) throws Exception {
		return sqlSession.selectOne("board.boardSelectTotal",typeVo);
	}
	
	
}
