package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface AdminService {
	String adminI(HttpServletRequest request, Model model);
	String memberList(HttpServletRequest request, Model model);
	String reserveList(String selectedDate, Integer gmpPage, Integer icnPage, Integer otherPage, Model model);
	String flightList(Integer page, String selectedDate, Model model);
	
	
}
