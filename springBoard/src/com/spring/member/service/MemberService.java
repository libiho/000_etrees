package com.spring.member.service;

import com.spring.member.vo.MemberVo;

public interface MemberService {

	int memberInsert(MemberVo membervo) throws Exception;

	int memberCheckId(String userId) throws Exception;

}
