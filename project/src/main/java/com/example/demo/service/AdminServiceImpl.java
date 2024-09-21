package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.StateCountDto;
import com.example.demo.mapper.FlightMapper;
import com.example.demo.mapper.InquiryMapper;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.ReservationMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private FlightMapper fmapper;
	@Autowired
	private MemberMapper mmapper;
	@Autowired
	private ReservationMapper rmapper;
	@Autowired
	private InquiryMapper imapper;
	
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
        ArrayList<InquiryDto> ilist = imapper.ilist();
        model.addAttribute("ilist", ilist);

        // State별 문의 수 조회
        List<StateCountDto> countsList = imapper.listCountsPerState();
        countsList.sort((entry1, entry2) -> Integer.compare(entry2.getCount(), entry1.getCount()));

        for (int i = 0; i < countsList.size(); i++) {
            countsList.get(i).setRank(i + 1);  // 1위부터 순위 부여
        }

        model.addAttribute("countsList", countsList);

        // **예약 데이터 조회 및 모델에 추가**
        List<ReservationDto> rsvList = rmapper.reservations();
        model.addAttribute("rsvList", rsvList);

        return "/admin/index";
    }
	
	@Override
	public String adReserve() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String memberList(HttpServletRequest request, Model model) {
		ArrayList<MemberDto> mlist=mmapper.list();
		//System.out.println(mlist);
		
		model.addAttribute("mlist", mlist);
		return "/admin/memberList";
	}
	
	
}