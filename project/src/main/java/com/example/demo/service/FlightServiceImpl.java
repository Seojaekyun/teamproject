package com.example.demo.service;

import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import com.example.demo.dto.FlightDto;
import com.example.demo.dto.FlightTimeDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.mapper.FlightMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dto.AirplanesDto;
import com.example.demo.dto.AirportsDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service("fs")
public class FlightServiceImpl implements FlightService {

	@Autowired
	private FlightMapper fmapper;
	public FlightServiceImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
	
	private static final Logger logger = LoggerFactory.getLogger(FlightServiceImpl.class);
	private final JdbcTemplate jdbcTemplate;

	
	@Override
	public List<AirportsDto> getAllAirports() { 
		return fmapper.findAllAirports();
	}
	
	public List<FlightDto> getAvailableFlightsByDate(String date) {
		return fmapper.getAvailableFlightsByDate(date);
	}
	
	// findFlights 메서드 수정: seatClass와 passengers 추가
	
	@Override
	public List<FlightDto> findFlights(
			String departure, String arrival, String departureDate,
			String arrivalDate, String seatClass, Integer passengers) {
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
	
	@Override
	public List<SeatDto> getSeatsByFlightId(int flightId) {
		return fmapper.getSeatsByFlightId(flightId);
	}
	
	@Override
	public List<SeatDto> getAvailableSeats(int flightId, String seatClass) {
		return fmapper.getAvailableSeatsByFlightAndClass(flightId, seatClass);
	}
	
	// LoginService.java (또는 다른 서비스 클래스)
	@Override
	public MemberDto getMemberInfoByUserId(String userid) {
		return fmapper.getMemberByUserId(userid);  // mapper는 MyBatis 또는 다른 방식의 DAO
	}
	
	@Override
	public FlightDto getgoingFlightInfoByFlightId(String goingFlightId) {
		return fmapper.getFlightByGoingFlightId(goingFlightId);  // mapper는 MyBatis 또는 다른 방식의 DAO
	}
	
	@Override
	public FlightDto getreturnFlightInfoByFlightId(String returnFlightId) {
		return fmapper.getFlightByReturnFlightId(returnFlightId);  // mapper는 MyBatis 또는 다른 방식의 DAO
	}
	
	@Override
	public int addReservation(
			String userId, String flightId, String seatClass,
			String passengerType, String pnr, String sung, String name) {
		ReservationDto reservation = new ReservationDto();
		reservation.setUserid(userId);
		reservation.setFlightId(Integer.parseInt(flightId));
		reservation.setSeatClass(seatClass);
		reservation.setPassengerType(passengerType);
		reservation.setPnr(pnr);
		reservation.setSung(sung);
		reservation.setName(name);
		
		// 예약 저장 후 reservationId를 받아옴
		fmapper.addReservation(reservation);
		int reservationId = reservation.getReservationId();
		
		if (reservationId > 0) {
			return reservationId;
		}
		else {
			throw new RuntimeException("Reservation creation failed.");
		}
	}
	
	@Override
	public int getSeatIdBySeatNumber(String seatNumber) {
		Integer seatId = fmapper.getSeatIdBySeatNumber(seatNumber);
		if (seatId == null || seatId == 0) {
			throw new RuntimeException("Invalid seat number: " + seatNumber);
		}
		
		return seatId;
	}
	
	public void addSeatToReservation(int reservationId, int seatId) {
		fmapper.addSeatToReservation(reservationId, seatId);  // mapper에서 처리
	}
	
	@Override
	public void updateSeatAvailability(int flightId, int seatId) {
		fmapper.updateSeatAvailability(flightId, seatId);
	}
	
	@Override
    public void addFlight(String departureAirport, String arrivalAirport, String departureTime, String arrivalTime, String ftime, int airplaneId) {
        FlightDto flight = new FlightDto();
        flight.setDepartureAirport(departureAirport);
        flight.setArrivalAirport(arrivalAirport);
        flight.setDepartureTime(departureTime);
        flight.setArrivalTime(arrivalTime);
        flight.setAirplaneId(airplaneId);
        flight.setFtime(ftime);

        fmapper.addFlight(flight);
    }

    @Override
    public List<AirplanesDto> getAllAirplanes() {
        return fmapper.findAllAirplanes();
    }

    @Override
    public int[] getFlightTime(String departureAirport, String arrivalAirport) {
        FlightTimeDto flightTimeDto = fmapper.getFlightTime(departureAirport, arrivalAirport);
        if (flightTimeDto != null && flightTimeDto.getFlightTime() != null) {
            LocalTime flightTime = flightTimeDto.getFlightTime();
            int hours = flightTime.getHour();
            int minutes = flightTime.getMinute();
            return new int[]{hours, minutes};
        } else {
            // Handle case where flight time is not found
            return new int[]{0, 0};
        }
    }
	
	@Override
	public void addSeatsForFlight() {
		// 아직 좌석이 없는 flightId를 조회
		Integer flightId = fmapper.getFlightIdForAddingSeats();
		
		if (flightId != null) {
			// flightId로부터 해당 항공기의 capacity 가져오기
			Map<String, Object> flightData = fmapper.getFlightCapacity(flightId);
			
			if (flightData != null) {
				int capacity = (int) flightData.get("capacity");
				
				// 좌석 번호 리스트 생성 (1부터 capacity까지)
				List<Integer> seatNumbers = IntStream.rangeClosed(1, capacity)
						.boxed()
						.collect(Collectors.toList());
				
				// MyBatis에 flightId와 seatNumbers 전달하여 좌석 추가
				Map<String, Object> params = new HashMap<>();
				params.put("flightId", flightId);
				params.put("seatNumbers", seatNumbers);
				
				fmapper.addSeatsForFlight(params);
			}
		}
	}

	@Override
	public String getAirportTimezone(String airportCode) {
		return fmapper.getAirportTimezone(airportCode);
	}

	@Override
    @Transactional(readOnly = true)
    public List<String> getDepartureAirportsByDate(String date) {
        logger.info("검색 날짜: " + date);
        return fmapper.getDepartureAirportsByDate(date);  // MyBatis XML 매퍼 사용
    }
	@Override
	public List<String> getArrivalAirportsByDate(String date) {
	    return fmapper.getArrivalAirportsByDate(date);
	}

	 
}