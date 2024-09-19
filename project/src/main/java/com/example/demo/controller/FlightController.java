package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.FlightDto;
import com.example.demo.service.FlightService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    private FlightService flightService;

    // 항공편 검색 메서드 (JSP 뷰 반환)
    @RequestMapping("main/flightSearch")
    public String searchFlights(HttpServletRequest request, Model model) {
        String departure = request.getParameter("departure");
        String arrival = request.getParameter("arrival");
        String departureDate = request.getParameter("departure-date");
        String arrivalDate = request.getParameter("arrival-date");

        List<FlightDto> flights = flightService.findFlights(departure, arrival, departureDate, arrivalDate);

        model.addAttribute("flights", flights);

        return "flight/flightSearchResults"; // JSP 뷰 반환
    }

    // 공항 목록 API (JSON 반환)
    @GetMapping("/api/airports")
    public ResponseEntity<List<AirportsDto>> getAllAirports() {
        List<AirportsDto> airports = flightService.getAllAirports();
        return ResponseEntity.ok(airports); // JSON 반환
    }
}
