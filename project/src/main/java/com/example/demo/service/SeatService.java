package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.SeatDto;

public interface SeatService {

	List<SeatDto> getAvailableSeats(int flightId);
	

}
