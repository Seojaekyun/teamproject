package com.example.demo.mapper;

import com.example.demo.dto.FlightsDto;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface FlightMapper {
    List<FlightsDto> searchFlights(String departure, String arrival, String departureDate, String arrivalDate);
}
