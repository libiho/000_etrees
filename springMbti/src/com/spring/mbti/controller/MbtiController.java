package com.spring.mbti.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mbti.HomeController;
import com.spring.mbti.service.MbtiService;

@Controller
public class MbtiController {
	
	
	@Autowired
	MbtiService mbtiService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/mbti/mbtiList.do", method = RequestMethod.GET)
	public String mbtiList(Locale locale, Model model) throws Exception{
		return "mbti/mbtiList";
	}

}
