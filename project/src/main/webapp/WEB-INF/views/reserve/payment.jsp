<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f8fa;
        margin: 20px;
        color: #333;
    }
    h2 {
        color: #222;
        text-align: center;
        margin-bottom: 20px;
        font-size: 26px;
    }
    .flight-box {
    	width: 1000px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 25px;
        margin: auto;
        margin-bottom: 25px;
        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
    }
    .flight-info {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
    }
    .flight-info div {
        flex: 1;
        text-align: center;
    }
    .flight-header {
        font-size: 20px;
        font-weight: bold;
        color: #333;
    }
    .flight-time, .flight-details {
        font-size: 18px;
        color: #555;
    }
    .flight-details {
        margin-top: 15px;
        padding-top: 10px;
        border-top: 1px solid #ddd;
    }
    .toggle-details {
        cursor: pointer;
        color: #0056b3;
        font-size: 16px;
        text-align: center;
    }
    .toggle-details:hover {
        color: #003d7a;
    }
    button {
        background-color: #0066cc;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 15px;
        display: block;
        margin: 20px auto;
    }
    #btn1 {
    	background-color: #0066cc;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 13px;
    	display: inline-block;
    }
    button:hover {
        background-color: #218838;
    }
    .details-item {
        margin-bottom: 12px;
        font-size: 18px;
    }
    .pnr-box {
        font-size: 18px;
        color: #333;
        margin-top: 20px;
    }
</style>
</head>
<body>
	<h2>예약 세부 사항</h2>
	
	<!-- 가는편 항공편 정보 -->
	<div class="flight-box">
		<c:forEach var="res" items="${rsvClist}">
		<div class="flight-header">PNR (예약 번호): ${res['pnr']}</div>  <!-- res.pnr 대신 res['pnr'] 사용 -->
		<div class="flight-info">
			<div>
				<p class="flight-time">출발 시간: ${res['departureTime']}</p>
				<p class="flight-time">도착 시간: ${res['arrivalTime']}</p>
			</div>
			<div>
				<p class="flight-time">선택한 좌석:
				<c:forEach var="rsi" items="${rsvSeatInfo}">
				${rsi['seat_number']} <!-- 좌석 데이터가 없으면 공백 표시 -->
				</c:forEach>
				</P>
			</div>
		</div>
		<div id="going-details" class="flight-details">
			<div class="details-item">출발지: ${res['departureAirport']}</div>
			<div class="details-item">도착지: ${res['arrivalAirport']}</div> <!-- 출발지, 도착지 추가 -->
			<div class="details-item">비행 시간: ${res['flightDuration']}</div> <!-- 비행 시간 추가 -->
			<div class="details-item">탑승 인원: ${scount}</div> <!-- 탑승 인원 추가 -->
			<div class="details-item">좌석 등급: ${res['seat_class']}</div> <!-- 좌석 등급 추가 -->
			<div class="details-item">총 결제 금액: <fmt:formatNumber value="${res['charge']}" type="number"/>원</div> <!-- 총 결제 금액 추가 -->
		</div>
		<div style="text-align: right;">
			<input type="button" id="btn1" onclick="window.location.href='';" value="결제하기">
		</div>
		<br>
		<hr>
		<button onclick="window.location.href='chargePay';">돌아가기</button>
		</c:forEach>
	</div>
	
</body>
</html>
