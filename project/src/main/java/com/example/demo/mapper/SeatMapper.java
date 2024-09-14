package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.SeatDto;

@Mapper
public interface SeatMapper {
    @Select("SELECT seat_id, seat_number, is_available FROM Seats WHERE flight_id = #{flightId} AND is_available = 1")
    @Results({
        @Result(property = "seatId", column = "seat_id"),
        @Result(property = "seatNumber", column = "seat_number"),
        @Result(property = "isAvailable", column = "is_available")
    })
    ArrayList<SeatDto> getAvailableSeats(@Param("flightId") int flightId);
}


