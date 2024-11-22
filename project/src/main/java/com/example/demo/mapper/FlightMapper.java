package com.example.demo.mapper;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.FlightTimeDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.AirplanesDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Mapper
public interface FlightMapper {
	List<AirportsDto> findAllAirports();
	List<FlightDto> getAvailableFlights();
	List<FlightDto> getFlightsByDate(String date);
	List<FlightDto> getAvailableFlightsByDate(String date);
	List<FlightDto> findFlights(
			@Param("departure") String departure,
			@Param("arrival") String arrival,
			@Param("departureDate") String departureDate,
			@Param("arrivalDate") String arrivalDate);
	List<FlightDto> findFlightsWithFilters(Map<String, Object> params);
	int countAvailableSeats(int flightId);
	List<SeatDto> getSeatsByFlightIdAndClass(
			@Param("flightId") int flightId,
			@Param("seatClass") String seatClass);
	List<SeatDto> getSeatsByFlightId(@Param("flightId") int flightId);
	List<FlightDto> getAllFlights();
	List<FlightDto> getFlightsWithPagination(
			@Param("limit") int limit,
			@Param("offset") int offset);
	int getTotalFlightsCount();
	List<FlightDto> getAllFlights(String currentDate);
	List<FlightDto> getDepartureFlights();
	List<FlightDto> getArrivalFlights();
	List<FlightDto> getFlightsByDate(@Param("date") LocalDate date);
	List<SeatDto> getAvailableSeatsByFlightAndClass(
			@Param("flightId") int flightId,
			@Param("seatClass") String seatClass);
	MemberDto getMemberByUserId(String userid);
	FlightDto getFlightByGoingFlightId(String goingFlightId);
	FlightDto getFlightByReturnFlightId(String goingFlightId);
	public void addReservation(ReservationDto reservation);
	int getSeatIdBySeatNumber(String seatNumber);
	void addSeatToReservation(
			@Param("reservationId") int reservationId,
			@Param("seatId") int seatId);
	void updateSeatAvailability(
			@Param("flightId") int flightId,
			@Param("seatId") int seatId);
	List<Map<String, Object>> getTotalSeatsByFlightId();
	void addFlight(FlightDto flight);
	List<AirplanesDto> findAllAirplanes();
	void addSeatsForFlight(Map<String, Object> params);
	Map<String, Object> getFlightCapacity(int flightId);
	Integer getFlightIdForAddingSeats();
	FlightTimeDto getFlightTime(@Param("a") String a, @Param("b") String b);
	String getAirportTimezone(@Param("airportCode") String airportCode);
	List<FlightDto> getFlights(int start, int itemsPerPage);
	int countFlights();
	List<FlightDto> getFlightsByFilters(String departureAirport, String arrivalAirport,
			String selectedDate, int start,	int itemsPerPage);
	int countFlightsByFilters(String departureAirport, String arrivalAirport, String selectedDate);
	List<AirportsDto> getAllAirports();
	List<FlightDto> getFilteredFlights(String departureAirport, String arrivalAirport,
			String selectedDate, int itemsPerPage, int offset);
	List<String> getDepartureAirportsByDate(String date);
	List<String> getArrivalAirportsByDepartureAndDate(@Param("departure") String departure, @Param("date") String date);

	
}