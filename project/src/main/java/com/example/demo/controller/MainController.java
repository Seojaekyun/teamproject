package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MainService;

@Controller
public class MainController {

	@Autowired
	@Qualifier("ms")
	private MainService service;
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/index")
	public String index()
	{
		return service.index();
	}
	
	@RequestMapping("/admin/index")
	public String adminI() {
		return service.adminI();
	}
	
	// 메시지 전송 처리
    @PostMapping("/main/sendMessage")
    @ResponseBody
    public String sendMessage(@RequestParam String message, @RequestParam boolean isAdmin) {
        // 메시지 저장 시, 관리자 여부를 함께 넘겨주어 저장
        service.saveMessage(message, isAdmin);
        return "Message successfully saved";
    }

    // 메시지 가져오기
    @GetMapping("/main/getMessages")
    @ResponseBody
    public List<String> getMessages() {
        return service.getMessages();
    }
    
    @PostMapping("/main/endChat")
    @ResponseBody
    public String endChat() {
        // 서비스에서 채팅 기록 삭제 처리
        service.clearChatMessages();
        return "채팅이 종료되었습니다.";
    }
  
}
