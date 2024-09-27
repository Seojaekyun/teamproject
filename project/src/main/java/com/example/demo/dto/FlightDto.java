package com.example.demo.dto;


import java.util.List;

import lombok.Data;

@Data
public class FlightDto {

	private int flightId;

	private String flightNumber, departureAirport, arrivalAirport, departureTime;
	private String arrivalTime, flightDuration;
	private int availableSeats;
	private Integer airplaneId; // 타입이 int일 경우 Integer로 수정 (nullable 가능)
	private String flightName;
	
	// 예약 검색 시 사용되는 필드 (필요에 따라 유지 또는 제거)
    private int passengerCount;
    private SeatClass seatClass;
    private List<SeatDto> seatOptions;      // SeatOption -> SeatDto로 변경
	
}