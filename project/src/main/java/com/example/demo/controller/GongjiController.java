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
	
	@RequestMapping("/gongji/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}
	
	@RequestMapping("/gongji/content")
	public String content(HttpServletRequest request, Model model) {
		return service.content(request, model);
	}
	
	@RequestMapping("/gongji/update")
	public String update(HttpServletRequest request, Model model) {
		return service.update(request, model);
	}
	
	@RequestMapping("/gongji/updateOk")
	public String update(GongjiDto gdto) {
		return service.updateOk(gdto);
	}
	
	@RequestMapping("/gongji/delete")
	public String delete(HttpServletRequest request) {
		return service.delete(request);
	}

}
