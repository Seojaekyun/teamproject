package com.example.demo.dto;

import java.time.LocalTime;

import lombok.Data;

@Data
public class FlightTimeDto {
	private String a, b;
	private LocalTime flightTime;
	
}
