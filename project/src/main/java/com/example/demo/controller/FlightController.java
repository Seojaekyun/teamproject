package com.example.demo.controller;

import java.io.IOException;
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

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.service.FlightService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

     // 세션에 가는편과 오는편 비행기 ID를 저장합니다.
        session.setAttribute("selectedGoingFlightId", selectedGoingFlightId);
        session.setAttribute("selectedReturnFlightId", selectedReturnFlightId);
        // 선택 확인 페이지로 이동
        return "flight/flightConfirmation";
    }

    
    @GetMapping("/seats")
    public String showSeatSelection(
    		@RequestParam("flightId") int flightId, 
            @RequestParam("seatClass") String seatClass,
            @RequestParam("passengers") int passengers,  // 추가된 부분

            Model model) {
    	
        List<SeatDto> availableSeats = service.getAvailableSeats(flightId, seatClass);
        
     // 좌석 데이터의 크기를 출력하여 데이터가 조회되는지 확인
        System.out.println("Available seats count: " + availableSeats.size());
        
        
        model.addAttribute("seats", availableSeats);
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("flightId", flightId);
        model.addAttribute("passengers", passengers);  // 추가된 부분

        return "flight/seats";  // 이 경로에 JSP가 있어야 함
    }
    
    
    @PostMapping("/confirmSeats")
    public String confirmSeats(
        @RequestParam("flightId") int flightId,
        @RequestParam("seatClass") String seatClass,
        @RequestParam("selectedSeats") String selectedSeats,
        @RequestParam("passengers") int passengers,  // 추가된 부분
        HttpSession session,
        Model model
    )throws IOException {
        // 선택한 좌석 수와 탑승객 수 일치 여부 확인
        String[] seatArray = selectedSeats.split(",");
        if (seatArray.length != passengers) {
            model.addAttribute("errorMessage", "선택한 좌석 수가 탑승객 수와 일치하지 않습니다.");
            return "flight/seats"; // 에러 메시지를 표시하고 좌석 선택 페이지로 돌아갑니다.
        }

     // 선택한 좌석과 탑승객 수 세션에 저장
        model.addAttribute("goingSelectedSeats", selectedSeats);  // 가는편 좌석
        session.setAttribute("passengers", passengers);  // 승객 수
        session.setAttribute("seatClass", seatClass);  // 좌석 등급


        // 오는편 좌석 선택을 위해 필요한 데이터 전달
        // 예를 들어, 오는편 flightId 등을 세션 또는 모델에 저장

     // 오는편 좌석 선택 페이지로 리다이렉트
        return "redirect:/flights/seatsReturn?seatClass=" + seatClass + "&passengers=" + passengers;
    }

    
    @GetMapping("/seatsReturn")
    public String showReturnSeatSelection(
        @RequestParam("seatClass") String seatClass,
        @RequestParam("passengers") int passengers,
        HttpSession session,
        Model model
    ) {
        String selectedReturnFlightId = (String) session.getAttribute("selectedReturnFlightId");

        if (selectedReturnFlightId == null) {
            model.addAttribute("errorMessage", "오는편 비행기가 선택되지 않았습니다.");
            return "errorPage";
        }

        int returnFlightId = Integer.parseInt(selectedReturnFlightId);

        List<SeatDto> availableSeats = service.getAvailableSeats(returnFlightId, seatClass);

        model.addAttribute("seats", availableSeats);
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("flightId", returnFlightId);
        model.addAttribute("passengers", passengers);

        return "flight/seatsReturn";
    }
    
    @PostMapping("/confirmReturnSeats")
    public String confirmReturnSeats(
        @RequestParam("flightId") int flightId,
        @RequestParam("seatClass") String seatClass,
        @RequestParam("selectedSeats") String selectedSeats,
        @RequestParam("passengers") int passengers,
        HttpSession session,
        HttpServletResponse response,
        Model model
    )throws IOException {
    	// 선택한 좌석 수와 탑승객 수 일치 여부 확인
        String[] seatArray = selectedSeats.split(",");
        if (seatArray.length != passengers) {
            model.addAttribute("errorMessage", "선택한 좌석 수가 탑승객 수와 일치하지 않습니다.");
            return "flight/seats"; // 에러 메시지를 표시하고 좌석 선택 페이지로 돌아갑니다.
        }

        // 선택한 좌석 정보를 세션에 저장
        model.addAttribute("returnSelectedSeats", selectedSeats);  // 오는편 좌석
        // 예약 페이지로 이동 또는 다음 단계 진행
        return "redirect:/flights/booking";
    }

    @PostMapping("/booking")
    public String booking(
            @RequestParam String goingFlightId, 
            @RequestParam String returnFlightId,
            
            @RequestParam String seatClass, // 좌석 등급
            @RequestParam Integer passengers, // 선택된 인원
            
            @RequestParam String goingSelectedSeats,  // 가는편 좌석
            @RequestParam String returnSelectedSeats, // 오는편 좌석
            
            
            HttpSession session,
            Model model) {

    	
        // 세션에서 로그인된 사용자 정보 확인
        String userId = (String) session.getAttribute("userid");

        
        if (userId == null) {
            // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
            return "redirect:/login/login";
        }

        
        
        // 유저 정보를 가져옴
        MemberDto user = service.getMemberInfoByUserId(userId);  // 회원 정보 조회
        
        FlightDto goingflight = service.getgoingFlightInfoByFlightId(goingFlightId);
        
        FlightDto returnflight = service.getreturnFlightInfoByFlightId(returnFlightId);
        
        
        if (user == null) {
            return "redirect:/errorPage"; // 유저 정보가 없을 경우 처리
        }
        


     // 세션에서 필요한 정보를 가져옴
        String selectedGoingFlightId = (String) session.getAttribute("selectedGoingFlightId");
        String selectedReturnFlightId = (String) session.getAttribute("selectedReturnFlightId");

        // Null 체크 후 기본값 설정
        if (passengers == null) {
            passengers = 1;  // 기본값 설정
        }
        
        
        // 유저 정보 모델에 추가
        
        model.addAttribute("userName", user.getName()); // 이름
        model.addAttribute("userSung", user.getSung());  // 성
        model.addAttribute("userLname", user.getLname());  // 이름
        model.addAttribute("userEmail", user.getEmail());  // 이메일
        model.addAttribute("userPhone", user.getPhone());  // 전화번호

        // 가는 항공편 정보 모델에 추가
        model.addAttribute("selectedGoingFlightId", selectedGoingFlightId);
        model.addAttribute("goingFlightName", goingflight.getFlightName());
        model.addAttribute("goingFlightDeparture", goingflight.getDepartureAirport());
        model.addAttribute("goingFlightArrival", goingflight.getArrivalAirport());
        model.addAttribute("goingDepartureTime", goingflight.getDepartureTime());
        model.addAttribute("goingArrivalTime", goingflight.getArrivalTime());
        model.addAttribute("goingFlightDruation", goingflight.getFlightDuration());
        
        
        
        
        
        // 오는 항공평 정보 모델에 추가
        model.addAttribute("selectedReturnFlightId", selectedReturnFlightId);
        model.addAttribute("returnFlightName", returnflight.getFlightName());
        model.addAttribute("returnFlightDeparture", returnflight.getDepartureAirport());
        model.addAttribute("returnFlightArrival", returnflight.getArrivalAirport());
        model.addAttribute("returnDepartureTime", returnflight.getDepartureTime());
        model.addAttribute("returnArrivalTime", returnflight.getArrivalTime());
        model.addAttribute("returnFlightDruation", returnflight.getFlightDuration());
       
        
        
        
        
        model.addAttribute("goingSeats", goingSelectedSeats);
        model.addAttribute("returnSeats", returnSelectedSeats);
        
        model.addAttribute("passengers", passengers);
        model.addAttribute("seatClass", seatClass);
        
        model.addAttribute("userId", userId);

        // 예약 페이지로 이동
        return "flight/bookingPage";  // 예약 페이지 JSP 파일 경로
    }

}  

