package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.AirplanesDto;
import com.example.demo.dto.GongjiDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.PromotDto;
import com.example.demo.service.AdminService;
import com.example.demo.service.FlightService;
import com.example.demo.service.GongjiService;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@Autowired
	@Qualifier("is")
	private InquiryService iservice;
	
	@Autowired
	@Qualifier("gs")
	private GongjiService gservice;
	
	@Autowired
	@Qualifier("fs")
	private FlightService fservice;
	
	@GetMapping("/admin/index")
	public String adminI(HttpSession session, HttpServletRequest request, Model model) {
		return service.adminI(session, request, model);
	}
	
	@GetMapping("/admin/reserveList")
	public String reserveList(
			@RequestParam(required = false) String selectedDate,
			@RequestParam(required = false, defaultValue = "1") Integer gmpPage,
			@RequestParam(required = false, defaultValue = "1") Integer icnPage,
			@RequestParam(required = false, defaultValue = "1") Integer otherPage,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			Model model) {
		
		// 서비스로 전달
		return service.reserveList(selectedDate, gmpPage, icnPage, otherPage, page, model);
	}
		
	@GetMapping("/admin/flightsList")
	public String flightsList(
			@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false) String selectedDate,
			@RequestParam(required = false, defaultValue = "all") String flightType,
			Model model) {
		
		return service.flightList(page, selectedDate, flightType, model);
	}
	
	@GetMapping("/admin/memberList")
	public String memberList(HttpServletRequest request, Model model) {
		return service.memberList(request, model);
	}
	
	@GetMapping("/admin/memberUp")
	public String memberUp(@RequestParam int id, @RequestParam int level, Model model) {
		// MemberDto 객체 생성
		MemberDto mdto = new MemberDto();
		
		// id와 state 값을 mdto 객체에 세팅
		mdto.setId(id);
		mdto.setLevel(level);
		
		// 서비스 호출하여 회원 정보 업데이트
		return service.memberUp(mdto);
	}
	
	@GetMapping("/admin/oneMeminfo")
	public String oneMeminfo(HttpServletRequest request, Model model) {
		return service.oneMeminfo(request, model);
	}
	
	@GetMapping("/admin/inquiryList") // 새로운 매핑 추가
	public String inquiryList(Model model, Integer page) {
		return service.inquiryList(model, page);
	}
	
	@GetMapping("/admin/inquiryContent")
	public String inquiryContent(HttpServletRequest request, Model model) {
		return iservice.inquiryContent(request, model);
	}
	
	@PostMapping("/admin/answer")
	public String answer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
		return iservice.answer(inquiryId, answerText); // 서비스의 답변 저장 로직 호출 후 리턴
	}
	
	@PostMapping("/admin/updateAnswer")
	public String updateAnswer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
		return iservice.updateAnswer(inquiryId, answerText); // 서비스의 답변 수정 로직 호출 후 리턴
	}
	
	@GetMapping("/admin/gongjiList")
	public String gongjiList(HttpServletRequest request, Model model) {
		return service.gongjiList(request, model);
	}
	
	@GetMapping("/admin/gongjiContent")
	public String gongjiContent(HttpServletRequest request, Model model) {
		return gservice.gongjiContent(request, model);
	}
	
	@GetMapping("/admin/gongjiWrite")
	public String write() {
		return gservice.gongjiWrite();
	}
	
	@PostMapping("/admin/gongjiWriteOk")
	public String write(GongjiDto gdto, HttpSession session) {
		return gservice.gongjiWriteOk(gdto, session);
	}
	
	@GetMapping("/gongji/update")
	public String gongjiUpdate(HttpServletRequest request, Model model) {
		return gservice.update(request, model);
	}
	
	@PostMapping("/gongji/updateOk")
	public String gongjiUpdateOk(GongjiDto gdto) {
		return gservice.updateOk(gdto);
	}
	
	@PostMapping("/admin/gongjiDelete")
	public String delete(HttpServletRequest request) {
		return gservice.delete(request);
	}
	
	@GetMapping("/admin/rsvdList")
	public String rsvdList(HttpServletRequest request, Model model) {
		return service.rsvdList(request, model);
	}
	
	@GetMapping("/admin/cancelConfirm")
	public String cancelConfirm(HttpServletRequest request, Model model) {
		return service.cancelConfirm(request, model);
	}
	
	@GetMapping("/admin/cancelRejection")
	public String cancelRejection(HttpServletRequest request, Model model) {
		return service.cancelRejection(request, model);
	}
	
	@GetMapping("/admin/payReturn")
	public String payReturn(HttpServletRequest request, Model model) {
		return service.payReturn(request, model);
	}
	
	@GetMapping("/admin/addFlight")
	public String showAddFlightForm(Model model) {
		List<AirportsDto> airports = fservice.getAllAirports();
		List<AirplanesDto> airplanes = fservice.getAllAirplanes();
		model.addAttribute("airports", airports);
		model.addAttribute("airplanes", airplanes);
		return "admin/addFlight";
	}
	
	@GetMapping("/admin/getFlightTime")
	@ResponseBody
	public Map<String, Integer> getFlightTime(@RequestParam String departureAirport,
			@RequestParam String arrivalAirport) {
		int[] flightTime = fservice.getFlightTime(departureAirport, arrivalAirport);
		
		Map<String, Integer> response = new HashMap<>();
		response.put("hour", flightTime[0]);
		response.put("minute", flightTime[1]);
		response.put("unitPrice", flightTime[2]);
		
		return response;
	}
	/*
	@GetMapping("/admin/getUnitPrice")
	@ResponseBody
	public Map<String, Integer> getUnitPrice(@RequestParam String departureAirport,
			@RequestParam String arrivalAirport) {
	    // Unit Price 계산하는 부분
	    int unitPrice = fservice.getUnitPrice(departureAirport, arrivalAirport);
	    // Unit Price 응답 준비
	    Map<String, Integer> response = new HashMap<>();
	    response.put("unitPrice", unitPrice);
	    
	    return response;
	}
	*/
	@PostMapping("/admin/addFlights")
	public String addFlights(
			@RequestParam String departureAirport,
			@RequestParam String arrivalAirport,
			@RequestParam String departureTime,
			@RequestParam String arrivalTime,
			@RequestParam("ftimeValue") String ftime,
			@RequestParam int airplaneId,
			@RequestParam int unitPrice,
			
			@RequestParam String returnDepartureAirport,
			@RequestParam String returnArrivalAirport,
			@RequestParam String returnDepartureTime,
			@RequestParam String returnArrivalTime,
			@RequestParam("returnFtimeValue") String returnFtime,
			@RequestParam int returnAirplaneId,
			@RequestParam int returnUnitPrice,
			
			Model model) {
		
		try {
			// 출발편 추가
			fservice.addFlight(departureAirport, arrivalAirport, departureTime, arrivalTime, ftime, airplaneId, unitPrice);
			// 귀국편 추가
			fservice.addFlight(returnDepartureAirport, returnArrivalAirport, returnDepartureTime, returnArrivalTime, returnFtime, returnAirplaneId, returnUnitPrice);
			
			model.addAttribute("message", "출발편과 귀국편이 성공적으로 추가되었습니다.");
		}
		catch (Exception e) {
			model.addAttribute("message", "항공편 추가 중 오류가 발생했습니다: " + e.getMessage());
			return "admin/addFlight";  // 오류 발생 시 다시 항공편 추가 페이지로
		}
		
		// 항공편 목록 페이지로 리다이렉트
		return "redirect:/admin/flightsList";
	}
	
	@GetMapping("/admin/getTimezones")
	@ResponseBody
	public Map<String, String> getTimezones(@RequestParam String departureAirport,
			@RequestParam String arrivalAirport) {
		String departureTimezone = fservice.getAirportTimezone(departureAirport);
		String arrivalTimezone = fservice.getAirportTimezone(arrivalAirport);
		
		Map<String, String> response = new HashMap<>();
		response.put("departureTimezone", departureTimezone);
		response.put("arrivalTimezone", arrivalTimezone);
		return response;
	}
	
	@PostMapping("/admin/addSeats")
	public String addSeats() {
		// flightId는 내부에서 처리되므로 전달하지 않음
		fservice.addSeatsForFlight();
		
		return "redirect:/admin/flightsList";  // 완료 후 항공편 목록 페이지로 이동
	}
	
	@GetMapping("/admin/promotList")
	public String promotList(HttpServletRequest request, Model model) {
		return service.promotList(request, model);
	}
	
	@GetMapping("/admin/promotAdd")
	public String promotAdd() {
		return service.promotAdd();
	}
	
	@PostMapping("/admin/addPromots")
	public String addPromots(PromotDto pdto, @RequestParam MultipartFile file) throws Exception {
	    return service.addPromots(pdto, file);
	}
	
	@GetMapping("/admin/promotContent")
	public String promotContent(HttpServletRequest request, Model model) {
		return service.promotContent(request, model);
	}
	
	@GetMapping("/admin/promotUpdate")
	public String promotUpdate(HttpServletRequest request, Model model) {
	    return service.promotUpdate(request, model);
	}
	
	@PostMapping("/admin/upPromots")
	public String upPromots(HttpServletRequest request, @RequestParam MultipartFile file, PromotDto pdto) throws Exception {
	    return service.upPromots(request, file, pdto);
	}
	
	@GetMapping("/admin/delPromot")
	public String delPromot(HttpServletRequest request) {
		return service.delPromot(request);
	}
	
}