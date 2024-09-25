package com.example.demo.mapper;



import com.example.demo.dto.FlightDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.example.demo.dto.AirportsDto;

@Mapper
public interface FlightMapper {

	List<AirportsDto> findAllAirports();
	List<FlightDto> getAvailableFlights();
	List<FlightDto> getFlightsByDate(String date);
	List<FlightDto> getAvailableFlightsByDate(String date);
	 List<FlightDto> findFlights(
	            @Param("departure") String departure,
	            @Param("arrival") String arrival,
	            @Param("departureDate") String departureDate,
	            @Param("arrivalDate") String arrivalDate
	    );
	List<FlightDto> getAllFlights();
    List<FlightDto> getFlightsWithPagination(@Param("limit") int limit, @Param("offset") int offset);
	int getTotalFlightsCount();
	List<FlightDto> getAllFlights(String currentDate);
	List<FlightDto> getDepartureFlights();
	List<FlightDto> getArrivalFlights();
	List<FlightDto> getFlightsByDate(@Param("date") LocalDate date);	
	

}

