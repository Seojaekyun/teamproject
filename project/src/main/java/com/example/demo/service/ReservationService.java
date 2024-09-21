package com.example.demo.service;

import java.util.List;

import org.springframework.ui.Model;

import com.example.demo.dto.SeatDto;

import jakarta.servlet.http.HttpSession;

public interface ReservationService {
	List<SeatDto> getAvailableSeats(int flightId);
	boolean reserveFlight(String userId, int flightId, String seatNumber, String seatClass);
	
	
}

