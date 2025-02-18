package com.example.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.ReservationDto;

@Mapper
public interface ReservationMapper {
	void insertReservation(ReservationDto rdto);
	void updateSeatAvailability(
			@Param("flightId") int flightId,
			@Param("seatNumber") String seatNumber,
			@Param("isAvailable") boolean isAvailable);
	List<ReservationDto> getRsvanow();
	List<ReservationDto> getRsvByDate(String selectedDate);
	List<ReservationDto> getRsvdetail(
			String flightName, String departureTime, int start, int itemsPerPage);
	List<ReservationDto> getRsvdfn(String flightName, String departureTime);
	int getTotalReservations(String flightName, String departureTime);
	ReservationDto getMyrsv(String string);
	List<Map<String, Object>> getRsvcfac(String userid, int itemsPerPage, int offset);
	List<Map<String, Object>> getRsvcPay(String pnr);
	List<Map<String, Object>> getRsvcfacByDate(
			String userid, String selectedDate, int itemsPerPage, int offset);
	// getTotalRsvc에서 여러 결과를 반환할 수 있다면 selectList()로 수정
	int getTotalRsvc(String userid); // 여러 결과 처리 가능
	// 만약 하나의 결과만 반환하려면 기존대로 사용하되 쿼리를 수정
	int getTotalRsvcByDate(String userid, String selectedDate);
	Map<String, Object> getSumOfCharges(String userid);
	List<ReservationDto> getRsvUserid(String userId);
	List<Map<String, Object>> getRsvChart();
	List<Map<String, Object>> getScrsvid(List<Integer> reservationIds);
	List<Map<String, Object>> getAvailableSeatCountByFlightId();
	int getSeatCountByReservationId(int reservationId);
	List<String> getMonthlyLabels();
	List<Integer> getMonthlyReservations();
	List<String> getFlightLabels();
	List<Integer> getFlightReservations();
	List<String> getSeatClassLabels();
	List<Integer> getSeatClassReservations();
	List<Map<String, Object>> getReservationSeatInfo(String pnr);
	void chargeOk(ReservationDto rdto);
	void payOk(ReservationDto rdto);
	void payReturn(ReservationDto rdto);
	void cancelOpper(ReservationDto rdto);
	Integer getState(int reservationId);
	void cancelConfirm(String rid);
	void payReturn(String rid);
	
	
	
}