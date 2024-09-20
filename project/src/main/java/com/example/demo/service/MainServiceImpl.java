package com.example.demo.service;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.StateCountDto;
import com.example.demo.mapper.FlightMapper;
import com.example.demo.mapper.MainMapper;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
	@Autowired
	private FlightMapper fmapper;
	private List<String> chatMessages = new ArrayList<>();  // 메시지를 저장할 리스트
	
	@Override
	public String index() {
		
		return "/main/index";
	}

	@Override
    public String adminI(HttpServletRequest request, Model model) {
        // 페이지 번호 파라미터 받기 (기본값 1페이지)
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int limit = 10;  // 한 페이지에 10개씩 보여줌
        int offset = (page - 1) * limit;

        // flights 데이터를 페이징으로 가져오기
        List<FlightDto> flightList = fmapper.getFlightsWithPagination(limit, offset);
        model.addAttribute("flightList", flightList);

        // 전체 항공편 수 계산
        int totalFlights = fmapper.getTotalFlightsCount();
        int totalPages = (int) Math.ceil((double) totalFlights / limit);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        // 모든 문의 리스트 조회
        ArrayList<InquiryDto> ilist = mapper.ilist();
        model.addAttribute("ilist", ilist);

        // State별 문의 수 조회
        List<StateCountDto> countsList = mapper.listCountsPerState();

        // 문의량을 기준으로 내림차순 정렬
        countsList.sort((entry1, entry2) -> Integer.compare(entry2.getCount(), entry1.getCount()));

        // countsList에 순위 부여
        for (int i = 0; i < countsList.size(); i++) {
            countsList.get(i).setRank(i + 1);  // 1위부터 순위 부여
        }

        // JSP에 countsList 전달
        model.addAttribute("countsList", countsList);

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
	public String checkinGuide() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String seatGuide() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String baggageGuide() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String eventList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String travel() {
		// TODO Auto-generated method stub
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
			} else {
				// 로그인 실패 시 로그인 페이지로 리다이렉트 (에러 메시지 포함)
				return "redirect:/login/login?err=1";
	 }


	
	 }}
