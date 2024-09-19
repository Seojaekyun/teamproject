package com.example.demo.service;

import java.util.List;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface MainService {
	public String index();
	public String adminI(HttpServletRequest request, Model model);
	public String saveMessage(String message, boolean isAdmin);
	public List<String> getMessages();
	public String clearChatMessages();
	public String checkinGuide();
	public String seatGuide();
	public String baggageGuide();
	public String eventList();
	public String travel();
	
	
}