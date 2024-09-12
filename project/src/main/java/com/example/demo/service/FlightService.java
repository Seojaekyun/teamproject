package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.FlightDto;

public interface FlightService {
	List<FlightDto> getFlightsByDeparture(String query);
}
