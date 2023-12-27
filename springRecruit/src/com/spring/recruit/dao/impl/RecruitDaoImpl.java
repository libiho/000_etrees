package com.spring.recruit.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.vo.RecruitVo;

@Repository
public class RecruitDaoImpl implements RecruitDao{
	
	
	@Autowired
	private SqlSession sqlSession;
	
	
//	private final SqlSession sqlSession;
//	
//	public RecruitDaoImpl(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
	

	@Override
	public int selectMemberOne(RecruitVo recruitVo) {
		return sqlSession.selectOne("selectMemberOne",recruitVo);
	}

}
