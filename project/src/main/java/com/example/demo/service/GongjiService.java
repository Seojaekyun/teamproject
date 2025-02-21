package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface GongjiService {
	String list(HttpServletRequest request, Model model);
	String gongjiList(HttpServletRequest request, Model model);
	String content(HttpServletRequest request, Model model);
	String update(HttpServletRequest request, Model model);
	String updateOk(GongjiDto gdto);
	String delete(HttpServletRequest request);
	String gongjiWrite();
	String gongjiContent(HttpServletRequest request, Model model);
	String gongjiWriteOk(GongjiDto gdto, HttpSession session);
	String readnum(HttpServletRequest request);
	
	
}