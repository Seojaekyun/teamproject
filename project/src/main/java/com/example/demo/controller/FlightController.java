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
    	
    	 // 초기 검색 시에는 가는날 비행기만 조회 (오는날은 나중에 조회)
        List<FlightDto> departingFlights = service.findFlights(departure, arrival, departureDate, null);


        // 조회된 가는날 비행기 데이터를 모델에 추가
        model.addAttribute("flights", departingFlights);
        
        // 오는날 정보를 모델에 추가하여 flightSearchResults.jsp에서 사용할 수 있도록 함
        model.addAttribute("arrivalDate", arrivalDate);
    	
        // 검색 결과를 보여줄 JSP 파일로 이동
        return "flight/flightSearchResults";  // "views/flight/flightSearchResults.jsp"로 이동
    }
    
    @GetMapping("/searchReturn")
    public String searchReturnFlights(
            @RequestParam String selectedDeparture,  // 선택된 가는날 비행기의 도착 공항 코드
            @RequestParam String selectedArrival,    // 선택된 가는날 비행기의 출발 공항 코드
            @RequestParam String returnDate,         // 오는날 날짜
            Model model
    ) {
        // 오는날 비행기 조회: 출발 공항과 도착 공항을 교환하고, 오는날 날짜로 조회
        List<FlightDto> returnFlights = service.findFlights(selectedDeparture, selectedArrival, returnDate, null);

        // 조회된 오는날 비행기 데이터를 모델에 추가
        model.addAttribute("returnFlights", returnFlights);

        // 같은 JSP 페이지로 이동하여 결과를 함께 표시
        return "flight/flightSearchResults";
    }
    
}  
