package com.example.demo.service;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.dto.FlightDto;

import java.util.List;

import com.example.demo.dto.AirportsDto;

public interface FlightService {
	List<AirportsDto> getAllAirports();
	List<FlightDto> getAvailableFlightsByDate(String date);
	List<FlightDto> findFlights(String departure, String arrival, String departureDate, String arrivalDate, String seatClass, Integer passengers);
    List<FlightDto> getAvailableFlights();
    
    // 새로 추가된 메서드
    List<SeatDto> getSeatsByFlightId(int flightId);
    List<SeatDto> getAvailableSeats(int flightId, String seatClass);

}
