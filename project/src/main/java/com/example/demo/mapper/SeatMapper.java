package com.example.demo.mapper;

import com.example.demo.dto.SeatDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SeatMapper {
    List<SeatDto> getAvailableSeats(@Param("flightId") int flightId);
}
