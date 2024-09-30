package com.example.demo.mapper;



import com.example.demo.dto.FlightDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.SeatDto;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.example.demo.dto.AirportsDto;

@Mapper
public interface FlightMapper {

	List<AirportsDto> findAllAirports();
	List<FlightDto> getAvailableFlights();
	List<FlightDto> getFlightsByDate(String date);
	List<FlightDto> getAvailableFlightsByDate(String date);
	
	
	
	/**
     * 기존 findFlights 메서드 유지
     */
    List<FlightDto> findFlights(
        @Param("departure") String departure,
        @Param("arrival") String arrival,
        @Param("departureDate") String departureDate,
        @Param("arrivalDate") String arrivalDate
    );

    /**
     * 새로운 findFlightsWithFilters 메서드 추가
     */
    List<FlightDto> findFlightsWithFilters(Map<String, Object> params);
    
    /**
     * 항공편의 가용 좌석 수를 계산
     */
    
    int countAvailableSeats(int flightId);

    /**
     * 특정 항공편과 좌석 등급에 따른 좌석 정보 조회
     */
    List<SeatDto> getSeatsByFlightIdAndClass(@Param("flightId") int flightId, @Param("seatClass") String seatClass);
    
    /**
     * 새로 추가된 getSeatsByFlightId 메서드
     */
    List<SeatDto> getSeatsByFlightId(@Param("flightId") int flightId);

	
	List<FlightDto> getAllFlights();
    List<FlightDto> getFlightsWithPagination(@Param("limit") int limit, @Param("offset") int offset);
	int getTotalFlightsCount();
	List<FlightDto> getAllFlights(String currentDate);
	List<FlightDto> getDepartureFlights();
	List<FlightDto> getArrivalFlights();
	List<FlightDto> getFlightsByDate(@Param("date") LocalDate date);
	
	List<SeatDto> getAvailableSeatsByFlightAndClass(@Param("flightId") int flightId, @Param("seatClass") String seatClass);
	 
	 
	MemberDto getMemberByUserId(String userid);
	
	FlightDto getFlightByGoingFlightId(String goingFlightId);
	
	FlightDto getFlightByReturnFlightId(String goingFlightId);
	
	
	public void addReservation(ReservationDto reservation);

	
	
	int getSeatIdBySeatNumber(String seatNumber);
	
	
	
	
	    
	void addSeatToReservation(@Param("reservationId") int reservationId, @Param("seatId") int seatId);
	    void updateSeatAvailability(@Param("flightId") int flightId, @Param("seatId") int seatId);
	




}

