<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>항공편 선택 확인 - eLT항공</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
    /* 기본 스타일 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 1200px;
        margin: 30px auto;
        background-color: white;
        padding: 30px;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
    }
    h2, h4 {
        color: #00467F;
    }
    table {
        width: 100%;
        margin-bottom: 30px;
    }
    th, td {
        text-align: center;
    }
    .btn-seat-select, .btn-reservation {
        padding: 5px 10px;
        background-color: #00467F; /* 블루 색상 */
        color: white;
        border-radius: 5px;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-size: 12px;
    }
    .btn-reservation {
        font-size: 15px;
    }
    .btn-seat-select:hover, .btn-reservation:hover {
        background-color: #003A66;
    }
    .action-buttons {
        margin-top: 20px;
        margin-bottom: 50px;
    }
    .seat-selection-btn {
        margin-right: 10px;
    }
    
</style>
<script>
    function openSeatSelection() {
        var seatClass = '${seatClass}';
        var flightId = '${selectedGoingFlightId}';
        var passengers = '${passengers}';
        var url = '${pageContext.request.contextPath}/flights/seats?flightId=' + flightId + '&seatClass=' + seatClass + '&passengers=' + passengers;
        window.open(url, 'Seat Selection', 'width=600,height=800');
    }
    function updateSelectedSeats(seatNumbers) {
        document.getElementById('goingSelectedSeats').value = seatNumbers.join(',');
        document.getElementById('goingSeatsDisplay').innerText = seatNumbers.join(', ');
        var seatButtonContainer = document.getElementById('goingSeatButtonContainer');
        seatButtonContainer.innerHTML = '<button class="btn-seat-select" onclick="openSeatSelection()">좌석 변경</button>';
    }
    function openReturnSeatSelection() {
        var seatClass = '${seatClass}';
        var flightId = '${selectedReturnFlightId}';
        var passengers = '${passengers}';
        var url = '${pageContext.request.contextPath}/flights/seatsReturn?flightId=' + flightId + '&seatClass=' + seatClass + '&passengers=' + passengers;
        window.open(url, 'Return Seat Selection', 'width=600,height=800');
    }
    function updateReturnSelectedSeats(seatNumbers) {
        document.getElementById('returnSelectedSeats').value = seatNumbers.join(',');
        document.getElementById('returnSeatsDisplay').innerText = seatNumbers.join(', ');
        var seatButtonContainer = document.getElementById('returnSeatButtonContainer');
        seatButtonContainer.innerHTML = '<button class="btn-seat-select" onclick="openReturnSeatSelection()">좌석 변경</button>';
    }
    window.addEventListener('message', function(event) {
        if (event.data.type === 'goingSeatsSelected') {
            var seatNumbers = event.data.seats;
            updateSelectedSeats(seatNumbers);
        }
        else if (event.data.type === 'returnSeatsSelected') {
            var seatNumbers = event.data.seats;
            updateReturnSelectedSeats(seatNumbers);
        }
    });
</script>
</head>
<body>
    <div class="container">
        <h2 class="mt-4">선택한 항공편 확인</h2>
        
        <!-- 가는편 정보 -->
        <h4>가는편 비행기</h4>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Flight ID</th>
                    <th>출발 공항</th>
                    <th>도착 공항</th>
                    <th>출발 시간</th>
                    <th>도착 시간</th>
                    <th>좌석</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${selectedGoingFlightId}</td>
                    <td>${selectedGoingFlightDeparture}</td>
                    <td>${selectedGoingFlightArrival}</td>
                    <td>${selectedGoingFlightTime}</td>
                    <td>${selectedGoingFlightArrivalTime}</td>
                    <td>
                        <span id="goingSeatsDisplay"></span>
                        <div id="goingSeatButtonContainer">
                            <button class="btn-seat-select" onclick="openSeatSelection()">좌석 선택</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <!-- 오는편 정보 -->
        <h4>오는편 비행기</h4>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Flight ID</th>
                    <th>출발 공항</th>
                    <th>도착 공항</th>
                    <th>출발 시간</th>
                    <th>도착 시간</th>
                    <th>좌석</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${selectedReturnFlightId}</td>
                    <td>${selectedReturnFlightDeparture}</td>
                    <td>${selectedReturnFlightArrival}</td>
                    <td>${selectedReturnFlightTime}</td>
                    <td>${selectedReturnFlightArrivalTime}</td>
                    <td>
                        <span id="returnSeatsDisplay"></span>
                        <div id="returnSeatButtonContainer">
                            <button class="btn-seat-select" onclick="openReturnSeatSelection()">좌석 선택</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- 선택한 항공편 정보 -->
        <h4>선택한 항공편 정보</h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>좌석 등급</th>
                    <th>인원</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${seatClass}</td>
                    <td>${passengers}명</td>
                </tr>
            </tbody>
        </table>

        <!-- 예약하기 버튼 -->
        <form action="${pageContext.request.contextPath}/flights/booking" method="post">
            <input type="hidden" name="goingFlightId" value="${selectedGoingFlightId}">
            <input type="hidden" name="returnFlightId" value="${selectedReturnFlightId}">
            <input type="hidden" name="seatClass" value="${seatClass}">
            <input type="hidden" name="passengers" value="${passengers}">
            <input type="hidden" name="goingSelectedSeats" id="goingSelectedSeats">
            <input type="hidden" name="returnSelectedSeats" id="returnSelectedSeats">
            <button type="submit" class="btn btn-success btn-reservation">예약하기</button>
        </form>
    </div>
</body>
</html>
