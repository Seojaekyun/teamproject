package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.GongjiDto;
import com.example.demo.mapper.GongjiMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	private GongjiMapper mapper;

	@Override
	public String adReserve() {
		// TODO Auto-generated method stub
		return null;
	}

	

}
