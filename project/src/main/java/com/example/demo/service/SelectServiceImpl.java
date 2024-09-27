package com.example.demo.service;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
    public List<SelectDto> getReservationDetails(String pnr, String sung, String name) {
        // reservations 정보 가져오기
        List<Map<String, Object>> reservationInfos = selectMapper.getReservationInfo(pnr, sung, name);

        // reservationInfos가 null이거나 비어 있는 경우 처리
        if (reservationInfos == null || reservationInfos.isEmpty()) {
            throw new RuntimeException("예약 정보가 없습니다. PNR: " + pnr + ", 성: " + sung + ", 이름: " + name);
        }

        // SelectDto 리스트 생성
        List<SelectDto> reservationList = new ArrayList<>();

        for (Map<String, Object> reservationInfo : reservationInfos) {
            int flightId = (Integer) reservationInfo.get("flight_id");
            int seatId = (Integer) reservationInfo.get("seat_id");

            // flights 정보 가져오기
            Map<String, Object> flightInfo = selectMapper.getFlightInfo(pnr, sung, name);

            // airports 정보 가져오기
            Map<String, Object> airportInfo = selectMapper.getAirportInfo(flightId);

            // DTO에 데이터를 담아서 리스트에 추가
            SelectDto sdto = new SelectDto();
            sdto.setPnr(pnr);
            sdto.setSeatClass((String) reservationInfo.get("seat_class"));
            sdto.setSeatId(seatId);
            sdto.setFlightId(flightId);  // int 값으로 처리

            // airplane_id를 int로 처리
            sdto.setAirplaneId((Integer) flightInfo.get("airplane_id"));

            // Timestamp를 DTO에 바로 할당
            Timestamp departureTime = (Timestamp) flightInfo.get("departure_time");
            Timestamp arrivalTime = (Timestamp) flightInfo.get("arrival_time");

            // departureTime과 arrivalTime이 null이 아닌 경우에만 설정
            if (departureTime != null) {
                sdto.setDepartureTime(departureTime.toString());
            }

            if (arrivalTime != null) {
                sdto.setArrivalTime(arrivalTime.toString());
            }
            
            // 기타 항목 설정
            sdto.setDepartureAirportName((String) airportInfo.get("departure_airport_name"));
            sdto.setDepartureCity((String) airportInfo.get("departure_city"));
            sdto.setArrivalAirportName((String) airportInfo.get("arrival_airport_name"));
            sdto.setArrivalCity((String) airportInfo.get("arrival_city"));
            sdto.setDepartureAirport((String) flightInfo.get("departure_airport"));
            sdto.setArrivalAirport((String) flightInfo.get("arrival_airport"));
            sdto.setFlightName((String) flightInfo.get("flight_name"));

            reservationList.add(sdto);
        }

        return reservationList;
    }

}
