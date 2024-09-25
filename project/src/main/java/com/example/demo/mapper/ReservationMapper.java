package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.ReservationDto;

@Mapper
public interface ReservationMapper {
	void insertReservation(ReservationDto rdto);
	void updateSeatAvailability(@Param("flightId") int flightId,
			@Param("seatNumber") String seatNumber,
			@Param("isAvailable") boolean isAvailable); // 좌석 상태 업데이트
	List<ReservationDto> getRsvanow();
	List<ReservationDto> getRsvByDate(String selectedDate);
	List<ReservationDto> getRsvdetail(String flightName, String departureTime, int start, int itemsPerPage);
	List<ReservationDto> getRsvdfn(String flightName, String departureTime);
	int getTotalReservations(String flightName, String departureTime);
	ReservationDto getMyrsv(String string);
	List<ReservationDto> getReservationsByUserId(String userid);
	
	
}