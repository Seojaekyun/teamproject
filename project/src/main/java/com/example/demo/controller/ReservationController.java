package com.example.demo.controller;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.service.FlightService;
import com.example.demo.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@Qualifier("rs")
public class ReservationController {

    @Autowired
    @Qualifier("fs")
    private FlightService flightService;

    @Autowired
    private SeatService seatService;
    
    @GetMapping("/reserve/reservation")
    public String showReservation(Model model) {
        List<FlightDto> flights = flightService.getAvailableFlights();
        model.addAttribute("flights", flights);
        
        return "/reserve/reservation";
    }
    
    @GetMapping("/reserve/seats")
    @ResponseBody
    public List<SeatDto> getSeatsForFlight(@RequestParam("flightId") int flightId) {
        // 특정 항공편에 해당하는 좌석 목록을 가져옴
        List<SeatDto> availableSeats = seatService.getAvailableSeats(flightId);
        return availableSeats;
    }

    @GetMapping("/reserve")
    public String showReservationForm(Model model) {
        // 항공편 목록을 가져와서 JSP로 전달
        List<FlightDto> flights = flightService.getAvailableFlights();
        System.out.println("Fetched flights: " + flights);  // 항공편 데이터를 로그에 출력

        model.addAttribute("flights", flights);

        // 기본적으로 비어 있는 좌석 리스트를 전달
        model.addAttribute("availableSeats", new ArrayList<SeatDto>());
        return "/reserve/reservation";
    }

    @PostMapping("/reserve")
    public String processReservation(@RequestParam("flight_id") int flightId, 
                                     @RequestParam("seat_number") String seatNumber,
                                     Model model) {
        // 선택된 항공편의 좌석 리스트를 가져와서 JSP로 전달
        List<SeatDto> availableSeats = seatService.getAvailableSeats(flightId);
        model.addAttribute("availableSeats", availableSeats);

        // 선택한 항공편 정보를 다시 JSP에 전달
        List<FlightDto> flights = flightService.getAvailableFlights();
        model.addAttribute("flights", flights);

        return "/reserve/reservation";
    }
}