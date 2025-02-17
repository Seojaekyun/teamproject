<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
	body {
		background-color: #f7f7f7;
		font-family: Arial, sans-serif;
	}
	.container {
		margin-top: 20px;
		max-width: 800px; /* 창 폭 제한 */
	}
	.airplane {
		margin-top: 30px;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	.seat-container {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.seatf {
		width: 40px; /* 크기 줄임 */
		height: 50px; /* 크기 줄임 */
		background-color: #00aaff; /* 하늘색 */
		color: white;
		font-size: 12px; /* 글씨 크기 줄임 */
		font-weight: bold;
		text-align: center;
		line-height: 60px;
		cursor: pointer;
		border-radius: 8px;
		margin: 4px;
		transition: transform 0.3s, box-shadow 0.3s;
	}
	.seatb {
		width: 40px; /* 크기 줄임 */
		height: 50px; /* 크기 줄임 */
		background-color: #00aaff;
		color: white;
		font-size: 12px; /* 글씨 크기 줄임 */
		font-weight: bold;
		text-align: center;
		line-height: 55px;
		cursor: pointer;
		border-radius: 8px;
		margin: 4px;
		transition: transform 0.3s, box-shadow 0.3s;
	}
	.seat {
		width: 30px; /* 크기 줄임 */
		height: 40px; /* 크기 줄임 */
		background-color: #00aaff;
		color: white;
		font-size: 12px; /* 글씨 크기 줄임 */
		font-weight: bold;
		text-align: center;
		line-height: 45px;
		cursor: pointer;
		border-radius: 8px;
		margin: 4px;
		transition: transform 0.3s, box-shadow 0.3s;
	}
	.seat-number {
		font-size: 10px;
		font-weight: normal;
	}
	.available {
		opacity: 1;
	}
	.unavailable {
		opacity: 0.5;
		cursor: not-allowed;
	}
	.selected {
		box-shadow: 0px 0px 15px 5px #90EE90; /* 선택된 좌석에 연두색 그림자 추가 */
		transform: scale(1.1); /* 선택된 좌석을 약간 키움 */
	}
	.aisle {
		width: 30px;
		height: 100%;
		background-color: transparent;
	}
	.row {
		display: flex;
		gap: 8px;
		justify-content: center;
		margin-bottom: 12px;
	}
	input [type="button"] {
		width: 100px;
		padding: 12px;
		font-size: 16px;
		font-weight: bold;
		background-color: #00aaff;
		border: none;
		border-radius: 8px;
		transition: background-color 0.3s;
		dsiplay: inline-block;
		align: right;
	}
	.btn-primary:hover {
		background-color: #0077cc;
	}
	.seat-container div {
		transition: transform 0.3s, background-color 0.3s;
	}
	.seat-container div:hover {
		transform: scale(1.1);
		background-color: #0099cc; /* 좌석 호버 시 색상 */
	}
</style>
<script>
	var maxSelectableSeats = ${passengers};  // 탑승객 수
	var selectedSeats = [];
	
	function selectSeat(element) {
		var isAvailable = element.getAttribute('data-available') === 'true';
		if (!isAvailable) {
			return; // 선택 불가능한 좌석
		}
		
		var seatNumber = element.getAttribute('data-seat-number');
		var index = selectedSeats.indexOf(seatNumber);
		
		if (index === -1) {
		    // 좌석 선택 시 제한 확인
			if (selectedSeats.length >= maxSelectableSeats) {
				alert('최대 ' + maxSelectableSeats + '개의 좌석만 선택할 수 있습니다.');
				return;
			}
			// 좌석 선택
			selectedSeats.push(seatNumber);
			element.classList.add('selected'); // 선택된 좌석에 'selected' 클래스 추가
		}
		else {
			// 좌석 선택 해제
			selectedSeats.splice(index, 1);
			element.classList.remove('selected'); // 선택 해제된 좌석에서 'selected' 클래스 제거
		}
		
		// 선택한 좌석 표시 업데이트
		document.getElementById('selectedSeatsDisplay').innerText = selectedSeats.join(', ');
	}
	
	function confirmSelection() {
		if (selectedSeats.length === 0) {
			alert('최소 한 개의 좌석을 선택해야 합니다.');
			return;
		}
		
		if (selectedSeats.length !== maxSelectableSeats) {
			alert('탑승객 수에 맞게 좌석을 선택해 주세요.');
			return;
		}
		
		// 선택한 좌석 정보를 서버로 전송
		var form = document.createElement('form');
		form.method = 'post';
		form.action = '${pageContext.request.contextPath}/flights/confirmSeats';
		
		// 필요한 데이터 추가
		var flightIdInput = document.createElement('input');
		flightIdInput.type = 'hidden';
		flightIdInput.name = 'flightId';
		flightIdInput.value = '${flightId}';
		form.appendChild(flightIdInput);
		
		var seatClassInput = document.createElement('input');
		seatClassInput.type = 'hidden';
		seatClassInput.name = 'seatClass';
		seatClassInput.value = '${seatClass}';
		form.appendChild(seatClassInput);
		
		var passengersInput = document.createElement('input');
		passengersInput.type = 'hidden';
		passengersInput.name = 'passengers';
		passengersInput.value = '${passengers}';
		form.appendChild(passengersInput);
		
		var selectedSeatsInput = document.createElement('input');
		selectedSeatsInput.type = 'hidden';
		selectedSeatsInput.name = 'selectedSeats';
		selectedSeatsInput.value = selectedSeats.join(',');  // 선택한 좌석 목록을 콤마로 구분
		form.appendChild(selectedSeatsInput);
		
		document.body.appendChild(form);
		
		window.opener.updateSelectedSeats(selectedSeats);  // 부모 창에 선택 좌석 정보 전달
		window.close();  // 창 닫기
	}
</script>
</head>
<body>
	<div class="container">
		<h2 class="mt-4">비행기 좌석 선택 - ${seatClass}</h2>
		<p><b>비행기 ID:&nbsp;</b> ${flightId} &nbsp;&nbsp;<b>탑승객 수:&nbsp;</b> ${passengers}명</p>
		<!-- 선택한 좌석 표시 -->
		<div class="mt-4">
			<h4>선택한 좌석:&nbsp; <span id="selectedSeatsDisplay"></span></h4> 
			<!-- 선택 완료 버튼 -->
			<input type="button" class="btn btn-primary mt-4" onclick="confirmSelection()" value="선택 완료">
		</div>
		<!-- 비행기 좌석 배치 -->
		<div id="seatsContainer" class="airplane">
			<c:set var="currentRow" value="" />
			<c:forEach var="seat" items="${seats}" varStatus="status">
			<c:set var="seatRow" value="${seat.seatNumber.substring(0, seat.seatNumber.length() - 1)}" />
			<c:if test="${status.first || seatRow != currentRow}">
			<c:set var="currentRow" value="${seatRow}" />
			<div class="row">
			</c:if>
				<c:choose>
				<c:when test="${seatRow >= 1 && seatRow <= 10}">
				<div class="seat-container">
				    <div class="seatf ${seat.available ? 'available' : 'unavailable'}" data-seat-number="${seat.seatNumber}" data-available="${seat.available}" onclick="selectSeat(this)">
				    	${seat.seatNumber}
				    </div>
				</div>
				<div class="aisle"></div>
				</c:when>
				<c:when test="${seatRow >= 11 && seatRow <= 30}">
				<div class="seat-container">
				    <div class="seatb ${seat.available ? 'available' : 'unavailable'}" data-seat-number="${seat.seatNumber}" data-available="${seat.available}" onclick="selectSeat(this)">
						${seat.seatNumber}
				    </div>
				</div>
				<div class="aisle"></div>
				</c:when>
				<c:when test="${seatRow >= 31 && seatRow <= 49}">
				<div class="seat-container">
				    <div class="seat ${seat.available ? 'available' : 'unavailable'}" data-seat-number="${seat.seatNumber}" data-available="${seat.available}" onclick="selectSeat(this)">
						${seat.seatNumber}
				    </div>
				</div>
				<c:if test="${status.index % 3 == 2}">
				<div class="aisle"></div>
				</c:if>
				</c:when>
				<c:when test="${seatRow >= 50}">
				<div class="seat-container">
				    <div class="seat ${seat.available ? 'available' : 'unavailable'}" data-seat-number="${seat.seatNumber}" data-available="${seat.available}" onclick="selectSeat(this)">
						${seat.seatNumber}
				    </div>
				</div>
				<c:if test="${status.index % 3 == 2}">
				<div class="aisle"></div>
				</c:if>
				</c:when>
				</c:choose>
			<c:if test="${status.last || seatRow != seats[status.index + 1].seatNumber.substring(0, seats[status.index + 1].seatNumber.length() - 1)}">
			</div><!-- row end -->
			</c:if>
			</c:forEach>
		</div>
	</div>
	
</body>
</html>