package com.example.demo.service;

import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.MainMapper;


import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
@Qualifier("ms")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mapper;
	private List<String> chatMessages = new ArrayList<>();  // 메시지를 저장할 리스트
	
	@Override
	public String index() {
		
		return "/main/index";
	}

	@Override
	public String adminI(HttpServletRequest request, Model model ) {
		ArrayList<InquiryDto> ilist=mapper.ilist();
		//System.out.println(glist);
		
		model.addAttribute("ilist", ilist);
		return "/admin/index";
	}
	
	// 메시지 저장 메서드
    @Override
    public String saveMessage(String message, boolean isAdmin) {
        String sender = isAdmin ? "팅커벨: " : "손님: ";
        chatMessages.add(sender + message);
		return sender;
    }

    // 저장된 메시지 목록 반환 메서드
    @Override
    public List<String> getMessages() {
        return new ArrayList<>(chatMessages);  // 리스트 복사하여 반환
    }
    
    @Override
    public String clearChatMessages() {
        chatMessages.clear();  // 채팅 기록을 비움
		return null;
    }

	@Override
	public String guide() {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	

}
