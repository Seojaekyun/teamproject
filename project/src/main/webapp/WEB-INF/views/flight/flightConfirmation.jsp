<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공편 선택 확인 - eLT항공</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">

    <style>
        /* 좌석선택 버튼 스타일 */
        .btn-seat-select {
            background-color: #00aaff; /* 하늘색 */
            color: white;
            margin-right: 10px;
        }
        
        /* 버튼 간격 조정 */
        .action-buttons {
            margin-top: 20px;
            margin-bottom: 50px;
        }

        /* 예약하기 버튼과 페이지 하단 간격 추가 */
        .btn-reservation {
            
        }
    </style>
    
    <script>
function openSeatSelection() {
    var seatClass = '${seatClass}';
    var flightId = '${selectedGoingFlightId}';
    var passengers = '${passengers}';
    var url = '${pageContext.request.contextPath}/flights/seats?flightId=' + flightId + '&seatClass=' + seatClass + '&passengers=' + passengers;
    window.open(url, 'Seat Selection', 'width=1200,height=800');
}

//선택된 좌석 정보를 업데이트하는 함수
function updateSelectedSeats(seatNumbers) {
    // 좌석 번호 표시 영역 업데이트
    document.getElementById('goingSelectedSeats').value = seatNumbers.join(',');
    document.getElementById('goingSeatsDisplay').innerText = seatNumbers.join(', ');

    // '가는편 좌석 선택' 버튼을 '좌석 변경' 버튼으로 대체
    var seatButtonContainer = document.getElementById('goingSeatButtonContainer');
    seatButtonContainer.innerHTML = '<button onclick="openSeatSelection()">좌석 변경</button>';
}



// 오는편 좌석 선택 창 열기
function openReturnSeatSelection() {
    var seatClass = '${seatClass}';
    var flightId = '${selectedReturnFlightId}';
    var passengers = '${passengers}';
    var url = '${pageContext.request.contextPath}/flights/seatsReturn?flightId=' + flightId + '&seatClass=' + seatClass + '&passengers=' + passengers;
    window.open(url, 'Return Seat Selection', 'width=1200,height=800');
}

//오는편 선택된 좌석 정보를 업데이트하는 함수
function updateReturnSelectedSeats(seatNumbers) {
    // 좌석 번호 표시 영역 업데이트
    document.getElementById('returnSelectedSeats').value = seatNumbers.join(',');
    document.getElementById('returnSeatsDisplay').innerText = seatNumbers.join(', ');

    // '오는편 좌석 선택' 버튼을 '좌석 변경' 버튼으로 대체
    var seatButtonContainer = document.getElementById('returnSeatButtonContainer');
    seatButtonContainer.innerHTML = '<button onclick="openReturnSeatSelection()">좌석 변경</button>';
}



//메시지 수신 이벤트 리스너 추가
window.addEventListener('message', function(event) {
    if (event.data.type === 'goingSeatsSelected') {
        var seatNumbers = event.data.seats;
        updateGoingSelectedSeats(seatNumbers);
    } else if (event.data.type === 'returnSeatsSelected') {
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
            <thead>
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
                    	<!-- 좌석 번호 표시 영역 -->
            				<span id="goingSeatsDisplay"></span>
            			<!-- 좌석 선택 또는 변경 버튼 -->
            				<div id="goingSeatButtonContainer">
                		<!-- 처음에는 '가는편 좌석 선택' 버튼이 표시됨 -->
                				<button onclick="openSeatSelection()">가는편 좌석 선택</button>
            				</div>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- 오는편 정보 -->
        <h4>오는편 비행기</h4>
        <table class="table table-bordered">
            <thead>
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
                			<!-- 좌석 번호 표시 영역 -->
                				<span id="returnSeatsDisplay"></span>
                			<!-- 좌석 선택 또는 변경 버튼 -->
                				<div id="returnSeatButtonContainer">
                    		<!-- 처음에는 '오는편 좌석 선택' 버튼이 표시됨 -->
                    				<button onclick="openReturnSeatSelection()">오는편 좌석 선택</button>
                				</div>
            </td>
                    
                </tr>
            </tbody>
        </table>

		<!-- 추가 정보 -->
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
                    <td>${seatClass}</td> <!-- 좌석 등급 출력 -->
                    <td>${passengers}명</td> <!-- 선택된 인원 출력 -->
                </tr>
            </tbody>
        </table>
            <!-- 예약하기 버튼 -->
            <form action="${pageContext.request.contextPath}/flights/booking" method="post" style="display:inline;"
            	onsubmit="console.log(document.getElementById('goingSelectedSeats').value, document.getElementById('returnSelectedSeats').value);">
                <input type="hidden" name="goingFlightId" value="${selectedGoingFlightId}">
                <input type="hidden" name="returnFlightId" value="${selectedReturnFlightId}">
                <input type="hidden" name="seatClass" value="${seatClass}">
                <input type="hidden" name="passengers" value="${passengers}">
    			<input type="hidden" name="goingSelectedSeats" id="goingSelectedSeats">
    			<input type="hidden" name="returnSelectedSeats" id="returnSelectedSeats">
                <button type="submit" class="btn btn-success btn-reservation">예약하기</button>
            </form>
        </div>
    </div>

</body>
</html>
