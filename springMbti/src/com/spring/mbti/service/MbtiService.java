package com.spring.mbti.service;

import java.util.List;
import java.util.Map;

import com.spring.mbti.vo.MbtiVo;

public interface MbtiService {


	public List<MbtiVo> selectMbtiAll(Map<String, Object> map) throws Exception;

}
