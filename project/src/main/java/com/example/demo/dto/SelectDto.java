package com.example.demo.dto;

import lombok.Data;

@Data
public class SelectDto {
	private String pnr;
	private String sung, name;
    private String seatClass;
    private int seatId;
    private String seatNumber;
    private int flightId;
    private String departureAirport;
    private String arrivalAirport;
    private String departureTime;
    private String arrivalTime;
    private String flightDuration;
    private int airplaneId;
    private String flightName;
    private String departureAirportName;
    private String departureCity;
    private String arrivalAirportName;
    private String arrivalCity;
}
