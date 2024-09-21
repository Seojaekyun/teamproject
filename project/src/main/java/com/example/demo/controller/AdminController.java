package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.GongjiDto;
import com.example.demo.service.AdminService;
import com.example.demo.service.GongjiService;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@Autowired
	@Qualifier("is")
	private InquiryService iservice;
	
	@Autowired
	@Qualifier("gs")
	private GongjiService gservice;
	
	@RequestMapping("/admin/index")
	public String adminI(HttpServletRequest request, Model model) {
		return service.adminI(request, model);
	}
	
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
	
	@RequestMapping("/admin/inquiryContent")
    public String inquiryContent(HttpServletRequest request, Model model) {
        return iservice.inquiryContent(request, model);
    }
	
	@RequestMapping("/admin/gongjiList")
	public String gongjiList(HttpServletRequest request, Model model) {
		return gservice.gongjiList(request, model);
	}
	
	@RequestMapping("/admin/gongjiContent")
	public String gongjiContent(HttpServletRequest request, Model model) {
		return gservice.gongjiContent(request, model);
	}
	
	@RequestMapping("/admin/gongjiWrite")
	public String write() {
		return gservice.gongjiWrite();
	}
	
	@RequestMapping("/admin/gongjiWriteOk")
	public String write(GongjiDto gdto, HttpSession session) {
		return gservice.gongjiWriteOk(gdto, session);
	}
	
	@RequestMapping("/admin/gongjiUpdate")
	public String gongjiUpdate(HttpServletRequest request, Model model) {
		return gservice.update(request, model);
	}
	
	@RequestMapping("/admin/gongjiUpdateOk")
	public String gongjiUpdateOk(GongjiDto gdto) {
		return gservice.updateOk(gdto);
	}
	
	@RequestMapping("/admin/gongjiDelete")
	public String delete(HttpServletRequest request) {
		return gservice.delete(request);
	}
	
	
}