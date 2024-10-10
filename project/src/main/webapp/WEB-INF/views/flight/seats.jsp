<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 선택</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        .airplane {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .seatf {
            width: 80px;
            height: 60px;
            border: 1px solid #000;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
            border-radius: 10px;
        }
        .seatb {
            width: 70px;
            height: 50px;
            border: 1px solid #000;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
            border-radius: 8px;
        }
        .seat {
            width: 50px;
            height: 50px;
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
        .aisle {
            width: 30px; /* 복도 공간 */
            height: 50px;
            background-color: transparent;
        }
        .row {
            display: flex;
            gap: 10px; /* 좌석 간의 간격 추가 */
            justify-content: center;
            margin-bottom: 10px; /* 행 간의 간격 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4">비행기 좌석 선택 - ${seatClass}</h2>
        <p>비행기 ID: ${flightId}</p>
        <p>탑승객 수: ${passengers}명</p>

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
                        <div class="seatf ${seat.available ? 'available' : 'unavailable'}"
                             data-seat-number="${seat.seatNumber}"
                             data-available="${seat.available}"
                             onclick="selectSeat(this)">
                             ${seat.seatNumber}
                        </div>
                
                        <div class="aisle"></div>
                    </c:when>

                    <c:when test="${seatRow >= 11 && seatRow <= 30}">
                        <div class="seatb ${seat.available ? 'available' : 'unavailable'}"
                             data-seat-number="${seat.seatNumber}"
                             data-available="${seat.available}"
                             onclick="selectSeat(this)">
                             ${seat.seatNumber}
                        </div>
                
                        <div class="aisle"></div>

                    </c:when>

                    <c:when test="${seatRow >= 31 && seatRow <= 49}">
                        <div class="seat ${seat.available ? 'available' : 'unavailable'}"
                             data-seat-number="${seat.seatNumber}"
                             data-available="${seat.available}"
                             onclick="selectSeat(this)">
                             ${seat.seatNumber}
                        </div>
                
                        <c:if test="${status.index % 3 == 2}">
                            <div class="aisle"></div>
                        </c:if>
                    </c:when>

                    <c:when test="${seatRow >= 50}">
                        <div class="seat ${seat.available ? 'available' : 'unavailable'}"
                             data-seat-number="${seat.seatNumber}"
                             data-available="${seat.available}"
                             onclick="selectSeat(this)">
                             ${seat.seatNumber}
                        </div>
                
                        <c:if test="${status.index % 3 == 2}">
                            <div class="aisle"></div>
                        </c:if>
                    </c:when>
                </c:choose>

                
                <c:if test="${status.last || seatRow != seats[status.index + 1].seatNumber.substring(0, seats[status.index + 1].seatNumber.length() - 1)}">
                    </div>
                </c:if>
            </c:forEach>
        

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

            console.log("Form data: ", selectedSeats);  // 디버깅용: 선택된 좌석 확인

            form.submit();  // 폼을 전송
            window.opener.updateSelectedSeats(selectedSeats);  // 부모 창에 선택 좌석 정보 전달
            window.close();  // 창 닫기
        }

    </script>
</body>
</html>