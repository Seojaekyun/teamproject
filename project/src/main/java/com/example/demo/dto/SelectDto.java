package com.example.demo.dto;

import lombok.Data;

@Data
public class SelectDto {
	private int seatId, flightId, airplaneId, charge_pay;
	private String pnr, sung, name, seatClass, seatNumber, flightName, arrivalCity;
	private String departureAirport, arrivalAirport, departureTime, arrivalTime;
	private String flightDuration, departureAirportName, departureCity, arrivalAirportName;
	
	
}