package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.GongjiDto;
import com.example.demo.service.GongjiService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GongjiController {
	@Autowired
	@Qualifier("gs")
	private GongjiService service;
	
	@RequestMapping("/gongji/list")
	public String list(HttpServletRequest request, Model model) {
		return service.list(request, model);
	}
	
	@RequestMapping("/gongji/write")
	public String write() {
		return service.write();
	}
	
	@RequestMapping("/gongji/writeOk")
	public String write(GongjiDto gdto, HttpSession session) {
		return service.writeOk(gdto, session);
	}

}
