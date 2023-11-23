package com.spring.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.member.dao.MemberDao;
import com.spring.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int memberInsert(MemberVo memberVo) throws Exception{
		return sqlSession.insert("member.memberInsert",memberVo);
	}


	@Override
	public String memberCheckId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.memberCheckId",userId);
	}


	@Override
	public List<MemberVo> selectMemberList() throws Exception {
		return sqlSession.selectList("member.memberSelectAll");
	}


	@Override
	public int memberSelect(MemberVo memberVo) throws Exception {
		return sqlSession.selectOne("member.memberSelect",memberVo);
	}


	@Override
	public MemberVo memberSelectOne(String userId) throws Exception {
		return sqlSession.selectOne("member.memberSelectOne",userId);
	}
	
}
