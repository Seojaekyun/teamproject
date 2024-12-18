package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.GongjiDto;
import com.example.demo.dto.ReviewDto;
import com.example.demo.service.ReviewService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	@Autowired
	@Qualifier("res")
	private ReviewService service;
	
	@RequestMapping("/review/list")
	public String list(HttpServletRequest request, Model model) {
		return service.list(request, model);
	}
	
	@RequestMapping("/review/reviewReadnum")
	public String reviewReadnum(HttpServletRequest request) {
		return service.reviewReadnum(request);
	}
	
	@RequestMapping("/review/content")
	public String content(HttpServletRequest request, HttpSession session, Model model) {
		return service.content(request, session, model);
	}
	
	@RequestMapping("/review/write")
	public String write() {
		return service.write();
	}
	
	@RequestMapping("/review/writeOk")
	public String write(ReviewDto redto, HttpSession session) {
		return service.writeOk(redto, session);
	}
	
	@RequestMapping("/admin/reviewList")
	public String reviewList(HttpServletRequest request, Model model) {
		return service.reviewList(request, model);
	}
	
	@RequestMapping("/admin/reviewContent")
	public String reviewContent(HttpServletRequest request, Model model) {
		return service.reviewContent(request, model);
	}
	
	
}