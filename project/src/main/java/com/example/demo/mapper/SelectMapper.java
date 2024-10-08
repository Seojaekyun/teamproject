package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SelectMapper {
	List<Map<String, Object>> getReservationInfo(
			@Param("pnr") String pnr,
			@Param("sung") String sung, @Param("name") String name);
	Map<String, Object> getFlightInfo(
			@Param("pnr") String pnr,
			@Param("sung") String sung, @Param("name") String name);
	Map<String, Object> getAirportInfo(@Param("flight_id") Integer flightId);
	List<Map<String, Object>> getSeatsInfo();
	
	
}