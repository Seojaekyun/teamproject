package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;


import com.example.demo.dto.AirportsDto;

import com.example.demo.dto.FlightDto;

import com.example.demo.service.FlightService;

@RestController


@Controller

@RequestMapping("/flights")
public class FlightController {

    @Autowired
    private FlightService flightService;


    // 모든 공항 목록 API
    @GetMapping("/airports")
    public List<AirportsDto> getAllAirports() {
        return flightService.getAllAirports();

    }
}

