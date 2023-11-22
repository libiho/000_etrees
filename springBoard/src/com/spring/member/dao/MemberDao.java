package com.spring.member.dao;

import com.spring.member.vo.MemberVo;

public interface MemberDao {

	int memberInsert(MemberVo membervo) throws Exception;

	int memberCheckId(String userId) throws Exception;

}
