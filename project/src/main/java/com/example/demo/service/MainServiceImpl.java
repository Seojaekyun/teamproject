package com.example.demo.service;

import com.example.demo.dto.MemberDto;
import com.example.demo.mapper.MainMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	@Qualifier("ms")
	private List<String> chatMessages = new ArrayList<>();  // 메시지를 저장할 리스트
	
	@Override
	public String index() {
		return "/main/index";
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
	public String checkinGuide() {
		return null;
	}

	@Override
	public String seatGuide() {
		return null;
	}

	@Override
	public String baggageGuide() {
		return null;
	}

	@Override
	public String eventList() {
		return null;
	}

	@Override
	public String travel() {
		return null;
	}
	
	@Override
	public boolean checkLoginStatus(HttpSession session) {
		Boolean isLoggedIn = (Boolean) session.getAttribute("loggedIn");
		return isLoggedIn != null && isLoggedIn;  // 로그인 상태를 반환
	}
	
	@Override
	public String loginOk(MemberDto mdto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String name = mapper.loginOk(mdto);
		
		if (name != null) {
			// 로그인 성공 시 세션에 사용자 정보 저장
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", name);
			session.setAttribute("loggedIn", true);  // 로그인 상태를 세션에 저장
			
			// 메인 페이지로 리다이렉트
			return "redirect:/main/index";
		}
		else {
			// 로그인 실패 시 로그인 페이지로 리다이렉트 (에러 메시지 포함)
			return "redirect:/login/login?err=1";
		}
	}
	
	
}