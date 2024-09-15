package com.example.demo.mapper;

import com.example.demo.dto.FlightDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FlightMapper {
    List<FlightDto> getAvailableFlights();
}