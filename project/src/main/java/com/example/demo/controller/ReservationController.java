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

import java.util.List;

@Controller
@Qualifier("rs")
public class ReservationController {

    @Autowired
    private FlightService flightService;

    @Autowired
    private SeatService seatService;
    
    @GetMapping("/reserve/reservation")
    public String showReservation(Model model) {
    	List<FlightDto> flights = flightService.getAvailableFlights();
        model.addAttribute("flights", flights);
        return "/reserve/reservation";
    }

    @GetMapping("/reserve/flights")
    @ResponseBody
    public List<FlightDto> getFlightsByDate(@RequestParam("date") String date) {
        return flightService.getAvailableFlightsByDate(date);
    }

    @GetMapping("/reserve/seats")
    @ResponseBody
    public List<SeatDto> getSeatsForFlight(@RequestParam("flightId") int flightId) {
        return seatService.getAvailableSeats(flightId);
    }

    @PostMapping("/reserve")
    public String processReservation(
        @RequestParam("flight_id") int flightId,
        @RequestParam("seat_number") String seatNumber,
        @RequestParam("customer_id") String customerId,
        @RequestParam("customer_name") String customerName,
        @RequestParam("customer_email") String customerEmail,
        Model model
    ) {
        // 예약 처리 로직 추가
        return "/reserve/success";
    }
}
