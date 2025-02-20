package com.example.demo.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReservationDto {
	private int reservationId, reservationCount, flightId, charge, chargePay, rsvcls, goingPrice, sudan, state;
	private String userid, flightName, sung, name, pnr;
	private String seatNumber, seatClass, reservationDate, departureTime, offerDay;
	private String departureAirport, passengerType;
	private List<Integer> seatIds;
	
		
}