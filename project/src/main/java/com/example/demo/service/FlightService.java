package com.example.demo.service;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.SeatDto;
import java.util.List;

import com.example.demo.dto.AirportsDto;

public interface FlightService {
	List<AirportsDto> getAllAirports();
	List<FlightDto> getAvailableFlightsByDate(String date);
	List<FlightDto> findFlights(
			String departure, String arrival, String departureDate,
			String arrivalDate, String seatClass, Integer passengers);
	List<FlightDto> getAvailableFlights();
	List<SeatDto> getSeatsByFlightId(int flightId);
	List<SeatDto> getAvailableSeats(int flightId, String seatClass);
	MemberDto getMemberInfoByUserId(String userid);
	FlightDto getgoingFlightInfoByFlightId(String goingFlightId);
	FlightDto getreturnFlightInfoByFlightId(String returnFlightId);
	int addReservation(
			String userId, String flightId, String seatClass,
			String passengerType, String pnr, String sung, String name);
	int getSeatIdBySeatNumber(String seatNumber);
	void addSeatToReservation(int reservationId, int seatId);
	void updateSeatAvailability(int flightId, int seatId);
	
	
}