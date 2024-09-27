package com.example.demo.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.GongjiDto;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.StateCountDto;
import com.example.demo.mapper.FlightMapper;
import com.example.demo.mapper.GongjiMapper;
import com.example.demo.mapper.InquiryMapper;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.ReservationMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	@Autowired
	private GongjiMapper gmapper;
	
	@Override
	public String adminI(HttpSession session, HttpServletRequest request, Model model) {
		String userid=session.getAttribute("userid").toString();
		if("admin".equals(userid)) {
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
				.filter(rsv -> rsv.getDepartureAirport().equals("GMP"))
				.limit(5).collect(Collectors.toList());
		model.addAttribute("gmpRsv", gmpRsv);
		
		// ICN으로 시작하는 항공편의 예약 리스트
		List<ReservationDto> icnRsv = rsvList.stream()
				.filter(rsv -> rsv.getDepartureAirport().equals("ICN"))
				.limit(5).collect(Collectors.toList());
		model.addAttribute("icnRsv", icnRsv);
		
		// 기타 항공편의 예약 리스트
		List<ReservationDto> otherRsv = rsvList.stream()
				.filter(rsv -> !rsv.getDepartureAirport().equals("GMP") && !rsv.getDepartureAirport().equals("ICN"))
				.limit(5).collect(Collectors.toList());
		model.addAttribute("otherRsv", otherRsv);
		
		return "/admin/index";
		}
		else {
			return "redirect:/login/loginAd";
		}
	}
	
	@Override
	public String reserveList(String selectedDate, Integer gmpPage, Integer icnPage, Integer otherPage, Integer page, Model model) {
		int itemsPerPage = 5; // 페이지당 항목 수
		
		// 페이지 번호가 null이거나 1보다 작으면 기본값으로 설정
		if (page == null || page < 1) {
			page = 1;
		}
		if (gmpPage == null || gmpPage < 1) {
			gmpPage = 1;
		}
		if (icnPage == null || icnPage < 1) {
			icnPage = 1;
		}
		if (otherPage == null || otherPage < 1) {
			otherPage = 1;
		}
		
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
		}
		else {
			rsvList = rmapper.getRsvanow();  // 선택한 날짜가 없으면 현재 이후 예약 내역 가져오기
		}
		
		// 전체 예약 내역에 대한 페이징 처리
		int totalItems = rsvList.size();
		int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
		
		int startIndex = (page - 1) * itemsPerPage;
		int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
		
		List<ReservationDto> pagedRsvList = (startIndex >= totalItems) ? Collections.emptyList() : rsvList.subList(startIndex, endIndex);
		
		// GMP, ICN, 기타 출발 항공편 필터링
		List<ReservationDto> gmpRsv = rsvList.stream()
				.filter(rsv -> rsv.getDepartureAirport().equals("GMP"))
				.collect(Collectors.toList());
		
		List<ReservationDto> icnRsv = rsvList.stream()
				.filter(rsv -> rsv.getDepartureAirport().equals("ICN"))
				.collect(Collectors.toList());
		
		List<ReservationDto> otherRsv = rsvList.stream()
				.filter(rsv -> !rsv.getDepartureAirport().equals("GMP") && !rsv.getDepartureAirport().equals("ICN"))
				.collect(Collectors.toList());
		
		// 각 항공편 타입에 대한 페이징 처리
		List<ReservationDto> pagedGmpRsv = (gmpStart >= gmpRsv.size()) ? Collections.emptyList() :
			gmpRsv.subList(gmpStart, Math.min(gmpEnd, gmpRsv.size()));
		
		List<ReservationDto> pagedIcnRsv = (icnStart >= icnRsv.size()) ? Collections.emptyList() :
			icnRsv.subList(icnStart, Math.min(icnEnd, icnRsv.size()));
		
		List<ReservationDto> pagedOtherRsv = (otherStart >= otherRsv.size()) ? Collections.emptyList() :
			otherRsv.subList(otherStart, Math.min(otherEnd, otherRsv.size()));
		
		// 각 항공편 타입에 대한 총 페이지 수 계산
		int totalGmpPages = (int) Math.ceil((double) gmpRsv.size() / itemsPerPage);
		int totalIcnPages = (int) Math.ceil((double) icnRsv.size() / itemsPerPage);
		int totalOtherPages = (int) Math.ceil((double) otherRsv.size() / itemsPerPage);
		
		// 모델에 데이터 추가
		model.addAttribute("rsvList", pagedRsvList);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		
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
	public String flightList(Integer page, String selectedDate, String flightType, Model model) {
		int itemsPerPage = 5;  // 페이지당 항목 수
		int start = (page - 1) * itemsPerPage;
		
		List<FlightDto> flightList;
		if (selectedDate != null && !selectedDate.isEmpty()) {
			flightList = fmapper.getFlightsByDate(selectedDate);
		}
		else {
			flightList = fmapper.getAllFlights();
		}
		
		// 출발 공항에 따라 분류
		List<FlightDto> gmpFlights = flightList.stream()
				.filter(flight -> flight.getDepartureAirport().equals("GMP"))
				.collect(Collectors.toList());
		
		List<FlightDto> icnFlights = flightList.stream()
				.filter(flight -> flight.getDepartureAirport().equals("ICN"))
				.collect(Collectors.toList());
		
		List<FlightDto> otherFlights = flightList.stream()
				.filter(flight -> !flight.getDepartureAirport().equals("GMP") && !flight.getDepartureAirport().equals("ICN"))
				.collect(Collectors.toList());
		
		if ("all".equals(flightType)) {
			List<FlightDto> pagedFlights = flightList.subList(
					start, Math.min(start + itemsPerPage, flightList.size()));
			int totalPages = (int) Math.ceil((double) flightList.size() / itemsPerPage);
			model.addAttribute("flightList", pagedFlights);
			model.addAttribute("totalPages", totalPages);
			model.addAttribute("currentPage", page);
		}
		else if ("gmp".equals(flightType)) {
			List<FlightDto> pagedGmpFlights = gmpFlights.stream()
					.skip(start).limit(itemsPerPage).collect(Collectors.toList());
			int totalGmpPages = (int) Math.ceil((double) gmpFlights.size() / itemsPerPage);
			model.addAttribute("pagedGmpFlights", pagedGmpFlights);
			model.addAttribute("totalGmpPages", totalGmpPages);
			model.addAttribute("currentGmpPage", page);
		}
		else if ("icn".equals(flightType)) {
			List<FlightDto> pagedIcnFlights = icnFlights.stream()
					.skip(start).limit(itemsPerPage).collect(Collectors.toList());
			int totalIcnPages = (int) Math.ceil((double) icnFlights.size() / itemsPerPage);
			model.addAttribute("pagedIcnFlights", pagedIcnFlights);
			model.addAttribute("totalIcnPages", totalIcnPages);
			model.addAttribute("currentIcnPage", page);
		}
		else if ("other".equals(flightType)) {
			List<FlightDto> pagedOtherFlights = otherFlights.stream()
					.skip(start).limit(itemsPerPage).collect(Collectors.toList());
			int totalOtherPages = (int) Math.ceil((double) otherFlights.size() / itemsPerPage);
			model.addAttribute("pagedOtherFlights", pagedOtherFlights);
			model.addAttribute("totalOtherPages", totalOtherPages);
			model.addAttribute("currentOtherPage", page);
		}
		
		model.addAttribute("selectedDate", selectedDate);
		
		return "/admin/flightsList";  // 전체 페이지를 반환합니다.
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
	    
	    // 회원 리스트와 예약 리스트 매칭 (userid 기준으로 각 회원의 최근 예약만 가져옴)
	    for (MemberDto member : mlist) {
	        // 각 회원의 최근 예약 한 건을 가져옴
	        ReservationDto recentReservation = rmapper.getMyrsv(member.getUserid());
	        if (recentReservation != null) {
	            member.setReservations(Collections.singletonList(recentReservation)); // 최근 예약 하나만 설정
	        } else {
	            member.setReservations(Collections.emptyList()); // 예약이 없는 경우 빈 리스트 설정
	        }
	    }
	    
	    model.addAttribute("mlist", mlist);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    
	    return "/admin/memberList";
	}
	
	@Override
	public String oneMeminfo(HttpServletRequest request, Model model) {
	    String userId = request.getParameter("userid");

	    // 유저 정보와 예약 리스트를 가져옴
	    MemberDto member = mmapper.getMemberById(userId);

	    if (member != null) {
	        List<ReservationDto> myrsv = rmapper.getRsvUserid(userId);
	        member.setReservations(myrsv);
	    }

	    model.addAttribute("member", member);
	    model.addAttribute("myrsv", member.getReservations()); // 예약 리스트 전달

	    return "/admin/oneMeminfo";
	}

	@Override
	public String inquiryList(Model model, Integer page) {
	    if (page == null) {
	        page = 1;  // 기본 페이지 값 설정
	    }

	    int itemsPerPage = 20;  // 페이지당 항목 수
	    int offset = (page - 1) * itemsPerPage;  // 페이지에 따른 시작점 계산

	    // 전체 문의 수 가져오기
	    int totalItems = imapper.getInquiryCount();
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    // 페이징된 문의 리스트 가져오기
	    List<InquiryDto> ilist = imapper.list(offset, itemsPerPage);

	    // 모델에 추가
	    model.addAttribute("ilist", ilist);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("totalItems", totalItems);

	    return "/admin/inquiryList";
	}
	
	@Override
	public String gongjiList(HttpServletRequest request, Model model) {
	    // 페이지 번호 파라미터 받기 (기본값은 1)
	    String pageParam = request.getParameter("page");
	    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

	    int itemsPerPage = 20;  // 페이지당 항목 수
	    int offset = (currentPage - 1) * itemsPerPage;  // 시작 인덱스 계산

	    // 전체 공지사항 수 가져오기
	    int totalItems = gmapper.getTotalCount();

	    // 페이징 적용하여 리스트 가져오기
	    List<GongjiDto> glist = gmapper.list(offset, itemsPerPage);

	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	    // 모델에 필요한 데이터 추가
	    model.addAttribute("glist", glist);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);

	    return "/admin/gongjiList";
	}

	@Override
	public String rsvdList(HttpServletRequest request, Model model) {
	    String flightName = request.getParameter("flightName");
	    String departureTime = request.getParameter("departureTime");

	    // 페이지 처리 관련 변수
	    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
	    int itemsPerPage = 10;  // 한 페이지에 표시할 항목 수
	    int start = (currentPage - 1) * itemsPerPage;

	    // 필터링된 예약 리스트 가져오기
	    List<ReservationDto> rsvList = rmapper.getRsvdetail(flightName, departureTime, start, itemsPerPage);
	    List<ReservationDto> rsvfn = rmapper.getRsvdfn(flightName, departureTime);

	    // 필터링된 데이터에 맞는 총 예약 수 가져오기
	    int totalReservations = rmapper.getTotalReservations(flightName, departureTime); // 필터링된 데이터 기반
	    int totalPages = (int) Math.ceil((double) totalReservations / itemsPerPage);

	    // 모델에 추가
	    model.addAttribute("rsvList", rsvList);
	    model.addAttribute("rsvfn", rsvfn);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("totalPages", totalPages);

	    return "/admin/rsvdList";
	}
	
		
}