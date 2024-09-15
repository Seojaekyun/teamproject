package com.example.demo.service;

import com.example.demo.dto.FlightDto;

import java.util.List;

public interface FlightService {
    List<FlightDto> getAvailableFlights();
	List<FlightDto> findFlights(String departure, String arrival, String departureDate, String arrivalDate);
}
