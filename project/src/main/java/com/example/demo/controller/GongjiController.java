package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.GongjiService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GongjiController {
	@Autowired
	@Qualifier("gs")
	private GongjiService service;
	
	@RequestMapping("/gongji/list")
	public String list(HttpServletRequest request, Model model) {
		return service.list(request, model);
	}
	
	@RequestMapping("/gongji/gongjiReadnum")
	public String gongjiReadnum(HttpServletRequest request) {
		return service.gongjiReadnum(request);
	}
	
	@RequestMapping("/gongji/content")
	public String content(HttpServletRequest request, Model model) {
		return service.content(request, model);
	}
	
	
}