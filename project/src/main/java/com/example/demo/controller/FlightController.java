package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;



import com.example.demo.dto.AirportsDto;

import com.example.demo.dto.FlightDto;

import com.example.demo.service.FlightService;


@Controller
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    
    @Qualifier("fs")
    
    private FlightService service;

    
    
    // 모든 공항 목록 API
   // @GetMapping("/airports")
   // public List<AirportsDto> getAllAirports() {
   //     return service.getAllAirports();

   // }
    
    
    @GetMapping("/search")
    public String searchFlights(
            @RequestParam String departure,
            @RequestParam String arrival,
            @RequestParam(required = false) String departureDate,
            @RequestParam(required = false) String arrivalDate,
            Model model) {
    	
    	// 서비스에서 항공편을 조회
        List<FlightDto> flights = service.findFlights(departure, arrival, departureDate, arrivalDate);

        // 조회된 항공편 데이터를 모델에 추가
        model.addAttribute("flights", flights);
    	
        // 검색 결과를 보여줄 JSP 파일로 이동
        return "flight/flightSearchResults";  // "views/flight/flightSearchResults.jsp"로 이동
    }
}  //현재 컨트롤러 코드야 수정해줘
