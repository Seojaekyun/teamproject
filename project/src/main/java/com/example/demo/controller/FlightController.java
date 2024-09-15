package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.FlightDto;
import com.example.demo.service.FlightService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FlightController {
	
	 @Autowired
	 @Qualifier("fs") // FlightService를 'fs'로 주입받음
	 private FlightService service;
	 
	 
	 @RequestMapping("main/flightSearch")
	    public String searchFlights(HttpServletRequest request, Model model) {
	        // HttpServletRequest로 파라미터 받기
	        String departure = request.getParameter("departure");
	        String arrival = request.getParameter("arrival");
	        String departureDate = request.getParameter("departure-date");
	        String arrivalDate = request.getParameter("arrival-date");

	        // 검색된 항공편 리스트 가져오기
	        List<FlightDto> flights = service.findFlights(departure, arrival, departureDate, arrivalDate);

	        // 모델에 검색 결과 추가
	        model.addAttribute("flights", flights);

	        // JSP 페이지로 이동 (검색 결과를 표시할 페이지)
	        return "flight/flightSearchResults";
	    }
}
