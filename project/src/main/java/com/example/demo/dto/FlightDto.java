package com.example.demo.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class FlightDto {

	private int flightId;
   
    private String departureAirport;
    private String arrivalAirport;
    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private String flightDuration;
    private int airplaneId; // 데이터베이스 타입에 맞게 int로 변경
	
	
}