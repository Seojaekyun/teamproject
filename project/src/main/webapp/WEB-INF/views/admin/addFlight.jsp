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
    // Function to pad zeros
    function padZero(value) {
        return ("0" + value).slice(-2);
    }
    
    // Function to calculate arrival time
    function calculateArrivalTime(departureDateId, departureHourId, departureMinuteId, flightHourId, flightMinuteId, arrivalTimeId) {
        var departureDate = document.getElementById(departureDateId).value;
        var departureHour = parseInt(document.getElementById(departureHourId).value);
        var departureMinute = parseInt(document.getElementById(departureMinuteId).value);
        var flightHour = parseInt(document.getElementById(flightHourId).value);
        var flightMinute = parseInt(document.getElementById(flightMinuteId).value);
        
        if (!departureDate || isNaN(departureHour) || isNaN(departureMinute) || isNaN(flightHour) || isNaN(flightMinute)) {
            return;
        }

        var totalFlightMinutes = (flightHour * 60) + flightMinute;
        var totalDepartureMinutes = (departureHour * 60) + departureMinute;
        var totalArrivalMinutes = totalDepartureMinutes + totalFlightMinutes;
        var arrivalDays = Math.floor(totalArrivalMinutes / (24 * 60));
        totalArrivalMinutes = totalArrivalMinutes % (24 * 60);
        var arrivalHour = Math.floor(totalArrivalMinutes / 60);
        var arrivalMinute = totalArrivalMinutes % 60;
        var departureDateObj = new Date(departureDate);
        departureDateObj.setDate(departureDateObj.getDate() + arrivalDays);
        var arrivalDate = departureDateObj.getFullYear() + "-" + padZero(departureDateObj.getMonth() + 1) + "-" + padZero(departureDateObj.getDate());
        document.getElementById(arrivalTimeId).value = arrivalDate + " " + padZero(arrivalHour) + ":" + padZero(arrivalMinute);
    }
    
    // Function to set return flight airports
    function setReturnFlightAirports() {
        var departureAirport = document.getElementById("departureAirport").value;
        var arrivalAirport = document.getElementById("arrivalAirport").value;
        document.getElementById("returnDepartureAirport").value = arrivalAirport || "";
        document.getElementById("returnArrivalAirport").value = departureAirport || "";
    }
    
    // Function to update arrival airports
    function updateArrivalAirports() {
        var departureAirport = document.getElementById("departureAirport").value;
        var arrivalAirportSelect = document.getElementById("arrivalAirport");
        arrivalAirportSelect.innerHTML = "";
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
            var optionICN = document.createElement("option");
            optionICN.value = "ICN";
            optionICN.text = "인천 국제공항";
            arrivalAirportSelect.appendChild(optionICN);
            var optionGMP = document.createElement("option");
            optionGMP.value = "GMP";
            optionGMP.text = "김포 국제공항";
            arrivalAirportSelect.appendChild(optionGMP);
        }
        setReturnFlightAirports();
        fetchFlightTime();
        fetchReturnFlightTime();
    }
    
    // Function to fetch flight time for departure flight
    function fetchFlightTime() {
        var departureAirport = document.getElementById("departureAirport").value;
        var arrivalAirport = document.getElementById("arrivalAirport").value;

        if (!departureAirport || !arrivalAirport) {
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/admin/getFlightTime?departureAirport=" + departureAirport + "&arrivalAirport=" + arrivalAirport, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                var flightHour = response.hour;
                var flightMinute = response.minute;

                document.getElementById("flightHour").value = flightHour;
                document.getElementById("flightMinute").value = flightMinute;
                document.getElementById("flightTimeDisplay").value = padZero(flightHour) + "시간 " + padZero(flightMinute) + "분";

                calculateArrivalTime("departureDate", "departureHour", "departureMinute", "flightHour", "flightMinute", "arrivalTime");
            }
        };
        xhr.send();
    }

    // Function to fetch flight time for return flight
    function fetchReturnFlightTime() {
        var departureAirport = document.getElementById("returnDepartureAirport").value;
        var arrivalAirport = document.getElementById("returnArrivalAirport").value;

        if (!departureAirport || !arrivalAirport) {
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/admin/getFlightTime?departureAirport=" + departureAirport + "&arrivalAirport=" + arrivalAirport, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                var flightHour = response.hour;
                var flightMinute = response.minute;

                document.getElementById("returnFlightHour").value = flightHour;
                document.getElementById("returnFlightMinute").value = flightMinute;
                document.getElementById("returnFlightTimeDisplay").value = padZero(flightHour) + "시간 " + padZero(flightMinute) + "분";

                calculateArrivalTime("returnDepartureDate", "returnDepartureHour", "returnDepartureMinute", "returnFlightHour", "returnFlightMinute", "returnArrivalTime");
            }
        };
        xhr.send();
    }

    // Function to combine times before submitting the form
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
    
    // Event listeners
    window.onload = function() {
        var departureFields = ["departureDate", "departureHour", "departureMinute"];
        departureFields.forEach(function(field) {
            document.getElementById(field).addEventListener("change", function() {
                calculateArrivalTime("departureDate", "departureHour", "departureMinute", "flightHour", "flightMinute", "arrivalTime");
            });
        });
        
        var returnFields = ["returnDepartureDate", "returnDepartureHour", "returnDepartureMinute"];
        returnFields.forEach(function(field) {
            document.getElementById(field).addEventListener("change", function() {
                calculateArrivalTime("returnDepartureDate", "returnDepartureHour", "returnDepartureMinute", "returnFlightHour", "returnFlightMinute", "returnArrivalTime");
            });
        });
        document.getElementById("departureAirport").addEventListener("change", updateArrivalAirports);
        document.getElementById("arrivalAirport").addEventListener("change", function() {
            setReturnFlightAirports();
            fetchFlightTime();
            fetchReturnFlightTime();
        });
        updateArrivalAirports();
        fetchFlightTime();
        fetchReturnFlightTime();
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
                <input type="text" id="flightTimeDisplay" readonly>
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
                <input type="text" id="returnFlightTimeDisplay" readonly>
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
