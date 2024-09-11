package com.example.demo.service;

import com.example.demo.dto.FlightsDto;
import com.example.demo.mapper.FlightMapper;
import com.example.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("fs") // FlightService의 구현체를 'fs'로 정의
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper flightMapper;

    @Override
    public List<FlightsDto> findFlights(String departure, String arrival, String departureDate, String arrivalDate) {
        return flightMapper.searchFlights(departure, arrival, departureDate, arrivalDate);
    }
}
