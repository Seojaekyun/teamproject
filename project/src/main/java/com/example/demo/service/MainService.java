package com.example.demo.service;

import java.util.List;

import org.springframework.ui.Model;

import com.example.demo.dto.AirportsDto;
import com.example.demo.dto.FlightDto;
import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface MainService {
	public String index(HttpServletRequest request, Model model);
	public String saveMessage(String message, boolean isAdmin);
	public List<String> getMessages();
	public String clearChatMessages();
	public String checkinGuide();
	public String seatGuide();
	public String baggageGuide();
	public String eventList(HttpServletRequest request, Model model);
	public String travel();
	public boolean checkLoginStatus(HttpSession session);
	public String loginOk(MemberDto mdto, HttpSession session,
			HttpServletRequest request, HttpServletResponse response);
	List<FlightDto> getFlightsByPage(int page, Model model);
	List<AirportsDto> getAllAirports();
	List<FlightDto> getFilteredFlights(String departureAirport, String arrivalAirport,
			String selectedDate, Integer page);
	public String reserveInfo();
	public String checkin();
	
	
}