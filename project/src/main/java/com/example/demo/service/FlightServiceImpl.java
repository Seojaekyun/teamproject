package com.example.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.AirportsDto;
import com.example.demo.mapper.FlightMapper;

@Service

public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper flightMapper;


    @Override
    public List<AirportsDto> getAllAirports() {
        return flightMapper.findAllAirports();
    }
}

