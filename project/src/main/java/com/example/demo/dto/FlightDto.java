package com.example.demo.dto;

import lombok.Data;

@Data
public class FlightDto {
    private int flightId;
    private String departureAirport;
    private String arrivalAirport;
    private String departureTime;

    // Getters and setters
}
