	package com.spring.recruit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.recruit.HomeController;

@Controller
@RequestMapping("/recruit")
public class RecruitController {
	
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
	public String recruitCheck() {

		return "recruit/memberInsert";
	}
	
	
}
