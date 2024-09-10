package com.example.demo.service;

import com.example.demo.dto.InquiryDto;
import com.example.demo.mapper.InquiryMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
@Qualifier("is")
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private InquiryMapper mapper;
    
    private List<String> chatMessages = new ArrayList<>();  // 메시지를 저장할 리스트

    @Override
    public String list(HttpServletRequest request, Model model) {
        ArrayList<InquiryDto> ilist = mapper.list();
        model.addAttribute("ilist", ilist);
        return "/inquiry/list";
    }

    @Override
    public String write() {
        return "/inquiry/write";
    }

    @Override
    public String writeOk(InquiryDto idto, HttpSession session) {
        mapper.writeOk(idto);
        return "redirect:/inquiry/list";
    }

    @Override
    public String readnum(HttpServletRequest request) {
        String id = request.getParameter("id");
        mapper.readnum(id);
        return "redirect:/inquiry/content?id=" + id;
    }

    @Override
    public String content(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        InquiryDto idto = mapper.content(id);
        idto.setContent(idto.getContent().replace("\\r\\n", "<br>"));
        model.addAttribute("idto", idto);
        return "/inquiry/content";
    }

    @Override
    public String update(HttpServletRequest request, Model model) {
        String id = request.getParameter("id");
        InquiryDto idto = mapper.content(id);
        model.addAttribute("idto", idto);
        return "/inquiry/update";
    }

    @Override
    public String updateOk(InquiryDto idto) {
        mapper.updateOk(idto);
        return "redirect:/inquiry/content?id=" + idto.getId();
    }

    @Override
    public String delete(HttpServletRequest request) {
        String id = request.getParameter("id");
        mapper.delete(id);
        return "redirect:/inquiry/list";
    }

    @Override
    public String inquiryList(HttpServletRequest request, Model model) {
        ArrayList<InquiryDto> ilist = mapper.list();
        model.addAttribute("ilist", ilist);
        return "/admin/inquiryList";
    }

    // 메시지 저장 메서드
    @Override
    public void saveMessage(String message, boolean isAdmin) {
        // 관리자인지 여부에 따라 메시지 앞에 "관리자: " 또는 "사용자: "를 붙임
        String sender = isAdmin ? "관리자: " : "사용자: ";
        chatMessages.add(sender + message);
    }

    // 저장된 메시지 목록 반환 메서드
    @Override
    public List<String> getMessages() {
        return new ArrayList<>(chatMessages);  // 리스트 복사하여 반환
    }
    
    @Override
    public void clearChatMessages() {
        chatMessages.clear();  // 채팅 기록을 비움
    }
}