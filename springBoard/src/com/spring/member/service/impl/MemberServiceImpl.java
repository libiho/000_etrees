package com.spring.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.dao.MemberDao;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public int memberInsert(MemberVo membervo) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.memberInsert(membervo);
	}

	@Override
	public String memberCheckId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.memberCheckId(userId);
	}

	@Override
	public List<MemberVo> selectMemberList() throws Exception {
		// TODO Auto-generated method stub
		return memberDao.selectMemberList();
	}

	@Override
	public int memberSelect(MemberVo memberVo) throws Exception {
		return memberDao.memberSelect(memberVo);
	}

	@Override
	public MemberVo memberSelectOne(String userId) throws Exception {
		return memberDao.memberSelectOne(userId);
	}
	
	

}
