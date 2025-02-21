package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.dto.GongjiDto;
import com.example.demo.service.GongjiService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GongjiController {
	@Autowired
	@Qualifier("gs")
	private GongjiService service;
	
	@GetMapping("/gongji/list")
	public String list(HttpServletRequest request, Model model) {
		return service.list(request, model);
	}
	
	@GetMapping("/gongji/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}
	
	@GetMapping("/gongji/content")
	public String content(HttpServletRequest request, Model model) {
		return service.content(request, model);
	}
	
	@GetMapping("/admin/gongjiList")
	public String gongjiList(HttpServletRequest request, Model model) {
		return service.gongjiList(request, model);
	}
	
	@GetMapping("/admin/gongjiContent")
	public String gongjiContent(HttpServletRequest request, Model model) {
		return service.gongjiContent(request, model);
	}
	
	@GetMapping("/admin/gongjiWrite")
	public String write() {
		return service.gongjiWrite();
	}
	
	@PostMapping("/admin/gongjiWriteOk")
	public String write(GongjiDto gdto, HttpSession session) {
		return service.gongjiWriteOk(gdto, session);
	}
	
	@GetMapping("/admin/gongjiUpdate")
	public String gongjiUpdate(HttpServletRequest request, Model model) {
		return service.update(request, model);
	}
	
	@PostMapping("/gongji/updateOk")
	public String gongjiUpdateOk(GongjiDto gdto) {
		return service.updateOk(gdto);
	}
	
	@PostMapping("/admin/gongjiDelete")
	public String delete(HttpServletRequest request) {
		return service.delete(request);
	}
	
	
}