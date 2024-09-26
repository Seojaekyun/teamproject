package com.example.demo.dto;

import lombok.Data;

@Data
public class ReservationDto {
	private int reservationId, reservationCount, flightId, charge, chargePay, rsvcls;
	private String userid, flightName;
	private String seatNumber, seatClass, reservationDate, departureTime;
	private String sung, name, pnr;
	
	
}