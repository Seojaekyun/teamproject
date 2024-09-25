package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/admin/reserveList")
	public String reserveList(
			@RequestParam(value = "selectedDate", required = false) String selectedDate,
			@RequestParam(value = "gmpPage", required = false, defaultValue = "1") Integer gmpPage,
			@RequestParam(value = "icnPage", required = false, defaultValue = "1") Integer icnPage,
			@RequestParam(value = "otherPage", required = false, defaultValue = "1") Integer otherPage,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
		
		// 서비스로 전달
		return service.reserveList(selectedDate, gmpPage, icnPage, otherPage, page, model);
	}
		
	@RequestMapping("/admin/flightsList")
	public String flightsList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "selectedDate", required = false) String selectedDate,
			@RequestParam(value = "flightType", required = false, defaultValue = "all") String flightType,
			Model model) {
		
		return service.flightList(page, selectedDate, flightType, model);
	}
	
	@RequestMapping("/admin/memberList")
	public String memberList(HttpServletRequest request, Model model) {
		return service.memberList(request, model);
	}
	
	@RequestMapping("/admin/inquiryList") // 새로운 매핑 추가
    public String inquiryList(Model model, Integer page) {
        return service.inquiryList(model, page);
    }
	
	@RequestMapping("/admin/inquiryContent")
    public String inquiryContent(HttpServletRequest request, Model model) {
        return iservice.inquiryContent(request, model);
    }
	
	@RequestMapping("/admin/answer")
    public String answer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
        return iservice.answer(inquiryId, answerText); // 서비스의 답변 저장 로직 호출 후 리턴
    }

    @RequestMapping("/admin/updateAnswer")
    public String updateAnswer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
        return iservice.updateAnswer(inquiryId, answerText); // 서비스의 답변 수정 로직 호출 후 리턴
    }
	
	@RequestMapping("/admin/gongjiList")
	public String gongjiList(HttpServletRequest request, Model model) {
		return service.gongjiList(request, model);
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
	
	@RequestMapping("/admin/rsvdList")
	public String rsvdList(HttpServletRequest request, Model model) {
		return service.rsvdList(request, model);
	}
	
}