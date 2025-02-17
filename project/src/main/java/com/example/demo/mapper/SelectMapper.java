package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SelectMapper {
	List<Map<String, Object>> getRsvInfo(
			@Param("pnr") String pnr,
			@Param("sung") String sung, @Param("name") String name, @Param("date") String date);
	Map<String, Object> getAirportInfo(@Param("flight_id") Integer flightId);
	
	
	
}