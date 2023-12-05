package com.spring.mbti.dao;

import java.util.List;
import java.util.Map;

import com.spring.mbti.vo.MbtiVo;

public interface MbtiDao {


	public List<MbtiVo> selectMbtiAll(Map<String, Object> map) throws Exception;

}
