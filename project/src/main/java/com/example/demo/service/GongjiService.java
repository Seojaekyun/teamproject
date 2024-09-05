package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface GongjiService {

	String list(HttpServletRequest request, Model model);
	String write();
	String writeOk(GongjiDto gdto, HttpSession session);
	

}
