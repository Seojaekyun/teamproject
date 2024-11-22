package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.InquiryDto;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {
	
	@Autowired
	@Qualifier("is")
	private InquiryService service;
	
	@RequestMapping("/inquiry/list")
	public String list(HttpServletRequest request, Model model, Integer page) {
		return service.list(request, model, page);
	}
	
	@RequestMapping("/inquiry/write")
	public String write() {
		return service.write();
	}
	
	@RequestMapping("/inquiry/writeOk")
	public String writeOk(InquiryDto idto, HttpSession session) {
		return service.writeOk(idto, session);
	}
	
	@RequestMapping("/inquiry/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}
	
	@RequestMapping("/inquiry/content")
	public String content(HttpServletRequest request, Model model) {
		return service.content(request, model);
	}
	
	@RequestMapping("/inquiry/update")
	public String update(HttpServletRequest request, Model model) {
		return service.update(request, model);
	}
	
	@RequestMapping("/inquiry/updateOk")
	public String updateOk(InquiryDto idto) {
		return service.updateOk(idto);
	}
	
	@RequestMapping("/inquiry/delete")
	public String delete(HttpServletRequest request) {
		return service.delete(request);
	}
	
	
}