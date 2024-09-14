package com.example.demo.dto;

import lombok.Data;

@Data
public class ReservationDto {
    private int reservationId;
    private int customerId;
    private int flightId;
    private String seatNumber, seatClass, customerName, customerEmail;
	
}
