	package com.spring.recruit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.recruit.service.RecruitService;
import com.spring.recruit.service.impl.RecruitServiceImpl;
import com.spring.recruit.vo.RecruitVo;

@Controller
@RequestMapping("/recruit")
public class RecruitController {
	

	@Autowired
	RecruitService rService;
//	private final RecruitService rService;
//	
//
//	public RecruitController(RecruitService rService) {
//		this.rService = rService;
//	}
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(RecruitController.class);
	
	
	
	@RequestMapping("/login")
	public String recruitLogin() {
		logger.info("로그인 페이지 이동");
		return "recruit/login";
	}
	
	
	@RequestMapping("/main")
	public String recruitInsert() {
		return "recruit/memberInsert";
	}
	
	
	@RequestMapping(value = "/check", method=RequestMethod.POST)
	public String recruitCheck(@ModelAttribute RecruitVo recruitVo, Model model) {

		int result = rService.selectMemberOne(recruitVo);
		

		// ### 0이면 없는거니깐 id랑 phone 집어넣기 jsp에
		// ### 1이면 있는거니깐 그 숨긴처리한거 불러오게 조건식 작성하기 login이면 되겠다 submit 상태가
		
	
		
		
		
		model.addAttribute("recruitVo",recruitVo);
		return "recruit/memberInsert";
	}
	
	
}
