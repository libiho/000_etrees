package com.spring.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.vo.CodeVo;
import com.spring.common.CommonUtil;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * @Comment : 아이디 중복 체크
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/member/memberCheckId.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(Locale locale, String userId) throws Exception {

		String exist = memberService.memberCheckId(userId);

		return exist != null ? "N" : "Y";
	}

	/**
	 * @Comment : 회원가입 jsp 이동
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/member/memberInsert.do", method = RequestMethod.GET)
	public String memberInsert(Locale locale, Model model) throws Exception {

		List<CodeVo> uniquePhoneList = new ArrayList<CodeVo>();

		uniquePhoneList = memberService.selectPhoneType();

		model.addAttribute("uniquePhoneList", uniquePhoneList);
		
		return "member/memberInsert";
	}

	
	/**
	 * @Comment : 회원가입 완료 
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/member/memberInsertAction.do", method = RequestMethod.POST)
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

	/**
	 * @Comment : 로그인 jsp 이동  
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/member/memberLogin.do", method = RequestMethod.GET)
	public String memberLogin(Locale locale) throws Exception {
		return "member/memberLogin";
	}

	/**
	 * @Comment : 로그인 완료 
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/member/memberLoginAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String memberLoginAction(Locale locale, Model model, MemberVo memberVo, HttpSession session)
			throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		MemberVo user = new MemberVo();

		int resultCnt = memberService.memberSelect(memberVo);

		String userName = "";
		String userId = "";

		if (resultCnt > 0) {
			user = memberService.memberCheckId(memberVo);
			userName = user.getUserName();
			userId = user.getUserId();

		}

		result.put("success", (resultCnt > 0) ? "Y" : "N");

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		session.setAttribute("loginUser", user);
		session.setAttribute("userName", userName);
		session.setAttribute("userId", userId);

		return callbackMsg;

	}

	/**
	 * @Comment : 로그아웃 완료
	 * @version : 1.0
	 * @author : mini
	 * @date : 2023. 11. 27.
	 */
	@RequestMapping(value = "/member/memberLogout.do", method = RequestMethod.GET)
	public String logoutMember(HttpSession session) {

		session.invalidate(); // 세션 날리기 = 정보 날리기
		return "redirect:/board/boardList.do";
	}

}
