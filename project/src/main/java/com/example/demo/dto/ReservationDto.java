package com.example.demo.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class ReservationDto {
	private int reservationId, reservationCount;
	private String userid, flightName; ;
	private int flightId;
	private String seatNumber, seatClass;
	private LocalDateTime reservationDate;
	private LocalDateTime departureTime;
	
	public String getDepartureTimeFormatted() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return departureTime.format(formatter);
    }
}