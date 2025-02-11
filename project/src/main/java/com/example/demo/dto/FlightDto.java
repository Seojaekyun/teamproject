package com.example.demo.dto;


import java.util.List;

import lombok.Data;

@Data
public class FlightDto {
	private int flightId, availableSeats, passengerCount, totalSeats, airplaneId, unitPrice, surcharge, goingSelectedSeats;
	private String flightNumber, departureAirport, arrivalAirport, departureTime;
	private String arrivalTime, flightDuration, flightName, ftime;
	private SeatClass seatClass;
	private List<SeatDto> seatOptions;
	
	
}