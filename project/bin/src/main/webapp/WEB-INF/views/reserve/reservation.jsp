<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>항공권 예약</title>
<!-- 디자인에 필요한 CSS 및 스크립트 추가 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		margin: 0;
		padding: 0;
	}
	section header {
		background-color: #00467F;
		padding: 20px;
		text-align: center;
		color: white;
	}
	section header h1 {
		margin: 0;
		font-size: 24px;
	}
	section nav {
		background-color: #0059A3;
		padding: 10px;
		text-align: center;
	}
	section nav a {
		color: white;
		margin: 0 15px;
		text-decoration: none;
		font-size: 16px;
	}
	section nav a:hover {
		text-decoration: underline;
	}
	.container {
		max-width: 1000px;
		margin: 20px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 10px;
	}
	.form-group {
		margin-bottom: 20px;
	}
	label {
		font-weight: bold;
		color: #555;
	}
	select, input[type="text"], input[type="email"] {
		width: 100%;
		padding: 10px;
		margin-top: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		font-size: 16px;
	}
	input[type="submit"] {
		background-color: #00467F;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
	}
	input[type="submit"]:hover {
		background-color: #003A66;
	}
	.passenger-selection-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: nowrap; /* 한 줄로 강제로 배치 */
        gap: 20px;
        margin-top: 20px;
    }

    .passenger-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
        flex: 1 1 auto; /* 동일한 너비로 확장 */
        min-width: 150px; /* 최소 너비 조정 */
    }

    .passenger-controls {
        display: flex;
        align-items: center;
    }

    .passenger-controls button {
        width: 30px;
        height: 30px;
        font-size: 16px;
        border: none;
        background-color: #00467F;
        color: white;
        cursor: pointer;
        border-radius: 50%;
        margin: 0 5px;
    }

    .passenger-controls button:hover {
        background-color: #003A66;
    }

    .passenger-count {
        font-size: 18px;
        margin: 0 10px;
    }
</style>

<script>
	$(function() {
		// 달력 설정
		$("#selectedDate").datepicker({
			inline: true,
			dateFormat: "yy-mm-dd",
			onSelect: function(dateText) {
				$("#selectedDate").val(dateText);  // 선택한 날짜를 화면에 표시
				fetchFlightsByDate(dateText);  // 선택한 날짜에 맞는 항공편 불러오기
			}
		});
	});
	
	// 선택한 날짜에 맞는 항공편 불러오기
	function fetchFlightsByDate(selectedDate) {
		if (selectedDate) {
			fetch(`/reserve/flights?date=` + selectedDate)
			.then(response => response.json())
			.then(data => {
				let flightSelect = document.getElementById('flight_id');
				flightSelect.innerHTML = '<option value="">-- 항공편 선택 --</option>';
				data.forEach(flight => {
					let option = document.createElement('option');
					option.value = flight.flightId;
					
					let departureTime = new Date(flight.departureTime).toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
					option.text = flight.departureAirport +' to '+flight.arrivalAirport+' (Departure: '+departureTime+')';
					flightSelect.add(option);
				});
			})
			.catch(error => console.error('Error fetching flights:', error));
		}
	}
	
	// 선택한 항공편에 맞는 좌석 불러오기
	function fetchSeats(flightId) {
		if (flightId) {
			fetch(`/reserve/seats?flightId=` + flightId)
			.then(response => response.json())
			.then(data => {
				let seatSelect = document.getElementById('seat_number');
				seatSelect.innerHTML = '<option value="">-- 좌석 선택 --</option>';
				data.forEach(seat => {
					let option = document.createElement('option');
					option.value = seat.seatNumber;
					option.text = seat.seatNumber + ' (' + seat.seatClass + ')';
					seatSelect.add(option);
				});
			})
			.catch(error => console.error('Error fetching seats:', error));
		} else {
			document.getElementById('seat_number').innerHTML = '<option value="">-- 좌석 선택 --</option>';
		}
	}
	
	// 승객 수 변경
	let passengerCounts = {
		adult: 1,
		child: 0,
		infant: 0
	};

	function changePassengerCount(type, change) {
		passengerCounts[type] += change;
		
		// 성인은 최소 1명
		if (type === 'adult' && passengerCounts[type] < 1) {
			passengerCounts[type] = 1;
		}

		// 성인과 아동의 합은 10명을 초과할 수 없음
		if (passengerCounts['adult'] + passengerCounts['child'] > 10) {
			passengerCounts[type] -= change;
			alert("성인과 아동의 합은 10명을 초과할 수 없습니다.");
		}

		// 유아는 성인 수를 초과할 수 없음
		if (type === 'infant' && passengerCounts['infant'] > passengerCounts['adult']) {
			passengerCounts['infant'] = passengerCounts['adult'];
		}

		// 아동 및 유아는 최소 0명
		if (type !== 'adult' && passengerCounts[type] < 0) {
			passengerCounts[type] = 0;
		}

		document.getElementById(type + '-count').textContent = passengerCounts[type];
	}
</script>

</head>
<body>

<section>
	<header>
		<h1>항공권 예약</h1>
	</header>
	
	<nav>
		<a href="../reserve/reservation">항공권 예약</a>
		<a href="../reserve/reserveInfo">예약 조회</a>
		<a href="">체크인</a>
		<a href="../flight/flightList">운항 정보</a>
	</nav>
	
	<div class="container">
		<h2>예약 정보 입력</h2>
		
		<!-- 날짜 선택 -->
		<div id="cal">
			<input type="text" id="selectedDate" placeholder="날짜 선택" readonly>
		</div>
	
		<!-- 항공편 선택 -->
		<form id="reservationForm" action="/reserve" method="post">
			<div class="form-group">
				<label for="flight_id">항공편 선택</label>
				<select name="flightId" id="flight_id" required onchange="fetchSeats(this.value)">
					<option value="">-- 항공편 선택 --</option>
				</select>
			</div>
			
			<!-- 좌석 클래스 선택 -->
			<div class="form-group">
				<label for="seat_class">좌석 클래스</label>
				<select name="seat_class" id="seat_class" required>
					<option value="Economy">이코노미</option>
					<option value="Business">프레스티지</option>
					<option value="First">일등석</option>
				</select>
			</div>
			
			<!-- 승객 수 선택 -->
			<div id="passenger_selection">
    <h3>탑승객 선택</h3>
    
    <div class="passenger-selection-container">
        <!-- 성인 승객 -->
        <div class="passenger-box">
            <label for="adult-count">성인:</label>
            <div class="passenger-controls">
                <button type="button" onclick="changePassengerCount('adult', -1)">-</button>
                <span id="adult-count" class="passenger-count">1</span>
                <button type="button" onclick="changePassengerCount('adult', 1)">+</button>
            </div>
        </div>

        <!-- 아동 승객 -->
        <div class="passenger-box">
            <label for="child-count">아동 (2-11세):</label>
            <div class="passenger-controls">
                <button type="button" onclick="changePassengerCount('child', -1)">-</button>
                <span id="child-count" class="passenger-count">0</span>
                <button type="button" onclick="changePassengerCount('child', 1)">+</button>
            </div>
        </div>

        <!-- 유아 승객 -->
        <div class="passenger-box">
            <label for="infant-count">유아 (2세 미만):</label>
            <div class="passenger-controls">
                <button type="button" onclick="changePassengerCount('infant', -1)">-</button>
                <span id="infant-count" class="passenger-count">0</span>
                <button type="button" onclick="changePassengerCount('infant', 1)">+</button>
            </div>
        </div>
    </div>
</div>


			<!-- 고객 정보 입력 -->
			<div class="form-group">
				<label for="customer_id">예약자 ID</label>
				<input type="text" id="userid" name="userid" value="${userid }" required>
			</div>

			<div class="form-group">
				<label for="customer_sung">First Name</label>
				<input type="text" id="sung" name="sung" value="${sung }" required>
			</div>
			
			<div class="form-group">
				<label for="customer_name">Last Name</label>
				<input type="text" id="lname" name="lname" value="${lname }" required>
			</div>
			
			<div class="form-group">
				<label for="customer_email">이메일</label>
				<input type="email" id="customer_email" name="customer_email" value="${email}" required>
			</div>

			<input type="submit" value="예약하기">
		</form>
	</div>
</section>

</body>
</html>