package com.example.demo.service;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.PromotDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface AdminService {
	String adminI(HttpSession session, HttpServletRequest request, Model model);
	String memberList(HttpServletRequest request, Model model);
	String flightList(Integer page, String selectedDate, String flightType, Model model);
	String reserveList(
			String selectedDate, Integer gmpPage,
			Integer icnPage, Integer otherPage, Integer page, Model model);
	String inquiryList(Model model, Integer page);
	String gongjiList(HttpServletRequest request, Model model);
	String rsvdList(HttpServletRequest request, Model model);
	String oneMeminfo(HttpServletRequest request, Model model);
	String memberUp(MemberDto mdto);
	String promotList(HttpServletRequest request, Model model);
	String promotAdd();
	String addPromots(PromotDto pdto, MultipartFile file) throws Exception;
	String promotContent(HttpServletRequest request, Model model);
	String promotUpdate(HttpServletRequest request, Model model);
	String upPromots(HttpServletRequest request, @RequestParam("file") MultipartFile file, PromotDto pdto) throws Exception;
	
}