package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

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
	List<Map<String, Object>> getRsvcfac(String userid, int itemsPerPage, int offset);
	int getTotalRsvc(String userid);
	Map<String, Object> getSumOfCharges(String userid);
	List<Map<String, Object>> getRsvcfacByDate(String userid, String selectedDate, int itemsPerPage, int offset);
	int getTotalRsvcByDate(String userid, String selectedDate);
	
	
}