package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface AdminService {
	String adminI(HttpServletRequest request, Model model);
	String adReserve();
	String memberList(HttpServletRequest request, Model model);
	
	
	
}
