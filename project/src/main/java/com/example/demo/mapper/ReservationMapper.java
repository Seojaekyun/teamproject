package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import com.example.demo.dto.ReservationDto;

@Mapper
public interface ReservationMapper {
    @Insert("INSERT INTO Reservations (customer_id, flight_id, seat_number, seat_class, reservation_date, customer_name, customer_email) VALUES (#{customerId}, #{flightId}, #{seatNumber}, #{seatClass}, NOW(), #{customerName}, #{customerEmail})")
    void insertReservation(ReservationDto reservation);

    @Update("UPDATE Seats SET is_available = #{isAvailable} WHERE flight_id = #{flightId} AND seat_number = #{seatNumber}")
    void updateSeatAvailability(@Param("flightId") int flightId, @Param("seatNumber") String seatNumber, @Param("isAvailable") boolean isAvailable); // 좌석 상태 업데이트
}
