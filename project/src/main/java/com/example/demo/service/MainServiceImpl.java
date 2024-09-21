package com.example.demo.service;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.StateCountDto;
import com.example.demo.mapper.FlightMapper;
import com.example.demo.mapper.MainMapper;


import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDate;
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
	    // 현재 날짜 구하기
	    String currentDate = LocalDate.now().toString();

        // 출항 항공편 5개 조회
        List<FlightDto> departureList = fmapper.getDepartureFlights();
        // 입항 항공편 5개 조회
        List<FlightDto> arrivalList = fmapper.getArrivalFlights();

        // 모델에 리스트 추가
        model.addAttribute("departureList", departureList);
        model.addAttribute("arrivalList", arrivalList);

	    // 모든 문의 리스트 조회
	    ArrayList<InquiryDto> ilist = mapper.ilist();
	    model.addAttribute("ilist", ilist);

	    // State별 문의 수 조회
	    List<StateCountDto> countsList = mapper.listCountsPerState();
	    countsList.sort((entry1, entry2) -> Integer.compare(entry2.getCount(), entry1.getCount()));

	    for (int i = 0; i < countsList.size(); i++) {
	        countsList.get(i).setRank(i + 1);  // 1위부터 순위 부여
	    }

	    model.addAttribute("countsList", countsList);

	    return "/admin/index";  // admin/index.jsp로 이동
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

	

	

	
	

}
