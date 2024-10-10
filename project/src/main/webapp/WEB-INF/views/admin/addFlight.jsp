<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>항공편 추가</title>
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	section form {
		max-width: 1200px;
		margin: 50px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
	}
	section h2 {
		font-size: 24px;
		font-weight: bold;
		text-align: center;
		color: #333;
		margin-bottom: 20px;
	}
	section .flex-container {
		display: flex;
		justify-content: space-between;
		gap: 20px;
	}
	section .flex-item {
		width: 48%;
	}
	section label {
		font-size: 14px;
		color: #333;
		display: block;
		margin-bottom: 10px;
		font-weight: bold;
	}
	section input[type="text"], input[type="date"], select, textarea {
		width: calc(100% - 20px);
		padding: 10px;
		margin-bottom: 20px;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-sizing: border-box;
		font-size: 14px;
	}
	section textarea {
		height: 50px;
	}
	section button {
		width: 100%;
		background-color: #000A8E;
		color: white;
		border: none;
		padding: 15px;
		font-size: 16px;
		border-radius: 8px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	section button:hover {
		background-color: #333;
	}
</style>
<script type="text/javascript">
	// 두 자리 숫자로 변환하는 함수 (한 자리 숫자일 경우 앞에 0을 추가)
	function padZero(value) {
		return ("0" + value).slice(-2);
	}
	
	// 출발 시간과 비행 시간을 더해 도착 시간을 계산하는 함수
	function calculateArrivalTime(departureDateId, departureHourId, departureMinuteId, flightHourId, flightMinuteId, arrivalTimeId) {
		// 출발 시간과 비행 시간 값 읽기
		var departureDate = document.getElementById(departureDateId).value;
		var departureHour = parseInt(document.getElementById(departureHourId).value);
		var departureMinute = parseInt(document.getElementById(departureMinuteId).value);
		var flightHour = parseInt(document.getElementById(flightHourId).value);
		var flightMinute = parseInt(document.getElementById(flightMinuteId).value);
		
		if (!departureDate || isNaN(departureHour) || isNaN(departureMinute) || isNaN(flightHour) || isNaN(flightMinute)) {
			return;
		}
		// 총 비행 시간을 분 단위로 계산
		var totalFlightMinutes = (flightHour * 60) + flightMinute;
		// 출발 시간을 분 단위로 변환
		var totalDepartureMinutes = (departureHour * 60) + departureMinute;
		// 도착 시간을 분 단위로 계산
		var totalArrivalMinutes = totalDepartureMinutes + totalFlightMinutes;
		// 도착 시간이 하루를 초과하는지 확인
		var arrivalDays = Math.floor(totalArrivalMinutes / (24 * 60)); // 도착 시점에서 며칠이 지나는지 계산
		totalArrivalMinutes = totalArrivalMinutes % (24 * 60); // 하루 내의 도착 시각 계산
		// 도착 시간(시/분) 계산
		var arrivalHour = Math.floor(totalArrivalMinutes / 60);
		var arrivalMinute = totalArrivalMinutes % 60;
		// 도착 날짜 계산 (입력한 출발 날짜에 비행 일 수 추가)
		var departureDateObj = new Date(departureDate);
		departureDateObj.setDate(departureDateObj.getDate() + arrivalDays);
		// 도착 날짜를 YYYY-MM-DD 형식으로 변환
		var arrivalDate = departureDateObj.getFullYear() + "-" + padZero(departureDateObj.getMonth() + 1) + "-" + padZero(departureDateObj.getDate());
		// 도착 시각을 출력
		document.getElementById(arrivalTimeId).value = arrivalDate + " " + padZero(arrivalHour) + ":" + padZero(arrivalMinute);
	}
	
	// 출발지와 도착지를 설정하는 함수
	function setReturnFlightAirports() {
		var departureAirport = document.getElementById("departureAirport").value;
		var arrivalAirport = document.getElementById("arrivalAirport").value;
		document.getElementById("returnDepartureAirport").value = arrivalAirport || "";
		document.getElementById("returnArrivalAirport").value = departureAirport || "";
	}
	
	// 출발 공항 변경에 따라 도착 공항 목록 갱신
	function updateArrivalAirports() {
		var departureAirport = document.getElementById("departureAirport").value;
		var arrivalAirportSelect = document.getElementById("arrivalAirport");
		// 기존 도착 공항 목록 초기화
		arrivalAirportSelect.innerHTML = "";
		// 출발 공항이 ICN 또는 GMP일 경우
		if (departureAirport === "ICN" || departureAirport === "GMP") {
			<c:forEach var="airport" items="${airports}">
			if ("${airport.airportCode}" !== "ICN" && "${airport.airportCode}" !== "GMP") {
				var option = document.createElement("option");
				option.value = "${airport.airportCode}";
				option.text = "${airport.airportName}";
				arrivalAirportSelect.appendChild(option);
			}
			</c:forEach>
		}
		else {
			// 출발 공항이 ICN 또는 GMP가 아닌 경우
			var optionICN = document.createElement("option");
			optionICN.value = "ICN";
			optionICN.text = "인천 국제공항";
			arrivalAirportSelect.appendChild(optionICN);
			var optionGMP = document.createElement("option");
			optionGMP.value = "GMP";
			optionGMP.text = "김포 국제공항";
			arrivalAirportSelect.appendChild(optionGMP);
		}
		// 출발편 공항 정보 변경 시 귀국편 공항 정보를 자동으로 설정
		setReturnFlightAirports();
	}
	
	// 출발 시간과 도착 시간을 결합하는 함수
	function combineTimes() {
		var departureDate = document.getElementById("departureDate").value;
		var departureHour = padZero(document.getElementById("departureHour").value);
		var departureMinute = padZero(document.getElementById("departureMinute").value);
		document.getElementById("departureTime").value = departureDate + " " + departureHour + ":" + departureMinute + ":00";
		
		var returnDepartureDate = document.getElementById("returnDepartureDate").value;
		var returnDepartureHour = padZero(document.getElementById("returnDepartureHour").value);
		var returnDepartureMinute = padZero(document.getElementById("returnDepartureMinute").value);
		document.getElementById("returnDepartureTime").value = returnDepartureDate + " " + returnDepartureHour + ":" + returnDepartureMinute + ":00";
	}
	
	// 페이지가 로드되면 이벤트 리스너를 등록
	window.onload = function() {
		// 출발편 도착시간 계산
		var departureFields = ["departureDate", "departureHour", "departureMinute", "flightHour", "flightMinute"];
		departureFields.forEach(function(field) {
			document.getElementById(field).addEventListener("change", function() {
				calculateArrivalTime("departureDate", "departureHour", "departureMinute", "flightHour", "flightMinute", "arrivalTime");
			});
		});
		
		// 귀국편 도착시간 계산
		var returnFields = ["returnDepartureDate", "returnDepartureHour", "returnDepartureMinute", "returnFlightHour", "returnFlightMinute"];
		returnFields.forEach(function(field) {
			document.getElementById(field).addEventListener("change", function() {
				calculateArrivalTime("returnDepartureDate", "returnDepartureHour", "returnDepartureMinute", "returnFlightHour", "returnFlightMinute", "returnArrivalTime");
			});
		});
		// 출발 공항 변경 시 도착 공항 목록 업데이트
		document.getElementById("departureAirport").addEventListener("change", updateArrivalAirports);
		document.getElementById("arrivalAirport").addEventListener("change", setReturnFlightAirports);
		// 페이지 로드 시 도착 공항 목록 초기화
		updateArrivalAirports();
	};
</script>
</head>
<body>
<section>
	<h2>항공편 추가</h2>
	<form action="/admin/addFlights" method="post" onsubmit="combineTimes()">
		<div class="flex-container">
			<div class="flex-item">
				<h3>출발편 정보</h3>
				<label for="departureAirport">출발 공항:</label>
				<select id="departureAirport" name="departureAirport" required>
					<option value="">선택</option>
					<c:forEach var="airport" items="${airports}">
						<option value="${airport.airportCode}">${airport.airportName}</option>
					</c:forEach>
				</select>
				<label for="arrivalAirport">도착 공항:</label>
				<select id="arrivalAirport" name="arrivalAirport" required>
					<!-- 도착 공항 목록은 자바스크립트로 동적으로 설정됩니다 -->
				</select>
				<label for="departureDate">출발 날짜:</label>
				<input type="date" id="departureDate" name="departureDate" required>
				<label for="departureHour">출발 시간 (시):</label>
				<select id="departureHour" name="departureHour" required>
					<c:forEach var="hour" begin="0" end="23">
						<option value="${hour}">${hour}</option>
					</c:forEach>
				</select>
				<label for="departureMinute">출발 시간 (분):</label>
				<select id="departureMinute" name="departureMinute" required>
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				<label for="flightHour">비행 시간 (시):</label>
				<select id="flightHour" name="flightHour" required>
					<c:forEach var="hour" begin="0" end="23">
						<option value="${hour}">${hour}</option>
					</c:forEach>
				</select>
				<label for="flightMinute">비행 시간 (분):</label>
				<select id="flightMinute" name="flightMinute" required>
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				<label for="arrivalTime">도착 시간:</label>
				<textarea id="arrivalTime" name="arrivalTime" readonly></textarea>
				<input type="hidden" id="departureTime" name="departureTime">
				<label for="airplaneId">비행기:</label>
				<select id="airplaneId" name="airplaneId" required>
					<c:forEach var="airp" items="${airplanes}">
						<option value="${airp.airplaneId}">${airp.airplaneId}. ${airp.model} / ${airp.capacity}석</option>
					</c:forEach>
				</select>
			</div>

			<div class="flex-item">
				<h3>귀국편 정보</h3>
				<label for="returnDepartureAirport">출발 공항:</label>
				<input type="text" id="returnDepartureAirport" name="returnDepartureAirport" readonly>
				<label for="returnArrivalAirport">도착 공항:</label>
				<input type="text" id="returnArrivalAirport" name="returnArrivalAirport" readonly>
				<label for="returnDepartureDate">출발 날짜:</label>
				<input type="date" id="returnDepartureDate" name="returnDepartureDate" required>
				<label for="returnDepartureHour">출발 시간 (시):</label>
				<select id="returnDepartureHour" name="returnDepartureHour" required>
					<c:forEach var="hour" begin="0" end="23">
						<option value="${hour}">${hour}</option>
					</c:forEach>
				</select>
				<label for="returnDepartureMinute">출발 시간 (분):</label>
				<select id="returnDepartureMinute" name="returnDepartureMinute" required>
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				<label for="returnFlightHour">비행 시간 (시):</label>
				<select id="returnFlightHour" name="returnFlightHour" required>
					<c:forEach var="hour" begin="0" end="23">
						<option value="${hour}">${hour}</option>
					</c:forEach>
				</select>
				<label for="returnFlightMinute">비행 시간 (분):</label>
				<select id="returnFlightMinute" name="returnFlightMinute" required>
					<option value="00">00</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				<label for="returnArrivalTime">도착 시간:</label>
				<textarea id="returnArrivalTime" name="returnArrivalTime" readonly></textarea>
				<input type="hidden" id="returnDepartureTime" name="returnDepartureTime">
				<label for="returnAirplaneId">비행기:</label>
				<select id="returnAirplaneId" name="returnAirplaneId" required>
					<c:forEach var="airp" items="${airplanes}">
						<option value="${airp.airplaneId}">${airp.airplaneId}. ${airp.model} / ${airp.capacity}석</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<button type="submit">항공편 추가</button>
	</form>
</section>
</body>
</html>