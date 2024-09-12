package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.FlightDto;

@Mapper
public interface FlightMapper {
	List<FlightDto> searchFlightsByDeparture(@Param("query") String query);
}
