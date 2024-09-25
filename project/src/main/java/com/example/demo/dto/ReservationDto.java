package com.example.demo.dto;

import lombok.Data;

@Data
public class ReservationDto {
	private int reservationId, reservationCount, flightId;
	private String userid, flightName;
	private String seatNumber, seatClass, reservationDate, departureTime;
	private String sung, name, pnr;
	
	
}