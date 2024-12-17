package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.FlightDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.service.MainService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@Autowired
	@Qualifier("ms")
	private MainService service;
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/index") 
	public String index(HttpServletRequest request, Model model) {
		return service.index(request, model);
	}
	
	@RequestMapping("/guide/checkinGuide") 
	public String checkinGuide() {
		return service.checkinGuide();
	}
	
	@RequestMapping("/guide/seatGuide") 
	public String seatGuide() {
		return service.seatGuide();
	}
	
	@RequestMapping("/guide/baggageGuide") 
	public String baggageGuide() {
		return service.baggageGuide();
	}
	
	@RequestMapping("/guide/travel") 
	public String travel() {
		return service.travel();
	}
	
	// 메시지 전송 처리
	@PostMapping("/main/sendMessage")
	@ResponseBody
	public String sendMessage(@RequestParam String message, @RequestParam boolean isAdmin) {
	    return service.saveMessage(message, isAdmin);  // 로직을 서비스로 넘김
	}
	
	// 메시지 가져오기
	@GetMapping("/main/getMessages")
	@ResponseBody
	public List<String> getMessages() {
		return service.getMessages();
	}
	
	@PostMapping("/main/resetChatHistory")
	@ResponseBody
	public String resetChatHistory() {
		// 채팅 기록을 리셋하는 서비스 로직 호출
		return service.clearChatMessages();
	}
	
	@GetMapping("/checkLoginStatus")
	@ResponseBody
	public boolean checkLoginStatus(HttpSession session) {
		return service. checkLoginStatus(session);
	}
	
	// 로그인 처리를 담당하는 컨트롤러
	@PostMapping("/login")
	public String loginOk(MemberDto mdto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return service.loginOk(mdto,session,request,response);
	}
	
	@RequestMapping("/reserve/flightList")
	public String flightList(
			@RequestParam(required = false) String departureAirport,
			@RequestParam(required = false) String arrivalAirport,
			@RequestParam(required = false) String selectedDate,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			Model model) {
		
		// 전달된 파라미터를 로그로 출력 (디버깅용)
		//System.out.println("Departure Airport: " + departureAirport);
		//System.out.println("Arrival Airport: " + arrivalAirport);
		System.out.println("Selected Date: " + selectedDate);
		System.out.println("Page Parameter: " + page);
		
		// 필터 조건이 있는 경우 필터링된 항공편 데이터를 가져오고, 그렇지 않으면 전체 데이터를 가져옵니다.
		List<FlightDto> flights;
		if ((departureAirport != null && !departureAirport.isEmpty()) ||
				(arrivalAirport != null && !arrivalAirport.isEmpty()) ||
				(selectedDate != null && !selectedDate.isEmpty())) {
			// 필터링된 항공편 데이터 가져오기
			flights = service.getFilteredFlights(departureAirport, arrivalAirport, selectedDate, page, model);
		} else {
			// 전체 항공편 리스트를 페이지네이션 처리하여 가져오기
			flights = service.getFlightsByPage(page, selectedDate, model);
		}
		
		// 공항 목록 가져오기 및 모델에 추가
		List<AirportsDto> airports = service.getAllAirports();
		model.addAttribute("airports", airports);
		
		// 모델에 필터링된 데이터 추가
		model.addAttribute("flightList", flights);
		model.addAttribute("departureAirport", departureAirport);
		model.addAttribute("arrivalAirport", arrivalAirport);
		model.addAttribute("selectedDate", selectedDate);
		model.addAttribute("currentPage", page);
		
		return "/reserve/flightList";  // flightList.jsp로 이동
	}
	
	@RequestMapping("/reserve/reserveInfo")
	public String reserveInfo() {
		return service.reserveInfo();
	}
	
	@RequestMapping("/reserve/checkin")
	public String checkin() {
		return service.checkin();
	}
	
	@RequestMapping("/event/list") 
	public String eventList(HttpServletRequest request, Model model) {
		return service.eventList(request, model);
	}
	
	@RequestMapping("/event/eventReadnum")
	public String eventReadnum(HttpServletRequest request) {
		return service.eventReadnum(request);
	}
	
	@RequestMapping("/event/content") 
	public String eventContent(HttpServletRequest request, Model model) {
		return service.eventContent(request, model);
	}
		
	
}