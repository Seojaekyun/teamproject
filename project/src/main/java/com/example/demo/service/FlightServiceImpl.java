package com.example.demo.service;



import java.util.ArrayList;
import java.util.List;




import com.example.demo.dto.FlightDto;
import com.example.demo.mapper.FlightMapper;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.AirportsDto;
import com.example.demo.mapper.FlightMapper;







@Service("fs")

public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper flightMapper;


    @Override


    public List<AirportsDto> getAllAirports() {
    	
        return flightMapper.findAllAirports();
    }

    public List<FlightDto> getAvailableFlightsByDate(String date) {
        return flightMapper.getAvailableFlightsByDate(date);


    }

	@Override
	public List<FlightDto> findFlights(String departure, String arrival, String departureDate, String arrivalDate) {
		return flightMapper.findFlights(departure, arrival, departureDate, arrivalDate);
	}

	@Override
	public List<FlightDto> getAvailableFlights() {
		return flightMapper.getAllFlights();
	}
}

