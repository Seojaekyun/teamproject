package com.example.demo.dto;

import lombok.Data;

@Data
public class FlightDto {

    private int flight_id;
    private String flight_number;
    private String departure_airport;
    private String arrival_airport;
    private String departure_time;
    private String arrival_time;

	private int flightId;
	private String flightNumber;
	private String departureAirport;
	private String arrivalAirport;
	private String departureTime;
	private String arrivalTime;
	
	

}