package com.spring.member.service.impl;

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
	public int memberCheckId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.memberCheckId(userId);
	}
	
	

}
