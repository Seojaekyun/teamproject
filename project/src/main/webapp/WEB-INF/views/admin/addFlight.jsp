<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.demo.dto.AirportsDto" %>
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
    // 출발지와 도착지의 시간대 정보를 저장할 변수
    var departureTimezone = "";
    var arrivalTimezone = "";

    // 패드 제로 함수
    function padZero(value) {
        return ("0" + value).slice(-2);
    }

    // 귀국편 공항 설정 함수
    function setReturnFlightAirports() {
        var departureAirport = document.getElementById("departureAirport").value;
        var arrivalAirport = document.getElementById("arrivalAirport").value;
        document.getElementById("returnDepartureAirport").value = arrivalAirport || "";
        document.getElementById("returnArrivalAirport").value = departureAirport || "";
    }

    // 도착 공항 목록 갱신 함수
    function updateArrivalAirports() {
        var departureAirport = document.getElementById("departureAirport").value;
        var arrivalAirportSelect = document.getElementById("arrivalAirport");

        // 기존 옵션 제거
        arrivalAirportSelect.innerHTML = "";

        // 공항 데이터를 JavaScript 배열로 전달
        var airports = [
        <c:forEach var="airport" items="${airports}" varStatus="status">
            { code: '${airport.airportCode}', name: '${airport.airportName}' }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

        if (departureAirport === "ICN" || departureAirport === "GMP") {
            // 출발 공항이 ICN 또는 GMP인 경우
            airports.forEach(function(airport) {
                if (airport.code !== "ICN" && airport.code !== "GMP") {
                    var option = document.createElement("option");
                    option.value = airport.code;
                    option.text = airport.name;
                    arrivalAirportSelect.appendChild(option);
                }
            });
        } else {
            // 출발 공항이 ICN 또는 GMP가 아닌 경우
            var options = [
                { code: "ICN", name: "인천 국제공항" },
                { code: "GMP", name: "김포 국제공항" }
            ];
            options.forEach(function(airport) {
                var option = document.createElement("option");
                option.value = airport.code;
                option.text = airport.name;
                arrivalAirportSelect.appendChild(option);
            });
        }

        // 귀국편 공항 설정 및 시간대 정보 가져오기
        setReturnFlightAirports();
        fetchTimezones();
    }

    // 시간대 정보를 가져오는 함수
    function fetchTimezones() {
        var departureAirport = document.getElementById("departureAirport").value;
        var arrivalAirport = document.getElementById("arrivalAirport").value;

        if (!departureAirport || !arrivalAirport) {
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/admin/getTimezones?departureAirport=" + departureAirport + "&arrivalAirport=" + arrivalAirport, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                departureTimezone = response.departureTimezone;
                arrivalTimezone = response.arrivalTimezone;

                // 비행 시간 및 도착 시간 계산
                fetchFlightTime();
            }
        };
        xhr.send();
    }

    // 비행 시간을 가져오는 함수
    function fetchFlightTime() {
        var departureAirport = document.getElementById("departureAirport").value;
        var arrivalAirport = document.getElementById("arrivalAirport").value;

        if (!departureAirport || !arrivalAirport) {
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/admin/getFlightTime?departureAirport=" + departureAirport + "&arrivalAirport=" + arrivalAirport, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                var flightHour = response.hour;
                var flightMinute = response.minute;

                // 출발편 비행 시간 설정
                document.getElementById("flightHour").value = flightHour;
                document.getElementById("flightMinute").value = flightMinute;
                document.getElementById("flightTimeDisplay").value = padZero(flightHour) + "시간 " + padZero(flightMinute) + "분";

                // 귀국편 비행 시간도 동일하게 설정
                document.getElementById("returnFlightHour").value = flightHour;
                document.getElementById("returnFlightMinute").value = flightMinute;
                document.getElementById("returnFlightTimeDisplay").value = padZero(flightHour) + "시간 " + padZero(flightMinute) + "분";

                // 도착 시간 계산
                calculateDepartureArrivalTime();
                calculateReturnArrivalTime();
            }
        };
        xhr.send();
    }
 // 기존 코드...

 // 비행 시간을 가져오는 함수
 function fetchFlightTime() {
     var departureAirport = document.getElementById("departureAirport").value;
     var arrivalAirport = document.getElementById("arrivalAirport").value;

     if (!departureAirport || !arrivalAirport) {
         return;
     }

     var xhr = new XMLHttpRequest();
     xhr.open("GET", "/admin/getFlightTime?departureAirport=" + departureAirport + "&arrivalAirport=" + arrivalAirport, true);
     xhr.onreadystatechange = function() {
         if (xhr.readyState === 4 && xhr.status === 200) {
             var response = JSON.parse(xhr.responseText);
             var flightHour = response.hour;
             var flightMinute = response.minute;

             // 출발편 비행 시간 설정
             document.getElementById("flightHour").value = flightHour;
             document.getElementById("flightMinute").value = flightMinute;
             document.getElementById("flightTimeDisplay").value = padZero(flightHour) + "시간 " + padZero(flightMinute) + "분";

             // 비행 시간 계산 후
             var totalFlightMinutes = (flightHour * 60) + flightMinute;
             var hours = Math.floor(totalFlightMinutes / 60);
             var minutes = totalFlightMinutes % 60;
             var flightTimeValue = padZero(hours) + ":" + padZero(minutes) + ":00";

             // 숨겨진 입력 필드에 값 설정
             document.getElementById("flightTime").value = flightTimeValue;

             // 귀국편 비행 시간도 동일하게 설정
             document.getElementById("returnFlightHour").value = flightHour;
             document.getElementById("returnFlightMinute").value = flightMinute;
             document.getElementById("returnFlightTimeDisplay").value = padZero(flightHour) + "시간 " + padZero(flightMinute) + "분";

             // 귀국편 비행 시간 계산 후
             var returnTotalFlightMinutes = (flightHour * 60) + flightMinute;
             var returnHours = Math.floor(returnTotalFlightMinutes / 60);
             var returnMinutes = returnTotalFlightMinutes % 60;
             var returnFlightTimeValue = padZero(returnHours) + ":" + padZero(returnMinutes) + ":00";

             // 숨겨진 입력 필드에 값 설정
             document.getElementById("returnFlightTime").value = returnFlightTimeValue;

             // 도착 시간 계산
             calculateDepartureArrivalTime();
             calculateReturnArrivalTime();
         }
     };
     xhr.send();
 }

 // 나머지 기존 코드...


    // 도착 시간을 시간대 차이를 고려하여 계산하는 함수
    function calculateArrivalTime(departureDateId, departureHourId, departureMinuteId, flightHourId, flightMinuteId, arrivalTimeId, depTimezone, arrTimezone) {
        var departureDate = document.getElementById(departureDateId).value;
        var departureHour = parseInt(document.getElementById(departureHourId).value);
        var departureMinute = parseInt(document.getElementById(departureMinuteId).value);
        var flightHour = parseInt(document.getElementById(flightHourId).value);
        var flightMinute = parseInt(document.getElementById(flightMinuteId).value);

        if (!departureDate || isNaN(departureHour) || isNaN(departureMinute) || isNaN(flightHour) || isNaN(flightMinute) || !depTimezone || !arrTimezone) {
            return;
        }

        var departureDateTime = departureDate + " " + padZero(departureHour) + ":" + padZero(departureMinute);
        var departureMoment = moment.tz(departureDateTime, "YYYY-MM-DD HH:mm", depTimezone);

        departureMoment.add(flightHour, 'hours').add(flightMinute, 'minutes');

        var arrivalMoment = departureMoment.clone().tz(arrTimezone);

        var arrivalTimeStr = arrivalMoment.format('YYYY-MM-DD HH:mm');
        document.getElementById(arrivalTimeId).value = arrivalTimeStr;
    }

    // 출발편 도착 시간 계산 함수
    function calculateDepartureArrivalTime() {
        calculateArrivalTime("departureDate", "departureHour", "departureMinute", "flightHour", "flightMinute", "arrivalTime", departureTimezone, arrivalTimezone);
    }

    // 귀국편 도착 시간 계산 함수
    function calculateReturnArrivalTime() {
        calculateArrivalTime("returnDepartureDate", "returnDepartureHour", "returnDepartureMinute", "returnFlightHour", "returnFlightMinute", "returnArrivalTime", arrivalTimezone, departureTimezone);
    }

    // 폼 제출 전에 시간 결합
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

    // 이벤트 리스너 등록
    window.onload = function() {
        // 출발 공항 변경 시
        document.getElementById("departureAirport").addEventListener("change", function() {
            updateArrivalAirports();
            fetchTimezones();
        });

        // 도착 공항 변경 시
        document.getElementById("arrivalAirport").addEventListener("change", function() {
            setReturnFlightAirports();
            fetchTimezones();
        });

        // 출발편 날짜 및 시간 변경 시
        var departureFields = ["departureDate", "departureHour", "departureMinute"];
        departureFields.forEach(function(field) {
            document.getElementById(field).addEventListener("change", calculateDepartureArrivalTime);
        });

        // 귀국편 날짜 및 시간 변경 시
        var returnFields = ["returnDepartureDate", "returnDepartureHour", "returnDepartureMinute"];
        returnFields.forEach(function(field) {
            document.getElementById(field).addEventListener("change", calculateReturnArrivalTime);
        });

        // 초기화
        updateArrivalAirports();
    };
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.40/moment-timezone-with-data.min.js"></script>
</head>
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
                    <!-- Arrival airports will be populated dynamically -->
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
                <!-- Hidden flight time inputs -->
                <input type="hidden" id="flightHour" name="flightHour">
                <input type="hidden" id="flightMinute" name="flightMinute">
                <!-- Display flight time -->
                <label for="flightTimeDisplay">비행 시간:</label>
                <input type="text" id="flightTimeDisplay" name="ftime" readonly>
                <!-- 비행 시간 저장을 위한 숨겨진 필드 -->
                <input type="hidden" id="flightTime" name="ftimeValue">
                
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
                <!-- Hidden return flight time inputs -->
                <input type="hidden" id="returnFlightHour" name="returnFlightHour">
                <input type="hidden" id="returnFlightMinute" name="returnFlightMinute">
                <!-- Display return flight time -->
                <label for="returnFlightTimeDisplay">비행 시간:</label>
                <input type="text" id="returnFlightTimeDisplay" name="returnFtime" readonly>
                <!-- 귀국편 비행 시간 저장을 위한 숨겨진 필드 -->
                <input type="hidden" id="returnFlightTime" name="returnFtimeValue">
                
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
