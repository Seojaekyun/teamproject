package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ReviewService {
	String list(HttpServletRequest request, Model model);
	String reviewReadnum(HttpServletRequest request);
	String content(HttpServletRequest request, HttpSession session, Model model);
	String update(HttpServletRequest request, Model model);
	String updateOk(ReviewDto gdto);
	String delete(HttpServletRequest request, HttpSession session);
	String write();
	String writeOk(ReviewDto gdto, HttpSession session);
	String reviewContent(HttpServletRequest request, Model model);
	String reviewList(HttpServletRequest request, Model model);
	
	
}