package com.example.demo.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ReviewService {
	String list(HttpServletRequest request, Model model);
	String reviewReadnum(HttpServletRequest request);
	String content(HttpServletRequest request, HttpSession session, Model model);
	String update(HttpServletRequest request, Model model);
	String updateOk(ReviewDto gdto);
	String write();
	String writeOk(ReviewDto gdto, HttpSession session, MultipartFile file) throws Exception;
	String reviewContent(HttpServletRequest request, Model model);
	String reviewList(HttpServletRequest request, Model model);
	
	
}