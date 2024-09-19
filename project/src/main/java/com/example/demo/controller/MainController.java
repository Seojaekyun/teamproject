package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MainService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MainController {

	@Autowired
	@Qualifier("ms")
	private MainService service;
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/index") 
	public String index() {
		return service.index();
	}
	
	@RequestMapping("/admin/index")
	public String adminI(HttpServletRequest request, Model model) {
		return service.adminI(request, model);
	}
	
	@RequestMapping("/guide/checkinGuide") 
	public String checkinGuide() {
		return service.checkinGuide();
	}
	
	@RequestMapping("/guide/seatGuide") 
	public String seatGuide() {
		return service.seatGuide();
	}
	
	@RequestMapping("/guide/baggageGuide") 
	public String baggageGuide() {
		return service.baggageGuide();
	}
	
	@RequestMapping("/main/eventList") 
	public String eventList() {
		return service.eventList();
	}
	
	@RequestMapping("/guide/travel") 
	public String travel() {
		return service.travel();
	}
	
	// 메시지 전송 처리
	@PostMapping("/main/sendMessage")
	@ResponseBody
	public String sendMessage(@RequestParam String message, @RequestParam boolean isAdmin) {
	    return service.saveMessage(message, isAdmin);  // 로직을 서비스로 넘김
	}
	
	// 메시지 가져오기
	@GetMapping("/main/getMessages")
	@ResponseBody
	public List<String> getMessages() {
		return service.getMessages();
	}
	
	@PostMapping("/main/resetChatHistory")
	@ResponseBody
	public String resetChatHistory() {
		// 채팅 기록을 리셋하는 서비스 로직 호출
		return service.clearChatMessages();
	}
	
}
