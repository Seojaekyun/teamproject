package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import com.example.demo.dto.FlightDto;
import com.example.demo.dto.SeatDto;

public interface ReservationService {
    String reserveFlight(int customerId, int flightId, String seatNumber, String seatClass, String customerName, String customerEmail); // 예약 처리 메서드
	
	List<SeatDto> getAvailableSeats(int flightId);

	boolean reserveFlight(String userId, int flightId, String seatNumber, String seatClass);
}

