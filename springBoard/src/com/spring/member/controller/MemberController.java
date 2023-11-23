package com.spring.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.vo.BoardVo;
import com.spring.common.CommonUtil;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import java.util.List;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/member/memberCheckId.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(Locale locale, String userId ) throws Exception {
		
		String exist = memberService.memberCheckId(userId);
		
		return exist != null ? "N" : "Y";
	}
	
	
	
	
	
	@RequestMapping(value = "/member/memberInsert.do", method = RequestMethod.GET)
	public String memberInsert(Locale locale, Model model) throws Exception {
		
		// 멤버 전체 조회 후 model로 phone앞번호 던지기
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		
		memberList = memberService.selectMemberList();
		
		model.addAttribute("memberList", memberList);
		
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
	public String memberLogin(Locale locale) throws Exception {
		return "member/memberLogin";
	}
	
	
	
	@RequestMapping(value = "/member/memberLoginAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberLoginAction(Locale locale, Model model, MemberVo memberVo, HttpSession session) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = memberService.memberSelect(memberVo);
		
		
		// ### checkId 다시 int로 바꾸고  memberVo 다시 세팅해서 받는 하나만 조회하는 메소드 만들기 memberSelectOne
		
		String userName = memberService.memberCheckId(memberVo.getUserId());

		
		memberVo = memberService.memberSelectOne(memberVo.getUserId());
		
		
		
		
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		session.setAttribute("loginUser", userName);
		session.setAttribute("userName", memberVo);
		
		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
		
	}
	
	
	@RequestMapping(value="/member/memberLogout.do",method = RequestMethod.GET )
	public String logoutMember(HttpSession session) {
		
		session.invalidate(); // 세션 날리기 = 정보 날리기
		return "/board/boardList.do";
	}
	
	
	
	
	
	
}
