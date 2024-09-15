package com.example.demo.service;

import com.example.demo.dto.FlightDto;
import com.example.demo.mapper.FlightMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("fs")
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper flightMapper;

    @Override
    public List<FlightDto> getAvailableFlights() {
        return flightMapper.getAvailableFlights();
    }

	@Override
	public List<FlightDto> findFlights(String departure, String arrival, String departureDate, String arrivalDate) {
		// TODO Auto-generated method stub
		return null;
	}
}
