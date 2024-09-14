package com.example.demo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.service.ReservationService;

@Controller
public class ReservationController {

    @Autowired
    @Qualifier("rs")
    private ReservationService reservationService;
    
    private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

    // 항공편 목록을 JSP로 전달 (단순 호출)
    @GetMapping("/reserve/reservation")
    public String showReservationForm(@RequestParam(value = "flight_id", required = false) Integer flightId, Model model) {
        // 항공편 목록 불러오기
        List<FlightDto> flights = reservationService.getAllFlights();
        model.addAttribute("flights", flights);

        // 특정 항공편의 좌석 목록을 불러오기 (flightId가 있을 때)
        if (flightId != null && flightId != -1) {
            System.out.println("Selected flightId: " + flightId);  // flightId 확인

            // 좌석 데이터를 가져오는 부분
            List<SeatDto> availableSeats = reservationService.getAvailableSeats(flightId);
            System.out.println("Available seats for flightId " + flightId + ": " + availableSeats);  // availableSeats 출력

            model.addAttribute("availableSeats", availableSeats);
            model.addAttribute("selectedFlightId", flightId);
        }

        return "/reserve/reservation";  // JSP 파일로 이동
    }





    // 예약 처리 (단순 호출)
    @PostMapping("/reserve")
    public String reserveFlight(
        @RequestParam(value = "flight_id", required = false, defaultValue = "-1") int flight_id,
        @RequestParam("seat_class") String seatClass,
        @RequestParam("seat_number") String seatNumber,
        @RequestParam("customer_id") int customerId,
        @RequestParam("customer_name") String customerName,
        @RequestParam("customer_email") String customerEmail,
        Model model) {
        
        // flight_id가 유효한 값인지 확인
        if (flight_id == -1) {
            model.addAttribute("error", "Please select a valid flight.");
            return "reservation";  // 오류 메시지와 함께 다시 폼을 보여줌
        }

        // 비즈니스 로직 처리 후 메시지 반환
        String message = reservationService.reserveFlight(customerId, flight_id, seatNumber, seatClass, customerName, customerEmail);
        model.addAttribute("message", message);
        return "reservation";
    }

}