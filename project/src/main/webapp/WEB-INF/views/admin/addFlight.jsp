<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>항공편 추가</title>
    <script type="text/javascript">
        // 두 자리 숫자로 변환하는 함수 (한 자리 숫자일 경우 앞에 0을 추가)
        function padZero(value) {
            return ("0" + value).slice(-2);
        }

        // 출발 시간과 비행 시간을 더해 도착 시간을 계산하는 함수
        function calculateArrivalTime() {
            var departureDate = document.getElementById("departureDate").value;
            var departureHour = padZero(document.getElementById("departureHour").value);
            var departureMinute = padZero(document.getElementById("departureMinute").value);
            var flightHour = document.getElementById("flightHour").value;
            var flightMinute = document.getElementById("flightMinute").value;

            if (!departureDate || !departureHour || !departureMinute || !flightHour || !flightMinute) {
                return;
            }

            var departureDateTime = new Date(departureDate + "T" + departureHour + ":" + departureMinute + ":00");

            var totalFlightMinutes = parseInt(flightHour) * 60 + parseInt(flightMinute);
            departureDateTime.setMinutes(departureDateTime.getMinutes() + totalFlightMinutes);

            var arrivalDate = departureDateTime.toLocaleDateString('ko-KR');
            var arrivalHour = padZero(departureDateTime.getHours());
            var arrivalMinute = padZero(departureDateTime.getMinutes());

            document.getElementById("arrivalTime").value = arrivalDate + " " + arrivalHour + ":" + arrivalMinute;
        }

        function combineTime() {
            var departureHour = padZero(document.getElementById("departureHour").value);
            var departureMinute = padZero(document.getElementById("departureMinute").value);
            var departureDate = document.getElementById("departureDate").value;
            document.getElementById("departureTime").value = departureDate + " " + departureHour + ":" + departureMinute + ":00";
        }

        // 출발지와 도착지 필터링
        function filterArrivalAirports() {
            var departureAirport = document.getElementById("departureAirport").value;
            var arrivalAirportSelect = document.getElementById("arrivalAirport");

            // 기존 도착지 목록 초기화
            arrivalAirportSelect.innerHTML = "";

            // 출발지가 ICN 또는 GMP일 경우 ICN과 GMP를 제외한 도착지 목록을 추가
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
            // 출발지가 ICN 또는 GMP가 아닐 경우 도착지는 ICN과 GMP만 추가
            else {
                var optionICN = document.createElement("option");
                optionICN.value = "ICN";
                optionICN.text = "인천 국제공항 (ICN)";
                arrivalAirportSelect.appendChild(optionICN);

                var optionGMP = document.createElement("option");
                optionGMP.value = "GMP";
                optionGMP.text = "김포 국제공항 (GMP)";
                arrivalAirportSelect.appendChild(optionGMP);
            }
        }

        // 페이지가 로드되면 이벤트 리스너를 등록
        window.onload = function() {
            document.getElementById("departureDate").addEventListener("change", calculateArrivalTime);
            document.getElementById("departureHour").addEventListener("change", calculateArrivalTime);
            document.getElementById("departureMinute").addEventListener("change", calculateArrivalTime);
            document.getElementById("flightHour").addEventListener("change", calculateArrivalTime);
            document.getElementById("flightMinute").addEventListener("change", calculateArrivalTime);
            document.getElementById("departureAirport").addEventListener("change", filterArrivalAirports);  // 출발 공항 변경 시 도착 공항 필터링
        };
    </script>
</head>
<body>
    <h2>항공편 추가</h2>
    <form action="/admin/addFlight" method="post" onsubmit="combineTime()">
        <label for="departureAirport">출발 공항:</label>
        <select id="departureAirport" name="departureAirport" required>
            <option value="">선택</option>
            <c:forEach var="airport" items="${airports}">
                <option value="${airport.airportCode}">${airport.airportName}</option>
            </c:forEach>
        </select><br><br>

        <label for="arrivalAirport">도착 공항:</label>
        <select id="arrivalAirport" name="arrivalAirport" required>
            <!-- 도착 공항 목록은 자바스크립트로 동적으로 설정됩니다 -->
        </select><br><br>

        <label for="departureDate">출발 날짜:</label>
        <input type="date" id="departureDate" name="departureDate" required><br><br>

        <label for="departureHour">출발 시간 (시):</label>
        <select id="departureHour" required>
            <c:forEach var="hour" begin="0" end="23">
                <option value="${hour}">${hour}</option>
            </c:forEach>
        </select>

        <label for="departureMinute">출발 시간 (분):</label>
        <select id="departureMinute" required>
            <option value="00">00</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="30">30</option>
            <option value="40">40</option>
            <option value="50">50</option>
        </select><br><br>

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
        </select><br><br>

        <label for="arrivalTime">도착 시간:</label>
        <textarea id="arrivalTime" name="arrivalTime" readonly style="width: 300px; height: 30px;"></textarea><br><br>

        <!-- Hidden input to hold the final combined time -->
        <input type="hidden" id="departureTime" name="departureTime">

        <label for="airplaneId">비행기 ID:</label>
        <select id="airplaneId" name="airplaneId" required>
            <c:forEach var="airplane" items="${airplanes}">
                <option value="${airplane.airplaneId}">${airplane.model}</option>
            </c:forEach>
        </select><br><br>

        <button type="submit">항공편 추가</button>
    </form>
</body>
</html>