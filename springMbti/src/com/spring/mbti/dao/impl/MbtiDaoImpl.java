package com.spring.mbti.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mbti.dao.MbtiDao;
import com.spring.mbti.vo.MbtiVo;

@Repository
public class MbtiDaoImpl implements MbtiDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MbtiVo> selectMbtiAll() throws Exception {
		return sqlSession.selectList("mbtiListAll");
	}

}
