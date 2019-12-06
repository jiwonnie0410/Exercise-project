package com.yedam.gca.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<Map<String, Object>> chartSgroup(){
		return mybatis.selectList("AdminDAO.chartSgroup");
	}
}
