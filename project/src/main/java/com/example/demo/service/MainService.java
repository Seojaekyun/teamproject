package com.example.demo.service;

import java.util.List;

public interface MainService {

	public String index();
	public String adminI();
	public void saveMessage(String message, boolean isAdmin);
	public List<String> getMessages();
	public void clearChatMessages();
}
