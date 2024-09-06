package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.InquiryDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface InquiryService {
	String list(HttpServletRequest request, Model model);
	String write();
	String writeOk(InquiryDto idto, HttpSession session);
	String readnum(HttpServletRequest request);
	String content(HttpServletRequest request, Model model);
	String update(HttpServletRequest request, Model model);
	String updateOk(InquiryDto idto);
	String delete(HttpServletRequest request);

}
