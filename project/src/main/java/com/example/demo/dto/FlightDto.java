package com.example.demo.dto;


import java.util.List;

import lombok.Data;

@Data
public class FlightDto {

	private int flightId, availableSeats, passengerCount, totalSeats;
	private String flightNumber, departureAirport, arrivalAirport, departureTime;
	private String arrivalTime, flightDuration, airplaneId, flightName;

    private SeatClass seatClass;
    private List<SeatDto> seatOptions;
    
    	
}