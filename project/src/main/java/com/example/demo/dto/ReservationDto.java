package com.example.demo.dto;

import java.util.List;

import lombok.Data;

@Data
public class ReservationDto {
	private int reservationId, reservationCount, flightId, charge, chargePay, rsvcls;
	private String userid, flightName;
	private String seatNumber, seatClass, reservationDate, departureTime;
	private String sung, name, pnr;
	private double charge;
	private double chargePay;
	private List<Integer> seatIds;
	private String passengerType;
	private String departureAirport;
	
}