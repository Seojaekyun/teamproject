package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.GongjiMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService {
	@Autowired
	private GongjiMapper mapper;
	
	@Override
	public String list(HttpServletRequest request, Model model) {
		
		return "/gongji/list";
	}

}
