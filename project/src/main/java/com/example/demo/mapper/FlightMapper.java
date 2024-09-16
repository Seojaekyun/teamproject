package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.demo.dto.AirportsDto;

@Mapper
public interface FlightMapper {
	List<AirportsDto> findAllAirports();
}
