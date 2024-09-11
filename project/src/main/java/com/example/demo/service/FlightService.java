package com.example.demo.service;

import com.example.demo.dto.FlightsDto;
import java.util.List;

public interface FlightService {
    List<FlightsDto> findFlights(String departure, String arrival, String departureDate, String arrivalDate);
}
