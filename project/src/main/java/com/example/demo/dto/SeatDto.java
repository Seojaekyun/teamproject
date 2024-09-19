package com.example.demo.dto;

import lombok.Data;

@Data
public class SeatDto {
	private int seatId, flight_id;
	private String seatNumber;
	private int isAvailable;
	
	
}