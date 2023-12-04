package com.spring.mbti.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mbti.dao.MbtiDao;
import com.spring.mbti.service.MbtiService;
import com.spring.mbti.vo.MbtiVo;

@Service
public class MbtiServiceImpl implements MbtiService {
	
	@Autowired
	MbtiDao mbtiDao;

	@Override
	public List<MbtiVo> selectMbtiAll() throws Exception {
		return mbtiDao.selectMbtiAll();
	}

}
