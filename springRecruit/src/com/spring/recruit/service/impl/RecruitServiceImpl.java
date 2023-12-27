package com.spring.recruit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.recruit.dao.RecruitDao;
import com.spring.recruit.service.RecruitService;
import com.spring.recruit.vo.RecruitVo;

@Service
public class RecruitServiceImpl implements RecruitService {
	
	
	@Autowired
	RecruitDao rDao;
	
	
//	private final RecruitDao rDao;
//	
//	public RecruitServiceImpl(RecruitDao rdDao) {
//		this.rDao = rdDao;
//	}

	@Override
	public int selectMemberOne(RecruitVo recruitVo) {
		return rDao.selectMemberOne(recruitVo);
	}

}
