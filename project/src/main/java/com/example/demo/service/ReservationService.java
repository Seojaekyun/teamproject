package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import com.example.demo.dto.FlightDto;
import com.example.demo.dto.SeatDto;

public interface ReservationService {
    List<FlightDto> getAllFlights(); // 항공편 목록 조회 메서드
    String reserveFlight(int customerId, int flightId, String seatNumber, String seatClass, String customerName, String customerEmail); // 예약 처리 메서드
	
	ArrayList<SeatDto> getAvailableSeats(int flightId);
}

