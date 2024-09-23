package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

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
		
		// 항공편 5개 조회
		List<FlightDto> departureList = fmapper.getDepartureFlights();
		List<FlightDto> arrivalList = fmapper.getArrivalFlights();
		
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
		
		// 현재 시간 이후의 예약 5개씩 조회
		List<ReservationDto> rsvList = rmapper.getRsvanow();
		
		// GMP로 시작하는 항공편의 예약 리스트
		List<ReservationDto> gmpRsv = rsvList.stream()
			.filter(rsv -> rsv.getFlightName().startsWith("GMP"))
			.limit(5).collect(Collectors.toList());
		model.addAttribute("gmpRsv", gmpRsv);
		
		// ICN으로 시작하는 항공편의 예약 리스트
		List<ReservationDto> icnRsv = rsvList.stream()
			.filter(rsv -> rsv.getFlightName().startsWith("ICN"))
			.limit(5).collect(Collectors.toList());
		model.addAttribute("icnRsv", icnRsv);
		
		// 기타 항공편의 예약 리스트
		List<ReservationDto> otherRsv = rsvList.stream()
			.filter(rsv -> !rsv.getFlightName().startsWith("GMP") && !rsv.getFlightName().startsWith("ICN"))
			.limit(5).collect(Collectors.toList());
		model.addAttribute("otherRsv", otherRsv);
		
		return "/admin/index";
	}
	
	@Override
    public String reserveList(String selectedDate, Integer gmpPage, Integer icnPage, Integer otherPage, Model model) {
        int itemsPerPage = 10; // 페이지당 항목 수

        // GMP, ICN, 기타 항공편의 시작 및 끝 인덱스 계산
        int gmpStart = (gmpPage - 1) * itemsPerPage;
        int gmpEnd = gmpStart + itemsPerPage;

        int icnStart = (icnPage - 1) * itemsPerPage;
        int icnEnd = icnStart + itemsPerPage;

        int otherStart = (otherPage - 1) * itemsPerPage;
        int otherEnd = otherStart + itemsPerPage;

        List<ReservationDto> rsvList;

        // 선택한 날짜가 있을 경우 해당 날짜에 맞는 예약 데이터만 가져오기
        if (selectedDate != null && !selectedDate.isEmpty()) {
            rsvList = rmapper.getRsvByDate(selectedDate);  // 특정 날짜의 예약 내역 가져오기
            System.out.println("선택한 날짜에 해당하는 예약 수: " + rsvList.size());
        } else {
            rsvList = rmapper.getRsvanow();  // 선택한 날짜가 없으면 현재 이후 예약 내역 가져오기
        }

        // GMP, ICN, 기타 출발 항공편 필터링
        List<ReservationDto> gmpRsv = rsvList.stream()
            .filter(rsv -> rsv.getFlightName().startsWith("GMP"))
            .collect(Collectors.toList());

        List<ReservationDto> icnRsv = rsvList.stream()
            .filter(rsv -> rsv.getFlightName().startsWith("ICN"))
            .collect(Collectors.toList());

        List<ReservationDto> otherRsv = rsvList.stream()
            .filter(rsv -> !rsv.getFlightName().startsWith("GMP") && !rsv.getFlightName().startsWith("ICN"))
            .collect(Collectors.toList());

        // 페이징 적용 및 예외 처리
        List<ReservationDto> pagedGmpRsv = (gmpStart >= gmpRsv.size()) ? Collections.emptyList() :
            gmpRsv.subList(gmpStart, Math.min(gmpEnd, gmpRsv.size()));

        List<ReservationDto> pagedIcnRsv = (icnStart >= icnRsv.size()) ? Collections.emptyList() :
            icnRsv.subList(icnStart, Math.min(icnEnd, icnRsv.size()));

        List<ReservationDto> pagedOtherRsv = (otherStart >= otherRsv.size()) ? Collections.emptyList() :
            otherRsv.subList(otherStart, Math.min(otherEnd, otherRsv.size()));

        // 페이징 처리용 변수 계산
        int totalGmpPages = (int) Math.ceil((double) gmpRsv.size() / itemsPerPage);
        int totalIcnPages = (int) Math.ceil((double) icnRsv.size() / itemsPerPage);
        int totalOtherPages = (int) Math.ceil((double) otherRsv.size() / itemsPerPage);

        // 모델에 추가
        model.addAttribute("gmpRsv", pagedGmpRsv);
        model.addAttribute("icnRsv", pagedIcnRsv);
        model.addAttribute("otherRsv", pagedOtherRsv);

        model.addAttribute("totalGmpPages", totalGmpPages);
        model.addAttribute("totalIcnPages", totalIcnPages);
        model.addAttribute("totalOtherPages", totalOtherPages);

        model.addAttribute("gmpPage", gmpPage);
        model.addAttribute("icnPage", icnPage);
        model.addAttribute("otherPage", otherPage);

        model.addAttribute("selectedDate", selectedDate);

        return "/admin/reserveList";
    }
	
	@Override
	public String flightList(Integer page, Model model) {
	    int itemsPerPage = 10;  // 페이지당 항목 수를 고정

	    // 시작 인덱스 계산
	    int start = (page - 1) * itemsPerPage;

	    // 전체 항공편 리스트 가져오기
	    List<FlightDto> flightList = fmapper.getAllFlights();

	    // 페이징 적용
	    List<FlightDto> pagedFlights = (start >= flightList.size()) ? Collections.emptyList() :
	        flightList.subList(start, Math.min(start + itemsPerPage, flightList.size()));

	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) flightList.size() / itemsPerPage);

	    // 모델에 추가
	    model.addAttribute("flightList", pagedFlights);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "/admin/flightsList";  // flightsList.jsp로 이동
	}

	@Override
	public String memberList(HttpServletRequest request, Model model) {
	    // 페이지 값 받기 (기본값 1)
	    String pageParam = request.getParameter("page");
	    int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

	    int itemsPerPage = 20; // 페이지당 출력할 항목 수
	    int totalItems = mmapper.getTotalMemberCount(); // 전체 회원 수 가져오기
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    // 현재 페이지에 맞는 데이터 가져오기
	    int offset = (page - 1) * itemsPerPage;
	    ArrayList<MemberDto> mlist = mmapper.getMemberList(offset, itemsPerPage);

	    model.addAttribute("mlist", mlist);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "/admin/memberList";
	}

	
	
}