package com.example.demo.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.FlightsDto;

@Mapper
public interface FlightMapper {
	@Select("SELECT flight_id, departure_airport, arrival_airport, departure_time FROM Flights")
	    @Results({
	        @Result(property = "flightId", column = "flight_id"),
	        @Result(property = "departureAirport", column = "departure_airport"),
	        @Result(property = "arrivalAirport", column = "arrival_airport"),
	        @Result(property = "departureTime", column = "departure_time")
	    })
	    List<FlightDto> getAllFlights();
	


	List<FlightsDto> searchFlights(String departure, String arrival, String departureDate, String arrivalDate);
}
