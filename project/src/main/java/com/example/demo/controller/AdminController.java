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

import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.AirplanesDto;
import com.example.demo.dto.GongjiDto;
import com.example.demo.dto.MemberDto;
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
	
	@RequestMapping("/admin/index")
	public String adminI(HttpSession session, HttpServletRequest request, Model model) {
		return service.adminI(session, request, model);
	}
	
	@RequestMapping("/admin/reserveList")
	public String reserveList(
			@RequestParam(value = "selectedDate", required = false) String selectedDate,
			@RequestParam(value = "gmpPage", required = false, defaultValue = "1") Integer gmpPage,
			@RequestParam(value = "icnPage", required = false, defaultValue = "1") Integer icnPage,
			@RequestParam(value = "otherPage", required = false, defaultValue = "1") Integer otherPage,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
		
		// 서비스로 전달
		return service.reserveList(selectedDate, gmpPage, icnPage, otherPage, page, model);
	}
		
	@RequestMapping("/admin/flightsList")
	public String flightsList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "selectedDate", required = false) String selectedDate,
			@RequestParam(value = "flightType", required = false, defaultValue = "all") String flightType,
			Model model) {
		
		return service.flightList(page, selectedDate, flightType, model);
	}
	
	@RequestMapping("/admin/memberList")
	public String memberList(HttpServletRequest request, Model model) {
		return service.memberList(request, model);
	}
	
	@RequestMapping("/admin/memberUp")
	public String memberUp(@RequestParam("id") int id, @RequestParam("level") int level, Model model) {
	    // MemberDto 객체 생성
	    MemberDto mdto = new MemberDto();
	    
	    // id와 state 값을 mdto 객체에 세팅
	    mdto.setId(id);
	    mdto.setLevel(level);
	    
	    // 서비스 호출하여 회원 정보 업데이트
	    return service.memberUp(mdto);
	}

	
	@RequestMapping("/admin/oneMeminfo")
	public String oneMeminfo(HttpServletRequest request, Model model) {
		return service.oneMeminfo(request, model);
	}
	
	@RequestMapping("/admin/inquiryList") // 새로운 매핑 추가
    public String inquiryList(Model model, Integer page) {
        return service.inquiryList(model, page);
    }
	
	@RequestMapping("/admin/inquiryContent")
    public String inquiryContent(HttpServletRequest request, Model model) {
        return iservice.inquiryContent(request, model);
    }
	
	@RequestMapping("/admin/answer")
    public String answer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
        return iservice.answer(inquiryId, answerText); // 서비스의 답변 저장 로직 호출 후 리턴
    }

    @RequestMapping("/admin/updateAnswer")
    public String updateAnswer(@RequestParam("id") int inquiryId, @RequestParam("answer") String answerText) {
        return iservice.updateAnswer(inquiryId, answerText); // 서비스의 답변 수정 로직 호출 후 리턴
    }
	
	@RequestMapping("/admin/gongjiList")
	public String gongjiList(HttpServletRequest request, Model model) {
		return service.gongjiList(request, model);
	}
	
	@RequestMapping("/admin/gongjiContent")
	public String gongjiContent(HttpServletRequest request, Model model) {
		return gservice.gongjiContent(request, model);
	}
	
	@RequestMapping("/admin/gongjiWrite")
	public String write() {
		return gservice.gongjiWrite();
	}
	
	@RequestMapping("/admin/gongjiWriteOk")
	public String write(GongjiDto gdto, HttpSession session) {
		return gservice.gongjiWriteOk(gdto, session);
	}
	
	@RequestMapping("/gongji/update")
	public String gongjiUpdate(HttpServletRequest request, Model model) {
		return gservice.update(request, model);
	}
	
	@RequestMapping("/gongji/updateOk")
	public String gongjiUpdateOk(GongjiDto gdto) {
		return gservice.updateOk(gdto);
	}
	
	@RequestMapping("/admin/gongjiDelete")
	public String delete(HttpServletRequest request) {
		return gservice.delete(request);
	}
	
	@RequestMapping("/admin/rsvdList")
	public String rsvdList(HttpServletRequest request, Model model) {
		return service.rsvdList(request, model);
	}
	
	@GetMapping("/admin/addFlight")
    public String showAddFlightForm(Model model) {
        List<AirportsDto> airports = fservice.getAllAirports();
        List<AirplanesDto> airplanes = fservice.getAllAirplanes();
        model.addAttribute("airports", airports);
        model.addAttribute("airplanes", airplanes);
        return "admin/addFlight";
    }

	@PostMapping("/admin/addFlights")
	public String addFlights(
	        @RequestParam("departureAirport") String departureAirport,
	        @RequestParam("arrivalAirport") String arrivalAirport,
	        @RequestParam("departureTime") String departureTime,
	        @RequestParam("arrivalTime") String arrivalTime,
	        @RequestParam("airplaneId") int airplaneId,
	        
	        @RequestParam("returnDepartureAirport") String returnDepartureAirport,
	        @RequestParam("returnArrivalAirport") String returnArrivalAirport,
	        @RequestParam("returnDepartureTime") String returnDepartureTime,
	        @RequestParam("returnArrivalTime") String returnArrivalTime,
	        @RequestParam("returnAirplaneId") int returnAirplaneId,
	        
	        Model model) {

	    try {
	        // 출발편 추가
	        fservice.addFlight(departureAirport, arrivalAirport, departureTime, arrivalTime, airplaneId);
	        // 귀국편 추가
	        fservice.addFlight(returnDepartureAirport, returnArrivalAirport, returnDepartureTime, returnArrivalTime, returnAirplaneId);

	        model.addAttribute("message", "출발편과 귀국편이 성공적으로 추가되었습니다.");
	    } catch (Exception e) {
	        model.addAttribute("message", "항공편 추가 중 오류가 발생했습니다: " + e.getMessage());
	        return "admin/addFlight";  // 오류 발생 시 다시 항공편 추가 페이지로
	    }

	    // 성공적으로 항공편이 추가된 경우 항공편 목록 페이지로 리다이렉트
	    return "redirect:/admin/flightsList";
	}
    
	@PostMapping("/admin/addSeats")
    public String addSeats() {
        // flightId는 내부에서 처리되므로 전달하지 않음
        fservice.addSeatsForFlight();

        return "redirect:/admin/flightsList";  // 완료 후 항공편 목록 페이지로 이동
    }
	
	
}