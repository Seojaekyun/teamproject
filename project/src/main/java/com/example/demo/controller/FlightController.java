package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.FlightDto;
import com.example.demo.dto.SeatDto;
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
    		@RequestParam("selectedGoingFlightId") String selectedGoingFlightId,
    	    @RequestParam("selectedGoingFlightDeparture") String selectedGoingFlightDeparture,
    	    @RequestParam("selectedGoingFlightArrival") String selectedGoingFlightArrival,
    	    @RequestParam("selectedGoingFlightTime") String selectedGoingFlightTime,
    	    @RequestParam("selectedGoingFlightArrivalTime") String selectedGoingFlightArrivalTime, // 가는편 도착 시간 추가
    	    @RequestParam("returnDate") String returnDate,     // 오는날 날짜
            @RequestParam(required = false) String seatClass,        // 추가된 파라미터
            @RequestParam(required = false) Integer passengers,      // 추가된 파라미터
            Model model
    ) {
    	// 오는날 비행기 조회: seatClass와 passengers가 제공된 경우 필터링
    	// 오는날 비행기 조회
        List<FlightDto> returnFlights = service.findFlights(selectedGoingFlightArrival, selectedGoingFlightDeparture, null, returnDate, seatClass, passengers);

        
        // 오는날 비행기 정보 모델에 추가
        model.addAttribute("returnFlights", returnFlights);
        
        // 가는편 항공편 정보를 모델에 추가하여 유지
        model.addAttribute("selectedGoingFlightId", selectedGoingFlightId);
        model.addAttribute("selectedGoingFlightDeparture", selectedGoingFlightDeparture);
        model.addAttribute("selectedGoingFlightArrival", selectedGoingFlightArrival);
        model.addAttribute("selectedGoingFlightTime", selectedGoingFlightTime);
        model.addAttribute("selectedGoingFlightArrivalTime", selectedGoingFlightArrivalTime); // 가는편 도착 시간 추가
        
        
        // seatClass와 passengers를 모델에 추가
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("passengers", passengers);

        // 같은 JSP 페이지로 이동하여 결과를 함께 표시
        return "flight/flightSearchResults";
    }
    
    
    
    
    @PostMapping("/confirmSelection")
    public String confirmSelection(
            @RequestParam("selectedGoingFlightId") String selectedGoingFlightId,
            @RequestParam("selectedGoingFlightDeparture") String selectedGoingFlightDeparture,
            @RequestParam("selectedGoingFlightArrival") String selectedGoingFlightArrival,
            @RequestParam("selectedGoingFlightTime") String selectedGoingFlightTime,
            @RequestParam("selectedGoingFlightArrivalTime") String selectedGoingFlightArrivalTime,
            
            
            @RequestParam("selectedReturnFlightId") String selectedReturnFlightId,
            @RequestParam("selectedReturnFlightDeparture") String selectedReturnFlightDeparture,
            @RequestParam("selectedReturnFlightArrival") String selectedReturnFlightArrival,
            @RequestParam("selectedReturnFlightTime") String selectedReturnFlightTime,
            @RequestParam("selectedReturnFlightArrivalTime") String selectedReturnFlightArrivalTime,
            
            
            @RequestParam String seatClass, // 좌석 등급
            @RequestParam Integer passengers, // 선택된 인원
            Model model
    ) {
        // 가는편 항공편 정보를 모델에 추가
        model.addAttribute("selectedGoingFlightId", selectedGoingFlightId);
        model.addAttribute("selectedGoingFlightDeparture", selectedGoingFlightDeparture);
        model.addAttribute("selectedGoingFlightArrival", selectedGoingFlightArrival);
        model.addAttribute("selectedGoingFlightTime", selectedGoingFlightTime);
        model.addAttribute("selectedGoingFlightArrivalTime", selectedGoingFlightArrivalTime);
        

        // 오는편 항공편 정보를 모델에 추가
        model.addAttribute("selectedReturnFlightId", selectedReturnFlightId);
        model.addAttribute("selectedReturnFlightDeparture", selectedReturnFlightDeparture);
        model.addAttribute("selectedReturnFlightArrival", selectedReturnFlightArrival);
        model.addAttribute("selectedReturnFlightTime", selectedReturnFlightTime);
        model.addAttribute("selectedReturnFlightArrivalTime", selectedReturnFlightArrivalTime);

        // 좌석 등급과 인원 정보 모델에 추가
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("passengers", passengers);

        // 선택 확인 페이지로 이동
        return "flight/flightConfirmation";
    }

    
    @GetMapping("/seats")
    public String showSeatSelection(
    		@RequestParam("flightId") int flightId, 
            @RequestParam("seatClass") String seatClass, 
            Model model) {
    	
        List<SeatDto> availableSeats = service.getAvailableSeats(flightId, seatClass);
        
     // 좌석 데이터의 크기를 출력하여 데이터가 조회되는지 확인
        System.out.println("Available seats count: " + availableSeats.size());
        
        
        model.addAttribute("seats", availableSeats);
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("flightId", flightId);

        return "flight/seats";  // 이 경로에 JSP가 있어야 함
    }

    

    @PostMapping("/booking")
    public String booking(@RequestParam String goingFlightId, @RequestParam String returnFlightId, Model model) {
        // 예약을 위한 로직 추가 (아직 구현되지 않음)
        
        // 예약 성공 페이지로 이동
        return "bookingPage";  // 빈 페이지로 설정
    }

    
    
    
}  

