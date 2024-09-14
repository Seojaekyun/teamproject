package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.example.demo.dto.FlightDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.mapper.FlightMapper;
import com.example.demo.mapper.ReservationMapper;
import com.example.demo.mapper.SeatMapper;

import java.util.ArrayList;
import java.util.List;

@Service
@Qualifier("rs")
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private FlightMapper flightMapper;
    @Autowired
    private SeatMapper seatMapper;
    @Autowired
    private ReservationMapper reservationMapper;

    @Override
    public List<FlightDto> getAllFlights() {
        // 항공편 목록 조회
        return flightMapper.getAllFlights();
    }

    @Override
    public String reserveFlight(int customerId, int flightId, String seatNumber, String seatClass, String customerName, String customerEmail) {
        // 예약 처리 로직 추가
        ReservationDto rdto = new ReservationDto();
        rdto.setCustomerId(customerId);
        rdto.setFlightId(flightId);
        rdto.setSeatNumber(seatNumber);
        rdto.setSeatClass(seatClass);
        rdto.setCustomerName(customerName);
        rdto.setCustomerEmail(customerEmail);
        
        reservationMapper.insertReservation(rdto);
        
        // 좌석 상태 업데이트
        reservationMapper.updateSeatAvailability(flightId, seatNumber, false);
        
        return "Reservation Successful!";
    }
    
    @Override
    public ArrayList<SeatDto> getAvailableSeats(int flightId) {
        ArrayList<SeatDto> availableSeats = seatMapper.getAvailableSeats(flightId);
        System.out.println("Available seats from SeatMapper for flightId " + flightId + ": " + availableSeats);
        return availableSeats;
    }




}
