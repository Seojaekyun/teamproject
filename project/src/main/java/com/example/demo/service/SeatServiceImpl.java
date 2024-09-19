package com.example.demo.service;

import com.example.demo.dto.SeatDto;
import com.example.demo.mapper.SeatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeatServiceImpl implements SeatService {
	@Autowired
	private SeatMapper seatMapper;
	
	@Override
	public List<SeatDto> getAvailableSeats(int flightId) {
		return seatMapper.getAvailableSeats(flightId);
	}
	
	
}