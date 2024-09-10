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

import java.util.List;

@Controller
public class InquiryController {

    @Autowired
    @Qualifier("is")
    private InquiryService service;

    @RequestMapping("/inquiry/list")
    public String list(HttpServletRequest request, Model model) {
        return service.list(request, model);
    }

    @RequestMapping("/admin/inquiryList")
    public String inquiryList(HttpServletRequest request, Model model) {
        return service.inquiryList(request, model);
    }

    @RequestMapping("/inquiry/write")
    public String write() {
        return service.write();
    }

    @RequestMapping("/inquiry/writeOk")
    public String writeOk(InquiryDto idto, HttpSession session) {
        return service.writeOk(idto, session);
    }

    @RequestMapping("/inquiry/readnum")
    public String readnum(HttpServletRequest request) {
        return service.readnum(request);
    }

    @RequestMapping("/inquiry/content")
    public String content(HttpServletRequest request, Model model) {
        return service.content(request, model);
    }

    @RequestMapping("/inquiry/update")
    public String update(HttpServletRequest request, Model model) {
        return service.update(request, model);
    }

    @RequestMapping("/inquiry/updateOk")
    public String updateOk(InquiryDto idto) {
        return service.updateOk(idto);
    }

    @RequestMapping("/inquiry/delete")
    public String delete(HttpServletRequest request) {
        return service.delete(request);
    }

    // 메시지 전송 처리
    @PostMapping("/inquiry/sendMessage")
    @ResponseBody
    public String sendMessage(@RequestParam String message, @RequestParam boolean isAdmin) {
        // 메시지 저장 시, 관리자 여부를 함께 넘겨주어 저장
        service.saveMessage(message, isAdmin);
        return "Message successfully saved";
    }

    // 메시지 가져오기
    @GetMapping("/inquiry/getMessages")
    @ResponseBody
    public List<String> getMessages() {
        return service.getMessages();
    }
    
    @PostMapping("/inquiry/endChat")
    @ResponseBody
    public String endChat() {
        // 서비스에서 채팅 기록 삭제 처리
        service.clearChatMessages();
        return "채팅이 종료되었습니다.";
    }
}
