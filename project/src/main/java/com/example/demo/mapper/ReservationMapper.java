package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.ReservationDto;

@Mapper
public interface ReservationMapper {
	void insertReservation(ReservationDto rdto);
    void updateSeatAvailability(@Param("flightId") int flightId,
    		@Param("seatNumber") String seatNumber,
    		@Param("isAvailable") boolean isAvailable); // 좌석 상태 업데이트
    
    
}