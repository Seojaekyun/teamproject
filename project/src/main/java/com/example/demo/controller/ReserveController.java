package com.example.demo.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/reserve/list")
	public String list() {
		return "/reserve/list";
	}

}
