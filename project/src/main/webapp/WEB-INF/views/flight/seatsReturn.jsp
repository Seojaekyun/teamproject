<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오는편 좌석 선택</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        .seat {
            display: inline-block;
            width: 50px;
            height: 50px;
            margin: 5px;
            border: 1px solid #000;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
        }
        .available {
            background-color: #28a745; /* 녹색 */
        }
        .unavailable {
            background-color: #6c757d; /* 회색 */
            cursor: not-allowed;
        }
        .selected {
            background-color: #ffc107; /* 노란색 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4">오는편 좌석 선택 - ${seatClass}</h2>
        <p>비행기 ID: ${flightId}</p>
        <p>탑승객 수: ${passengers}명</p>

        <!-- 좌석 목록 표시 -->
        <div id="seatsContainer">
            <c:forEach var="seat" items="${seats}">
                <div
                    class="seat ${seat.available ? 'available' : 'unavailable'}"
                    data-seat-number="${seat.seatNumber}"
                    data-available="${seat.available}"
                    onclick="selectSeat(this)">
                    ${seat.seatNumber}
                </div>
            </c:forEach>
        </div>

        <!-- 선택한 좌석 표시 -->
        <div class="mt-4">
            <h4>선택한 좌석:</h4>
            <p id="selectedSeatsDisplay"></p>
        </div>

        <!-- 선택 완료 버튼 -->
        <button class="btn btn-primary mt-4" onclick="confirmSelection()">선택 완료</button>
    </div>

    <!-- 자바스크립트 코드 -->
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
                element.classList.add('selected');
            } else {
                // 좌석 선택 해제
                selectedSeats.splice(index, 1);
                element.classList.remove('selected');
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
            // 폼을 생성하여 POST 요청으로 전송합니다.
            var form = document.createElement('form');
            form.method = 'post';
            form.action = '${pageContext.request.contextPath}/flights/confirmReturnSeats';

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

            var passengersInput = document.createElement('input');  // 추가된 부분
            passengersInput.type = 'hidden';
            passengersInput.name = 'passengers';
            passengersInput.value = '${passengers}';
            form.appendChild(passengersInput);

            var selectedSeatsInput = document.createElement('input');
            selectedSeatsInput.type = 'hidden';
            selectedSeatsInput.name = 'selectedSeats';
            selectedSeatsInput.value = selectedSeats.join(',');
            form.appendChild(selectedSeatsInput);

            document.body.appendChild(form);
            form.submit();
            
         	// 부모 창에 선택된 좌석 정보 전달
            window.opener.postMessage({
                type: 'returnSeatsSelected',
                seats: selectedSeats
            }, '*');

            // 창 닫기
            window.close();
        }
    </script>
</body>
</html>
