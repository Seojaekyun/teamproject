package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface LoginService {
	
	public String login(HttpServletRequest request, Model model);

}
