package kr.co.llt.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RreservController {
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("/reserv/inquiryList")
	public String inquiryList() {
		return "/reserv/inquiryList";
	}

}