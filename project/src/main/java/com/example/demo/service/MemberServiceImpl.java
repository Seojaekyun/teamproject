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
	public void pwdSearch(MemberDto mdto, Model model) throws Exception {
	    String userid = mdto.getUserid();
	    String email = mdto.getEmail();
	    String name1 = mdto.getName(); 

	    MemberDto resultDto = mapper.pwdSearch(mdto);
	    
	    // resultDto가 null이 아니고 모든 정보가 일치하는지 확인
	    if (resultDto != null && 
	        resultDto.getUserid().equals(userid) && 
	        resultDto.getName().equals(name1) && 
	        resultDto.getEmail().equals(email)) {

	        // DB에서 가져온 이름으로 처리
	        String name = resultDto.getName(); // DB에서 가져온 이름
	        
	        // 임시 비밀번호 생성
	        String temporaryPassword = generateTemporaryPassword();
	        
	        // 이메일로 임시 비밀번호 전송
	        String subject = "임시 비밀번호 발송";
	        String body = "임시 비밀번호는 다음과 같습니다: " + temporaryPassword;
	        Mailsend.setEmail(email, subject, body);
	        
	        // 사용자의 비밀번호를 임시 비밀번호로 업데이트
	        resultDto.setPwd(temporaryPassword); // DB에서 가져온 사용자의 정보에 업데이트
	        mapper.updatePassword(resultDto); // DB에 업데이트하는 메서드 호출

	        // 모델에 추가 (DB에서 가져온 이름을 사용)
	        model.addAttribute("name", name); // DB에서 가져온 이름 추가
	        model.addAttribute("message", name+"님의 임시 비밀번호가 이메일로 전송되었습니다."); // 성공 메시지 추가
	    } else {
	        // 사용자 정보를 찾을 수 없거나 정보가 일치하지 않을 때
	        model.addAttribute("message", "사용자 정보를 찾을 수 없거나 정보가 일치하지 않습니다."); // 실패 메시지 추가
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
	
	@Override
	public String id_verification(HttpSession session, Model model) {
		
		String loggedInUser = (String) session.getAttribute("loggedInUser");
	    model.addAttribute("userid", loggedInUser);
		return "/member/id_verification";
	}

	@Override
	public String id_verification() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean id_delete(String userid, String password) {
		String storedPassword = mapper.getPasswordByUserid(userid);
        return storedPassword.equals(password);
		
	}
	
	@Override
	public String showRecoveryRequestPage(HttpSession session, Model model) {
		
		String loggedInUser = (String) session.getAttribute("loggedInUser");
	    model.addAttribute("userid", loggedInUser);
		return "/member/recovery_request";
	}
	

	public boolean checkPassword(String userid, String password) {
        // DB에서 비밀번호 조회 및 확인
        String storedPassword = mapper.getPasswordByUserid(userid);
        return storedPassword.equals(password);
    }

    public void updateMemberLevel(String userid, int newLevel) {
        mapper.updateMemberLevel(userid, newLevel);
    }


	@Override
    public int getCurrentLevel(String userid) {
        return mapper.getCurrentLevel(userid);  
    }

    @Override
    public void updatePreviousLevel(String userid, int previousLevel) {
        mapper.updatePreviousLevel(userid, previousLevel); 
    }
    
    @Override
    public boolean changePassword(String userid, String oldPwd, String newPwd) {
        String currentPwd = mapper.getPasswordByUserid(userid);
        if (currentPwd.equals(oldPwd)) {
            mapper.updatePasswords(userid, newPwd);
            return true;
        }
        return false;
    }

    @Override
    public void editEmail(String userid, String email) {
        mapper.updateEmail(userid, email);
    }

    @Override
    public void editPhone(String userid, String phone) {
        mapper.updatePhone(userid, phone);
    }



}