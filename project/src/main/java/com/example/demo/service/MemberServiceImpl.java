package com.example.demo.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.ReservationMapper;
import com.example.demo.util.MailSend;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;


@Service
@Qualifier("ms2")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private ReservationMapper rmapper;
	@Autowired
	private MailSend Mailsend;
	
	@Override
	public String member() {
		return "/member/member";
	}
	
	@Override
	public String useridCheck(String userid) {
		return mapper.useridCheck(userid);
	}
	
	@Override
	public String memberOk(MemberDto mdto) {
		mapper.memberOk(mdto);
		return "redirect:/login/login";
	}
	
	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String rlist(HttpSession session, HttpServletRequest request, Model model) {
	    String userid = (String) session.getAttribute("userid");

	    // 사용자 로그인이 되어 있지 않으면 로그인 페이지로 리디렉션
	    if (userid == null || userid.isEmpty()) {
	        return "redirect:/login";
	    }

	    // 선택한 날짜 파라미터 가져오기
	    String selectedDate = request.getParameter("selectedDate");

	    // 페이지 번호와 한 페이지에 보여줄 항목 수
	    int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
	    int itemsPerPage = 10;  // 한 페이지에 보여줄 항목 수
	    int offset = (page - 1) * itemsPerPage;  // OFFSET 계산

	    // 유저의 그룹화된 예약 리스트 가져오기 (페이징 적용 및 선택된 날짜 기준으로 필터링)
	    List<Map<String, Object>> rsvClist;
	    if (selectedDate != null && !selectedDate.isEmpty()) {
	        rsvClist = rmapper.getRsvcfacByDate(userid, selectedDate, itemsPerPage, offset); // 날짜에 따른 필터링
	    } else {
	        rsvClist = rmapper.getRsvcfac(userid, itemsPerPage, offset);  // 모든 예약 리스트
	    }

	    // charge 정보 가져오기
	    Map<String, Object> chargeSums = rmapper.getSumOfCharges(userid);

	    // chargeSums에서 BigDecimal을 int로 변환하여 사용
	    BigDecimal totalChargeValue = chargeSums != null && chargeSums.get("totalCharge") != null 
	        ? (BigDecimal) chargeSums.get("totalCharge") 
	        : BigDecimal.ZERO;
	    BigDecimal totalChargePayValue = chargeSums != null && chargeSums.get("totalChargePay") != null 
	        ? (BigDecimal) chargeSums.get("totalChargePay") 
	        : BigDecimal.ZERO;

	    int totalCharge = totalChargeValue.intValue();
	    int totalChargePay = totalChargePayValue.intValue();

	    // 전체 예약 수 가져오기 (수정된 부분)
	    int totalReservations;
	    if (selectedDate != null && !selectedDate.isEmpty()) {
	        totalReservations = rmapper.getTotalRsvcByDate(userid, selectedDate);  // 날짜에 따른 총 예약 수
	    } else {
	        totalReservations = rmapper.getTotalRsvc(userid);  // 모든 예약의 총 수
	    }

	    // 총 페이지 수 계산
	    int totalPages = totalReservations > 0 ? (int) Math.ceil((double) totalReservations / itemsPerPage) : 1;

	    // JSP로 데이터 전달
	    model.addAttribute("rsvClist", rsvClist);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("totalCharge", totalCharge);  // 계산된 totalCharge 전달
	    model.addAttribute("totalChargePay", totalChargePay);  // 계산된 totalChargePay 전달
	    model.addAttribute("selectedDate", selectedDate);  // 선택한 날짜를 모델에 추가

	    return "/reserve/list";  // 예약 리스트 JSP 페이지로 이동
	}
	
	@Override
    public MemberDto getMemberDetails(String userid) {
		return mapper.getMemberById(userid);
    }
	
	@Override
    public String searchUserId(MemberDto mdto) {
        return mapper.useridSearch(mdto);
    }

	@Override
	public String pwdSearch(MemberDto mdto) throws Exception {
	    String userid = mdto.getUserid();
	    String email = mdto.getEmail();
	    String name = mdto.getName();

	    // 사용자가 입력한 정보로 DB에서 사용자 검색
	    String result = mapper.pwdSearch(mdto);
	    
	    if (result != null) {
	        // 임시 비밀번호 생성
	        String temporaryPassword = generateTemporaryPassword();
	        
	        // 이메일로 임시 비밀번호 전송
	        String subject = "임시 비밀번호 발송";
	        String body = "임시 비밀번호는 다음과 같습니다: " + temporaryPassword;
	        Mailsend.setEmail(email, subject, body);
	        
	        // 사용자의 비밀번호를 임시 비밀번호로 업데이트
	        mdto.setPwd(temporaryPassword); // 새로운 비밀번호로 설정
	        mapper.updatePassword(mdto); // DB에 업데이트하는 메서드 호출
	        
	        return "임시 비밀번호가 이메일로 전송되었습니다.";
	    } else {
	        return "사용자 정보를 찾을 수 없습니다.";
	    }
	}

	public String generateTemporaryPassword() {
        // 임시 비밀번호를 생성하기 위한 문자열
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
        
        for (int i = 0; i < 8; i++) { // 8자리 임시 비밀번호
            int index = random.nextInt(chars.length());
            sb.append(chars.charAt(index));
        }
        
        return sb.toString();
    }


}