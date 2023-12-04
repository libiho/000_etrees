package com.spring.mbti.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mbti.HomeController;
import com.spring.mbti.service.MbtiService;
import com.spring.mbti.vo.MbtiVo;

@Controller
public class MbtiController {

	@Autowired
	MbtiService mbtiService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/mbti/mbtiStart.do", method = RequestMethod.GET)
	public String mbtiStart(Locale locale, Model model) throws Exception {
		return "mbti/mbtiStart";
	}

	@RequestMapping(value = "/mbti/mbtiList.do", method = RequestMethod.GET)
	public String mbtiList(Locale locale, Model model) throws Exception {
		
	List<MbtiVo> mbtiList = new ArrayList<MbtiVo>();
		
		mbtiList = mbtiService.selectMbtiAll();
		
		model.addAttribute("mbtiList",mbtiList);
		
		return "mbti/mbtiList";
	}
	
	
	@RequestMapping(value = "/mbti/mbtiListAll.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> mbtiListAll (Locale locale ) throws Exception{
		
		List<MbtiVo> mbtiList = new ArrayList<MbtiVo>();
		
		mbtiList = mbtiService.selectMbtiAll();
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("mbtiList",mbtiList);
		
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

}
