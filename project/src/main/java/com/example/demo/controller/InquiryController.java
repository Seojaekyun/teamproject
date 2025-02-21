package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.InquiryDto;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {
	
	@Autowired
	@Qualifier("is")
	private InquiryService service;
	
	@GetMapping("/inquiry/list")
	public String list(HttpServletRequest request, Model model, Integer page) {
		return service.list(request, model, page);
	}
	
	@GetMapping("/inquiry/write")
	public String write() {
		return service.write();
	}
	
	@PostMapping("/inquiry/writeOk")
	public String writeOk(InquiryDto idto, HttpSession session) {
		return service.writeOk(idto, session);
	}
	
	@GetMapping("/inquiry/readnum")
	public String readnum(HttpServletRequest request) {
		return service.readnum(request);
	}
	
	@GetMapping("/inquiry/content")
	public String content(HttpSession session, HttpServletRequest request, Model model) {
		return service.content(session, request, model);
	}
	
	@GetMapping("/inquiry/update")
	public String update(HttpServletRequest request, Model model) {
		return service.update(request, model);
	}
	
	@PostMapping("/inquiry/updateOk")
	public String updateOk(InquiryDto idto) {
		return service.updateOk(idto);
	}
	
	@GetMapping("/inquiry/delete")
	public String delete(HttpServletRequest request) {
		return service.delete(request);
	}
	
	@GetMapping("/admin/inquiryList") // 새로운 매핑 추가
	public String inquiryList(Model model, Integer page) {
		return service.inquiryList(model, page);
	}
	
	@GetMapping("/admin/inquiryContent")
	public String inquiryContent(HttpServletRequest request, Model model) {
		return service.inquiryContent(request, model);
	}
	
	@PostMapping("/admin/answer")
	public String answer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
		return service.answer(inquiryId, answerText); // 서비스의 답변 저장 로직 호출 후 리턴
	}
	
	@PostMapping("/admin/updateAnswer")
	public String updateAnswer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
		return service.updateAnswer(inquiryId, answerText); // 서비스의 답변 수정 로직 호출 후 리턴
	}
	
	
}