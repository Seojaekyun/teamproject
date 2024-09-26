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

import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.FlightDto;
import com.example.demo.service.FlightService;

@Controller
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    @Qualifier("fs")
    private FlightService service;

    // 모든 공항 목록 API (주석 처리됨)
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
            @RequestParam(required = false) String seatClass,        // 추가된 파라미터
            @RequestParam(required = false) Integer passengers,      // 추가된 파라미터
            @RequestParam(required = false) Integer adultCount,
            @RequestParam(required = false) Integer childCount,
            @RequestParam(required = false) Integer infantCount,
            Model model) {
    	
    	
    	
    	
    	// 승객 수를 총합으로 계산하거나 개별적으로 처리
        if (passengers == null) {
            passengers = (adultCount != null ? adultCount : 0) + (childCount != null ? childCount : 0);
        }
        
        // passengers가 null인 경우 기본값을 1로 설정
        int totalPassengers = (passengers != null) ? passengers : 1;
    	
    	
    	// 가는날 항공편 검색: seatClass와 passengers가 제공된 경우 필터링
        List<FlightDto> departingFlights = service.findFlights(departure, arrival, departureDate, arrivalDate, seatClass, passengers);

        // 조회된 가는날 비행기 데이터를 모델에 추가
        model.addAttribute("flights", departingFlights);
        
        // 오는날 정보를 모델에 추가하여 flightSearchResults.jsp에서 사용할 수 있도록 함
        model.addAttribute("arrivalDate", arrivalDate);
        
        // seatClass와 passengers를 모델에 추가
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("passengers", passengers);
        

    	
        // 검색 결과를 보여줄 JSP 파일로 이동
        return "flight/flightSearchResults";  // "views/flight/flightSearchResults.jsp"로 이동
    }
    
    @GetMapping("/searchReturn")
    public String searchReturnFlights(
            @RequestParam String selectedDeparture,  // 선택된 가는날 비행기의 도착 공항 코드
            @RequestParam String selectedArrival,    // 선택된 가는날 비행기의 출발 공항 코드
            @RequestParam String returnDate,         // 오는날 날짜
            @RequestParam(required = false) String seatClass,        // 추가된 파라미터
            @RequestParam(required = false) Integer passengers,      // 추가된 파라미터
            Model model
    ) {
    	// 오는날 비행기 조회: seatClass와 passengers가 제공된 경우 필터링
        List<FlightDto> returnFlights = service.findFlights(selectedDeparture, selectedArrival, null, returnDate, seatClass, passengers);

        // 조회된 오는날 비행기 데이터를 모델에 추가
        model.addAttribute("returnFlights", returnFlights);
        
        // seatClass와 passengers를 모델에 추가
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("passengers", passengers);

        // 같은 JSP 페이지로 이동하여 결과를 함께 표시
        return "flight/flightSearchResults";
    }
    
}  

