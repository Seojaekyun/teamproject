package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.FlightDto;
import com.example.demo.service.FlightService;

@Controller
public class FlightController {

    @Autowired
    private FlightService flightService;


    @GetMapping("/api/search_departure")
    @ResponseBody
    public List<FlightDto> searchDeparture(@RequestParam("query") String query) {
        return flightService.getFlightsByDeparture(query);  // FlightDto 사용
    }
}

