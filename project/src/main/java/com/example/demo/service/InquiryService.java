package com.example.demo.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

import com.example.demo.dto.InquiryDto;

public interface InquiryService {
    String list(HttpServletRequest request, Model model, Integer page);
    String write();
    String writeOk(InquiryDto idto, HttpSession session);
    String readnum(HttpServletRequest request);
    String content(HttpSession session, HttpServletRequest request, Model model);
    String update(HttpServletRequest request, Model model);
    String updateOk(InquiryDto idto);
    String delete(HttpServletRequest request);
	String inquiryContent(HttpServletRequest request, Model model);
	String answer(int inquiryId, String answerText);
	String updateAnswer(int inquiryId, String answerText);
	String inquiryList(Model model, Integer page);
	
	
}