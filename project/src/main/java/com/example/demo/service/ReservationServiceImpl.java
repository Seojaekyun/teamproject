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
	private FlightMapper fmapper;
	@Autowired
	private SeatMapper smapper;
	@Autowired
	private ReservationMapper rmapper;
	
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
		
		rmapper.insertReservation(rdto);
		// 좌석 상태 업데이트
		rmapper.updateSeatAvailability(flightId, seatNumber, false);
		
		return "Reservation Successful!";
	}
	
	@Override
	public List<SeatDto> getAvailableSeats(int flightId) {
		//System.out.println("SeatMapper 호출됨, flightId: " + flightId);  // 디버깅 로그 추가
		List<SeatDto> availableSeats = smapper.getAvailableSeats(flightId);
		//System.out.println("좌석 정보: " + availableSeats);  // 좌석 정보를 콘솔에 출력
		return availableSeats;
	}
	
	@Override
	public boolean reserveFlight(String userId, int flightId, String seatNumber, String seatClass) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
