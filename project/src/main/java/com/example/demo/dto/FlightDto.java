package com.example.demo.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class FlightDto {

	private int flightId;

	private String flightNumber, departureAirport, arrivalAirport, departureTime;
	private String arrivalTime, flightDuration, airplaneId;
	private int availableSeats;
	
}