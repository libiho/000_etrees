package com.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.vo.BoardVo;
import com.spring.common.CommonUtil;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/member/memberCheckId.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(Locale locale, String userId ) throws Exception {
		
		System.out.println(userId);
		int flag = memberService.memberCheckId(userId);
		
		return flag > 0 ? "N" : "Y";
	}
	
	
	
	
	
	@RequestMapping(value = "/member/memberInsert.do", method = RequestMethod.GET)
	public String memberInsert(Locale locale) throws Exception {
		
		// 멤버 전체 조회 후 model로 phone앞번호 던지기
		
		return "member/memberInsert";
	}
	
	
	
	@RequestMapping(value="/member/memberInsertAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String memberInsertAction(Locale locale, MemberVo membervo) throws Exception {
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = memberService.memberInsert(membervo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
		
	}
	
	
	@RequestMapping(value = "/member/memberLogin.do", method = RequestMethod.GET)
	public String memberLogin(Locale locale, Model model) throws Exception {
		return "member/memberLogin";
	}
}
