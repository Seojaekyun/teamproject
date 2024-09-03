package com.example.demo.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GongjiController {
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/gongji/list")
	public String list() {
		return "/gongji/list";
	}
	
	@RequestMapping("/gongji/write")
	public String write() {
		return "/gongji/write";
	}

}
