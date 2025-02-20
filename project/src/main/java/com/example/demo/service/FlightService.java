package com.example.demo.service;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.SeatDto;
import java.util.List;

import com.example.demo.dto.AirplanesDto;
import com.example.demo.dto.AirportsDto;

public interface FlightService {
	List<AirportsDto> getAllAirports();
	List<FlightDto> getAvailableFlightsByDate(String date);
	List<FlightDto> findFlights(String departure, String arrival, String departureDate,
			String arrivalDate, String seatClass, Integer passengers);
	List<FlightDto> getAvailableFlights();
	List<SeatDto> getSeatsByFlightId(int flightId);
	List<SeatDto> getAvailableSeats(int flightId, String seatClass);
	MemberDto getMemberInfoByUserId(String userid);
	FlightDto getgoingFlightInfoByFlightId(String goingFlightId);
	FlightDto getreturnFlightInfoByFlightId(String returnFlightId);
	int addReservation(
			String userId, String flightId, String seatClass,
			String passengerType, String pnr, String sung, String name, String goingPrice);
	int getSeatIdBySeatNumber(String seatNumber);
	void addSeatToReservation(int reservationId, int seatId);
	void updateSeatAvailability(int flightId, int seatId, int goingReservationId);
	void addFlight(String departureAirport, String arrivalAirport, String departureTime,
			String arrivalTime, String ftime, int airplaneId, int unitPrice);
	List<AirplanesDto> getAllAirplanes();
	void addSeatsForFlight();
	int[] getFlightTime(String departureAirport, String arrivalAirport);
	String getAirportTimezone(String departureAirport);
	List<String> getDepartureAirportsByDate(String date);
	List<String> getArrivalAirportsByDepartureAndDate(String departure, String date);
	SeatDto getgoingFlightPrice(String goingSelectedSeats);
	
	
}