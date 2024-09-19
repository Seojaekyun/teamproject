package com.example.demo.dto;

import lombok.Data;

@Data
public class FlightDto {
	private int flightId;
	private String flightNumber;
	private String departureAirport;
	private String arrivalAirport;
	private String departureTime;
	private String arrivalTime;
	
	


}