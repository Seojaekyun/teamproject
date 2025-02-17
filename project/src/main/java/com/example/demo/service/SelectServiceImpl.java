package com.example.demo.service;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.SelectDto;
import com.example.demo.mapper.SelectMapper;

@Service
public class SelectServiceImpl implements SelectService {
	@Autowired
	private SelectMapper selectMapper;
	
	@Override
	public List<SelectDto> getRsvDetails(String pnr, String sung, String name, String date) {
		// 쿼리 실행 전 파라미터 로깅
		System.out.println("쿼리 파라미터 - PNR: " + pnr + ", 성: " + sung + ", 이름: " + name + ", 날짜: " + date);

		// reservations 정보 가져오기 (좌석번호 포함)
		List<Map<String, Object>> rsvInfos = selectMapper.getRsvInfo(pnr, sung, name, date);
		
		// 쿼리 결과 로깅
		System.out.println("쿼리 결과 - rsvInfos: " + rsvInfos);

		// reservationInfos가 null이거나 비어 있는 경우 null 반환
		if (rsvInfos == null || rsvInfos.isEmpty()) {
			System.out.println("예약 정보가 없습니다.");
			return null;
		}

		// SelectDto 리스트 생성
		List<SelectDto> rsvList = new ArrayList<>();
		
		for (Map<String, Object> rsvInfo : rsvInfos) {
			int flightId = (Integer) rsvInfo.get("flight_id");
			
			// airports 정보 가져오기
			Map<String, Object> airportInfo = selectMapper.getAirportInfo(flightId);
			System.out.println("airportInfo: " + airportInfo);

			// DTO에 데이터를 담아서 리스트에 추가
			SelectDto sdto = new SelectDto();
			sdto.setPnr(pnr);
			sdto.setSeatClass((String) rsvInfo.get("seat_class"));
			sdto.setSeatNumber((String) rsvInfo.get("seat_number")); // seatNumber 가져오기
			sdto.setFlightId(flightId);  // int 값으로 처리
			sdto.setCharge_pay((Integer) rsvInfo.get("charge_pay"));
			
			// airplane_id를 int로 처리
			sdto.setAirplaneId((Integer) rsvInfo.get("airplane_id"));
			
			// Timestamp를 DTO에 바로 할당
			Timestamp departureTime = (Timestamp) rsvInfo.get("departure_time");
			Timestamp arrivalTime = (Timestamp) rsvInfo.get("arrival_time");
			Time flightDuration =(Time) rsvInfo.get("flight_duration");
			
			// departureTime과 arrivalTime이 null이 아닌 경우에만 설정
			if (departureTime != null) {
				sdto.setDepartureTime(departureTime.toString());
			}
			
			if (arrivalTime != null) {
				sdto.setArrivalTime(arrivalTime.toString());
			}
			
			if (flightDuration != null) {
				sdto.setFlightDuration(flightDuration.toString());
			}

			// 기타 항목 설정
			sdto.setDepartureAirportName((String) airportInfo.get("departure_airport_name"));
			sdto.setDepartureCity((String) airportInfo.get("departure_city"));
			sdto.setArrivalAirportName((String) airportInfo.get("arrival_airport_name"));
			sdto.setArrivalCity((String) airportInfo.get("arrival_city"));
			sdto.setDepartureAirport((String) rsvInfo.get("departure_airport"));
			sdto.setArrivalAirport((String) rsvInfo.get("arrival_airport"));
			sdto.setFlightName((String) rsvInfo.get("flight_name"));

			// DTO 로깅
			System.out.println("생성된 DTO: " + sdto);

			// 리스트에 추가
			rsvList.add(sdto);
		}

		// 최종 리스트 로깅
		System.out.println("최종 예약 리스트: " + rsvList);
		
		return rsvList;
	}
}
