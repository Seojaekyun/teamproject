<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
	.reservation-info {
		margin-top: 30px;
	}
	.flight-info, .passenger-info, .price {
		margin-bottom: 30px;
		border: 1px solid #ddd;
		padding: 20px;
		border-radius: 5px;
	}
	.buttons {
		margin-top: 20px;
	}
</style>

</head>
<body>
	<div class="container">
		<h2 class="mt-4">예약 정보 확인</h2>
		<!-- 가는편 비행기 정보 -->
		<div class="flight-info">
			<h4>가는편 비행기 정보</h4>
			<table class="table table-bordered">
				<tr>
					<th>Flight ID</th>
					<td>${selectedGoingFlightId}</td>
				</tr>
				<tr>
					<th>항공편명</th>
					<td>${goingFlightName}</td>
				</tr>
				<tr>
					<th>출발지</th>
					<td>${goingFlightDeparture}</td>
				</tr>
				<tr>
					<th>도착지</th>
					<td>${goingFlightArrival}</td>
				</tr>
				<tr>
					<th>출발 시간</th>
					<td>${goingDepartureTime}</td>
				</tr>
				<tr>
					<th>도착 시간</th>
					<td>${goingArrivalTime}</td>
				</tr>
				<tr>
					<th>비행 시간</th>
					<td>${goingFlightDruation}</td>
				</tr>
				<tr>
					<th>선택한 좌석</th>
					<td>${goingSeats}</td>
				</tr>
				<tr>
					<th>좌석등급</th>
					<td>${seatClass}</td>
				</tr>
				<tr>
					<th>탑승객</th>
					<td>${passengers}</td>
				</tr>
				<tr>
					<th>금액</th>
					<td><fmt:formatNumber value="${goingUnitPrice}" type="number"/>원</td>
				</tr>
			</table>
		</div>
		
		<!-- 오는편 비행기 정보 -->
		<div class="flight-info">
			<h4>오는편 비행기 정보</h4>
				<table class="table table-bordered">
				<tr>
					<th>Flight ID</th>
					<td>${selectedGoingFlightId}</td>
				</tr>
				<tr>
					<th>항공편명</th>
					<td>${goingFlightName}</td>
				</tr>
				<tr>
					<th>출발지</th>
					<td>${goingFlightDeparture}</td>
				</tr>
				<tr>
					<th>도착지</th>
					<td>${goingFlightArrival}</td>
				</tr>
				<tr>
					<th>출발 시간</th>
					<td>${goingDepartureTime}</td>
				</tr>
				<tr>
					<th>도착 시간</th>
					<td>${goingArrivalTime}</td>
				</tr>
				<tr>
					<th>비행 시간</th>
					<td>${goingFlightDruation}</td>
				</tr>
				<tr>
					<th>선택한 좌석</th>
					<td>${goingSeats}</td>
				</tr>
				<tr>
					<th>좌석등급</th>
					<td>${seatClass}</td>
				</tr>
				<tr>
					<th>탑승객</th>
					<td>${passengers}</td>
				</tr>
				<tr>
					<th>금액</th>
					<td><fmt:formatNumber value="${returnUnitPrice}" type="number"/>원</td>
				</tr>
			</table>
		</div>
		
		<!-- 예약자 정보 -->
		<div class="passenger-info">
			<h4>예약자 정보</h4>
			<table class="table table-bordered">
				<tr>
					<th>이름</th>
					<td>${userName}</td>
				</tr>
				<tr>
					<th>성</th>
					<td>${userSung}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userLname}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${userEmail}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${userPhone}</td>
				</tr>
			</table>
		</div>
		<div class="price">
			<table class="table table-bordered">
				<tr>
					<th>총액</th>
					<td><fmt:formatNumber value="${totalPrice}" type="number"/>원</td>
				</tr>
			</table>
		</div>
		<!-- 버튼 -->
		<div class="buttons">
			<form action="${pageContext.request.contextPath}/flights/confirmBooking" method="post" style="display:inline;">
				<input type="hidden" name="goingFlightId" value="${selectedGoingFlightId}">
				<input type="hidden" name="returnFlightId" value="${selectedReturnFlightId}">
				<input type="hidden" name="goingSelectedSeats" value="${goingSeats}">
				<input type="hidden" name="returnSelectedSeats" value="${returnSeats}">
				<input type="hidden" name="seatClass" value="${seatClass}">
				<input type="hidden" name="passengers" value="${passengers}">
				<input type="hidden" name="goingFlightDeparture" value="${goingFlightDeparture}">
				<input type="hidden" name="goingFlightArrival" value="${goingFlightArrival}">
				<input type="hidden" name="goingDepartureTime" value="${goingDepartureTime}">
				<input type="hidden" name="goingArrivalTime" value="${goingArrivalTime}">
				<input type="hidden" name="goingFlightDuration" value="${goingFlightDuration}">
				<input type="hidden" name="returnFlightDeparture" value="${returnFlightDeparture}">
				<input type="hidden" name="returnFlightArrival" value="${returnFlightArrival}">
				<input type="hidden" name="returnDepartureTime" value="${returnDepartureTime}">
				<input type="hidden" name="returnArrivalTime" value="${returnArrivalTime}">
				<input type="hidden" name="returnFlightDuration" value="${returnFlightDuration}">
				<input type="hidden" name="goingPrice" value="${goingUnitPrice}">
				<input type="hidden" name="returnPrice" value="${returnUnitPrice}">
				<input type="hidden" name="totalPrice" value="${totalPrice}">
				<button type="submit" class="btn btn-success">예약하기</button>
			</form>
			<button class="btn btn-secondary" onclick="history.back()">이전으로</button>
		</div>
	</div>
<script>
	function checkFormSubmission() {
		const goingSeats = document.querySelector('input[name="goingSelectedSeats"]').value;
		const returnSeats = document.querySelector('input[name="returnSelectedSeats"]').value;
		
		console.log("Form 제출 확인 - 가는편 좌석: " + goingSeats);
		console.log("Form 제출 확인 - 오는편 좌석: " + returnSeats);
	}
	
	document.querySelector('form').addEventListener('submit', checkFormSubmission);
</script>
</body>
</html>