package com.example.demo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
            
            
            @RequestParam(required = false, defaultValue = "") String[] goingSelectedSeats,  // 가는편 좌석 배열 기본값
            @RequestParam(required = false, defaultValue = "") String[] returnSelectedSeats, // 오는편 좌석 배열 기본값
            
            
           
            
            HttpSession session,
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
        
        
        model.addAttribute("goingSelectedSeats", goingSelectedSeats);
        model.addAttribute("returnSelectedSeats", returnSelectedSeats);
        
        
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
    ){
        
    	
   
        String[] seatArray = selectedSeats.split(",");
        if (seatArray.length != passengers) {
            model.addAttribute("errorMessage", "선택한 좌석 수가 탑승객 수와 일치하지 않습니다.");
            return "flight/seats"; // 에러 메시지를 표시하고 좌석 선택 페이지로 돌아갑니다.
        }

     // 선택한 좌석과 탑승객 수 세션에 저장
        model.addAttribute("goingSelectedSeats", seatArray);  // 가는편 좌석 배열      
        // 오는편 좌석 선택을 위해 필요한 데이터 전달
        // 예를 들어, 오는편 flightId 등을 세션 또는 모델에 저장
        System.out.println("가는편 선택한 좌석: " + selectedSeats);
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
        model.addAttribute("returnSelectedSeats", seatArray);  // 오는편 좌석 배열

        // 예약 페이지로 이동 또는 다음 단계 진행
        return "redirect:/flights/booking";
    }
    

    @PostMapping("/booking")
    public String booking(
            @RequestParam String goingFlightId, 
            @RequestParam String returnFlightId,
            
            @RequestParam String seatClass, // 좌석 등급
            @RequestParam Integer passengers, // 선택된 인원
            
            @RequestParam String goingSelectedSeats,  // 선택한 가는편 좌석
            @RequestParam String returnSelectedSeats, // 선택한 오는편 좌석
            
            
            HttpSession session,
            Model model) {

    	
    	// 로그 추가: 전달받은 좌석 정보 확인
        System.out.println("가는편 좌석: " + goingSelectedSeats);
        System.out.println("오는편 좌석: " + returnSelectedSeats);
    	
    	
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
       
        
        // 선택한 좌석 정보를 배열로 변환
        String[] goingSeatsArray = goingSelectedSeats.split(",");
        String[] returnSeatsArray = returnSelectedSeats.split(",");
        
        
        model.addAttribute("goingSeats", String.join(", ", goingSeatsArray));
        model.addAttribute("returnSeats", String.join(", ", returnSeatsArray));
        
        model.addAttribute("passengers", passengers);
        model.addAttribute("seatClass", seatClass);
        
        model.addAttribute("userId", userId);
        // 예약 페이지로 이동
        return "flight/bookingPage";  // 예약 페이지 JSP 파일 경로
    }
    
    
    
 // PNR 생성 메서드
    private String generatePNR() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";  // 알파벳과 숫자
        StringBuilder pnr = new StringBuilder();
        Random rnd = new Random();
        while (pnr.length() < 6) {  // PNR 6자리
            int index = (int) (rnd.nextFloat() * chars.length());
            pnr.append(chars.charAt(index));
        }
        return pnr.toString();
    }


    
    @PostMapping("/confirmBooking")
    public String confirmBooking(
            @RequestParam String goingFlightId,
            @RequestParam String returnFlightId,
            @RequestParam String seatClass,
            @RequestParam Integer passengers,
            @RequestParam String goingSelectedSeats,  // 가는편 좌석
            @RequestParam String returnSelectedSeats, // 오는편 좌석
            HttpSession session,
            Model model) {

        // 세션에서 로그인된 사용자 정보 확인
        String userId = (String) session.getAttribute("userid");
        if (userId == null) {
            return "redirect:/login/login";  // 로그인 안 되어 있으면 로그인 페이지로 리다이렉트
        }

        // 유저 정보 조회
        MemberDto user = service.getMemberInfoByUserId(userId);
        if (user == null) {
            return "redirect:/errorPage";  // 유저 정보가 없을 경우
        }

        // PNR 생성
        String goingPNR = generatePNR();  // 가는편 PNR 생성
        String returnPNR = generatePNR();  // 오는편 PNR 생성

        // 가는편 좌석들 배열
        String[] goingSeatsArray = goingSelectedSeats.split(",");
        // 오는편 좌석들 배열
        String[] returnSeatsArray = returnSelectedSeats.split(",");    

     // 가는편 예약 저장
        int goingReservationId = service.addReservation(userId, goingFlightId, seatClass, "가는편", goingPNR, user.getSung(), user.getName());

        // 가는편 좌석 처리: 여러 좌석이 배열로 들어올 경우 하나씩 처리
        for (String seat : goingSeatsArray) {
            int seatId = service.getSeatIdBySeatNumber(seat.trim());  // 좌석 번호를 통해 seat_id를 얻음
            if (seatId > 0) {
                service.addSeatToReservation(goingReservationId, seatId); // reservation_seats 테이블에 좌석 추가
                service.updateSeatAvailability(Integer.parseInt(goingFlightId), seatId); // 좌석 가용성 업데이트
            } else {
                // 좌석 ID가 유효하지 않은 경우 처리
                model.addAttribute("errorMessage", "잘못된 가는편 좌석 번호: " + seat);
                return "errorPage";
            }
        }

        // 오는편 예약 저장
        int returnReservationId = service.addReservation(userId, returnFlightId, seatClass, "오는편", returnPNR, user.getSung(), user.getName());

        // 오는편 좌석 처리: 여러 좌석이 배열로 들어올 경우 하나씩 처리
        for (String seat : returnSeatsArray) {
            int seatId = service.getSeatIdBySeatNumber(seat.trim());
            if (seatId > 0) {
                service.addSeatToReservation(returnReservationId, seatId); // reservation_seats 테이블에 좌석 추가
                service.updateSeatAvailability(Integer.parseInt(returnFlightId), seatId); // 좌석 가용성 업데이트
            } else {
                // 좌석 ID가 유효하지 않은 경우 처리
                model.addAttribute("errorMessage", "잘못된 오는편 좌석 번호: " + seat);
                return "errorPage";
            }
        }

        // 예약 완료 페이지로 이동
        model.addAttribute("goingPNR", goingPNR);  // 가는편 PNR
        model.addAttribute("returnPNR", returnPNR);  // 오는편 PNR
        model.addAttribute("goingFlightId", goingFlightId);
        model.addAttribute("returnFlightId", returnFlightId);
        model.addAttribute("goingSelectedSeats", goingSelectedSeats);
        model.addAttribute("returnSelectedSeats", returnSelectedSeats);
        model.addAttribute("seatClass", seatClass);
        model.addAttribute("passengers", passengers);

        return "flight/reservationConfirmationPage";  // 예약 완료 페이지
    }



    

    
    
}  

