package com.example.demo.service;

import com.example.demo.mapper.MainMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
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
	public String adminI() {
		
		return null;
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
