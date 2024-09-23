package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.AirportsDto;
import com.example.demo.service.FlightService;

@RestController
@RequestMapping("/api/flights")
public class FlightApiController {

    @Autowired
    @Qualifier("fs")
    private FlightService service;

    // 모든 공항 목록 API
    @GetMapping("/airports")
    public List<AirportsDto> getAllAirports() {
        return service.getAllAirports();
    }
}