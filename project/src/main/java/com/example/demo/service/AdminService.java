package com.example.demo.service;

import org.springframework.ui.Model;
import com.example.demo.dto.MemberDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface AdminService {
	String adminI(HttpSession session, HttpServletRequest request, Model model);
	String memberList(HttpServletRequest request, Model model);
	String flightList(Integer page, String selectedDate, String flightType, Model model);
	String reserveList(String selectedDate, Integer gmpPage,
			Integer icnPage, Integer otherPage, Integer page, Model model);
	String inquiryList(Model model, Integer page);
	String rsvdList(HttpServletRequest request, Model model);
	String oneMeminfo(HttpServletRequest request, Model model);
	String memberUp(MemberDto mdto);
	String cancelConfirm(HttpServletRequest request);
	String payReturn(HttpServletRequest request, Model model);
	String cancelRejection(HttpServletRequest request, Model model);
	
}