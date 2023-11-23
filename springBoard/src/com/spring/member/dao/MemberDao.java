package com.spring.member.dao;

import java.util.List;

import com.spring.member.vo.MemberVo;

public interface MemberDao {

	public int memberInsert(MemberVo membervo) throws Exception;

	public String memberCheckId(String userId) throws Exception;

	public List<MemberVo> selectMemberList() throws Exception;

	public int memberSelect(MemberVo memberVo) throws Exception;

	public MemberVo memberSelectOne(String userId) throws Exception;

}
