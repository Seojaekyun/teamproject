package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface GongjiService {

	String list(HttpServletRequest request, Model model);
	

}
