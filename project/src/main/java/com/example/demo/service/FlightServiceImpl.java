package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.mapper.FlightMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.AirportsDto;

@Service("fs")
public class FlightServiceImpl implements FlightService {

	@Autowired
	private FlightMapper fmapper;
	
	@Override
	public List<AirportsDto> getAllAirports() { 
		return fmapper.findAllAirports();
	}
	
	public List<FlightDto> getAvailableFlightsByDate(String date) {
		return fmapper.getAvailableFlightsByDate(date);
	}

	/**
     * findFlights 메서드 수정: seatClass와 passengers 추가
     */
    @Override
    public List<FlightDto> findFlights(String departure, String arrival, String departureDate, String arrivalDate, String seatClass, Integer passengers) {
        Map<String, Object> params = new HashMap<>();
        params.put("departure", departure);
        params.put("arrival", arrival);
        params.put("departureDate", departureDate);
        params.put("arrivalDate", arrivalDate);
        params.put("seatClass", seatClass);
        params.put("passengers", passengers);
        
        List<FlightDto> flights = fmapper.findFlightsWithFilters(params);
        
        // availableSeats 계산 및 설정
        for (FlightDto flight : flights) {
            int availableSeats = fmapper.countAvailableSeats(flight.getFlightId());
            flight.setAvailableSeats(availableSeats);
            
            // 좌석 옵션 조회 및 설정
            List<SeatDto> seatOptions = fmapper.getSeatsByFlightIdAndClass(flight.getFlightId(), seatClass);
            flight.setSeatOptions(seatOptions);
        }
        
        return flights;
    }
    
    @Override
    public List<FlightDto> getAvailableFlights() {
        return fmapper.getAllFlights();
    }

    /**
     * 새로 추가된 메서드
     */
    @Override
    public List<SeatDto> getSeatsByFlightId(int flightId) {
        return fmapper.getSeatsByFlightId(flightId);
    }
    
    
    @Override
    public List<SeatDto> getAvailableSeats(int flightId, String seatClass) {
        return fmapper.getAvailableSeatsByFlightAndClass(flightId, seatClass);
    }
	
	
	
	
}