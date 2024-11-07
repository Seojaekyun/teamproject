<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>항공권 예약</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
    /* 기본 스타일 */
    body {
        font-family: 'Noto Sans KR', sans-serif;
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
        max-width: 800px;
        margin: 30px auto;
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h2 {
        font-size: 22px;
        color: #00467F;
        margin-bottom: 20px;
        text-align: center;
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
        gap: 20px;
        margin-top: 20px;
    }
    .passenger-box {
        display: flex;
        align-items: center;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
        flex: 1 1 auto;
        min-width: 150px;
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
    /* 달력 스타일 */
    .ui-datepicker {
        font-size: 1.1em;
        width: 320px !important;
        background-color: #f4f4f4;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }
    .ui-datepicker .ui-datepicker-header {
        background-color: #00467F;
        color: white;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        padding: 10px;
    }
    .ui-datepicker .ui-datepicker-title {
        font-weight: bold;
    }
    .ui-datepicker td a {
        color: #00467F;
        padding: 8px;
        border-radius: 50%;
        transition: background-color 0.3s ease;
    }
    .ui-datepicker td a:hover {
        background-color: #ddd;
    }
    .ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
        color: white;
        font-size: 1.2em;
        cursor: pointer;
    }
</style>

<script>
    $(function() {
        // 날짜 선택기 설정
        $("#selectedDate").datepicker({
            dateFormat: "yy-mm-dd",
            showOtherMonths: true,
            selectOtherMonths: true,
            changeMonth: true,
            changeYear: true,
            onSelect: function(dateText) {
                $("#selectedDate").val(dateText);
                fetchAirportsByDate(dateText);
            }
        });
    });
    
    // 선택된 날짜로 출발 공항 목록을 가져오는 함수
    function fetchAirportsByDate(selectedDate) {
        if (selectedDate) {
            console.log("Fetching airports for date:", selectedDate);
            fetch(`/reserve/airports?date=` + selectedDate)
                .then(response => {
                    if (!response.ok) throw new Error('Network response was not ok');
                    return response.json();
                })
                .then(data => {
                    console.log("Received data:", data);
                    const departureSelect = document.getElementById('departure');
                    const arrivalSelect = document.getElementById('arrival');
                    departureSelect.innerHTML = '<option value="">-- 출발지를 선택하세요 --</option>';
                    arrivalSelect.innerHTML = '<option value="">-- 도착지를 선택하세요 --</option>';

                    data.forEach(airport => {
                        let option = document.createElement('option');
                        option.value = airport;
                        option.text = airport;
                        departureSelect.add(option.cloneNode(true));
                        arrivalSelect.add(option);
                    });
                })
                .catch(error => console.error('Error fetching airports:', error));
        }
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
        <a href="../reserve/checkin">체크인</a>
        <a href="../flight/flightList">운항 정보</a>
    </nav>
    
    <div class="container">
        <h2>예약 정보 입력</h2>
        
        <div class="form-group">
            <label for="selectedDate">출발일 선택</label>
            <input type="text" id="selectedDate" name="selectedDate" placeholder="날짜 선택" readonly>
        </div>
    
        <form id="reservationForm" action="${pageContext.request.contextPath}/flights/search" method="post">
            <div id="trip-methods" class="trip-methods">
                <input type="radio" name="t_methods" value="round" id="round-trip" checked> 
                <label for="round-trip">왕복</label>
                <input type="radio" name="t_methods" value="one-way" id="one-way"> 
                <label for="one-way">편도</label>
            </div>

            <!-- 출발지 선택 (select로 변경) -->
            <div class="form-group">
                <label for="departure">출발지</label>
                <select name="departure" id="departure" required>
                    <option value="">-- 출발지를 선택하세요 --</option>
                </select>
            </div>

            <!-- 도착지 선택 (select로 변경) -->
            <div class="form-group">
                <label for="arrival">도착지</label>
                <select name="arrival" id="arrival" required>
                    <option value="">-- 도착지를 선택하세요 --</option>
                </select>
            </div>

            <!-- 탑승객 선택 예시 -->
            <div id="passenger_selection">
                <h3>탑승객 선택</h3>
                <div class="passenger-selection-container">
                    <div class="passenger-box">
                        <label>성인:</label>
                        <div class="passenger-controls">
                            <button type="button" onclick="changePassengerCount('adult', -1)">-</button>
                            <span id="adult-count" class="passenger-count">1</span>
                            <button type="button" onclick="changePassengerCount('adult', 1)">+</button>
                        </div>
                        <input type="hidden" name="adultCount" id="adult-hidden" value="1">
                    </div>
                    <div class="passenger-box">
                        <label>아동 (2-11세):</label>
                        <div class="passenger-controls">
                            <button type="button" onclick="changePassengerCount('child', -1)">-</button>
                            <span id="child-count" class="passenger-count">0</span>
                            <button type="button" onclick="changePassengerCount('child', 1)">+</button>
                        </div>
                        <input type="hidden" name="childCount" id="child-hidden" value="0">
                    </div>
                    <div class="passenger-box">
                        <label>유아 (2세 미만):</label>
                        <div class="passenger-controls">
                            <button type="button" onclick="changePassengerCount('infant', -1)">-</button>
                            <span id="infant-count" class="passenger-count">0</span>
                            <button type="button" onclick="changePassengerCount('infant', 1)">+</button>
                        </div>
                        <input type="hidden" name="infantCount" id="infant-hidden" value="0">
                    </div>
                </div>
            </div>

            <!-- 좌석 등급 선택 -->
            <div class="form-group">
                <label for="seatClass">좌석 클래스</label>
                <select name="seatClass" id="seat_class" required>
                    <option value="Economy">이코노미</option>
                    <option value="Business">프레스티지</option>
                    <option value="First">일등석</option>
                </select>
            </div>

            <input type="submit" value="예약하기">
        </form>
    </div>
</section>

</body>
</html>
