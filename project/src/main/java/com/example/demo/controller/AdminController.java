package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.AdminService;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@Autowired
	@Qualifier("is")
	private InquiryService iservice;
	
	@RequestMapping("/admin/adReserve")
	public String adReserve() {
		return service.adReserve();
	}
	
	@RequestMapping("/admin/memberList")
	public String memberList(HttpServletRequest request, Model model) {
		return service.memberList(request, model);
	}
	
	@RequestMapping("/admin/inquiryList") // 새로운 매핑 추가
    public String inquiryList(HttpServletRequest request, Model model) {
        return iservice.inquiryList(request, model);
    }
}