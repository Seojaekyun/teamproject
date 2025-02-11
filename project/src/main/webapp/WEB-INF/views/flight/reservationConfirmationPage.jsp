<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 완료</title>
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
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 25px;
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
            display: none;
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
            background-color: #28a745;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 18px;
            display: block;
            margin: 30px auto;
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

    <h2>예약이 완료되었습니다!</h2>

    <!-- 가는편 항공편 정보 -->
    <div class="flight-box">
        <div class="flight-header">${goingFlightDeparture} → ${goingFlightArrival}</div>
        <div class="flight-info">
            <div>
                <p class="flight-time">출발 시간: ${goingDepartureTime}</p>
                <p class="flight-time">도착 시간: ${goingArrivalTime}</p>
            </div>
            <div>
                <p class="flight-time">비행 시간: ${goingFlightDuration}</p>
                <p class="flight-time">선택한 좌석: ${goingSelectedSeats}</p>
            </div>
        </div>
        <div class="pnr-box">PNR (예약 번호): ${goingPNR}</div>
        <div class="toggle-details" onclick="toggleDetails('going-details')">세부 사항 보기 ▼</div>
        <div id="going-details" class="flight-details">
            <div class="details-item">출발지: ${goingFlightDeparture}</div>
            <div class="details-item">도착지: ${goingFlightArrival}</div>
            <div class="details-item">비행 시간: ${goingFlightDuration}</div>
            <div class="details-item">탑승 인원: ${passengers}명 (성인 ${adultCount}명, 소아 ${childCount}명)</div>
            <div class="details-item">좌석 등급: ${seatClass}</div>
            <div class="details-item">총 결제 금액: <fmt:formatNumber value="${goingPrice}" type="number"/>원</div>
        </div>
    </div>

    <!-- 오는편 항공편 정보 -->
    <div class="flight-box">
        <div class="flight-header">${returnFlightDeparture} → ${returnFlightArrival}</div>
        <div class="flight-info">
            <div>
                <p class="flight-time">출발 시간: ${returnDepartureTime}</p>
                <p class="flight-time">도착 시간: ${returnArrivalTime}</p>
            </div>
            <div>
                <p class="flight-time">비행 시간: ${returnFlightDuration}</p>
                <p class="flight-time">선택한 좌석: ${returnSelectedSeats}</p>
            </div>
        </div>
        <div class="pnr-box">PNR (예약 번호): ${returnPNR}</div>
        <div class="toggle-details" onclick="toggleDetails('return-details')">세부 사항 보기 ▼</div>
        <div id="return-details" class="flight-details">
            <div class="details-item">출발지: ${returnFlightDeparture}</div>
            <div class="details-item">도착지: ${returnFlightArrival}</div>
            <div class="details-item">비행 시간: ${returnFlightDuration}</div>
            <div class="details-item">탑승 인원: ${passengers}명 (성인 ${adultCount}명, 소아 ${childCount}명)</div>
            <div class="details-item">좌석 등급: ${seatClass}</div>
            <div class="details-item">총 결제 금액: <fmt:formatNumber value="${returnPrice}" type="number"/>원</div>
        </div>
    </div>

    <button onclick="window.location.href='../main/index';">홈으로</button>

    <script>
        function toggleDetails(id) {
            var details = document.getElementById(id);
            if (details.style.display === 'none' || details.style.display === '') {
                details.style.display = 'block';
            } else {
                details.style.display = 'none';
            }
        }
    </script>

</body>
</html>
