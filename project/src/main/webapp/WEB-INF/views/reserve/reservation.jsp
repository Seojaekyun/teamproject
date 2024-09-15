<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Reservation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
            color: #555;
        }
        select, input[type="text"], input[type="email"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>항공권 예약</h1>

        <form id="reservationForm" action="/reserve" method="post">
            <!-- 항공편 선택 -->
            <div class="form-group">
                <label for="flight_id">항공편 선택</label>
                <select name="flightId" id="flight_id" required onchange="fetchSeats(this.value)">
                    <option value="">-- Select a Flight --</option>
                    <c:forEach var="flight" items="${flights}">
                        <option value="${flight.flightId}">${flight.departureAirport} to ${flight.arrivalAirport} (Departure: ${flight.departureTime})</option>
                    </c:forEach>
                </select>
            </div>

            <!-- 좌석 선택 -->
            <div class="form-group">
                <label for="seat_number">좌석 선택</label>
                <select name="seat_number" id="seat_number" required>
                    <option value="">-- Select a Seat --</option>
                </select>
            </div>

            <!-- 고객 정보 입력 -->
            <div class="form-group">
                <label for="customer_id">Customer ID:</label>
                <input type="text" id="customer_id" name="customer_id" required placeholder="Enter your customer ID">
            </div>

            <div class="form-group">
                <label for="customer_name">Customer Name:</label>
                <input type="text" id="customer_name" name="customer_name" required placeholder="Enter your name">
            </div>

            <div class="form-group">
                <label for="customer_email">Customer Email:</label>
                <input type="email" id="customer_email" name="customer_email" required placeholder="Enter your email">
            </div>

            <!-- 좌석 클래스 선택 -->
            <div class="form-group">
                <label for="seat_class"> Class </label>
                <select name="seat_class" id="seat_class" required>
                    <option value="Economy">Economy</option>
                    <option value="Business">Business</option>
                    <option value="First">First Class</option>
                </select>
            </div>

            <input type="submit" value="Reserve">
        </form>
    </div>

    <script>
        function fetchSeats(flightId) {
            if (flightId) {
                fetch(`/reserve/seats?flightId=` + flightId)
                    .then(response => response.json())
                    .then(data => {
                        let seatSelect = document.getElementById('seat_number');
                        seatSelect.innerHTML = '<option value="">-- Select a Seat --</option>';  // 초기화
                        data.forEach(seat => {
                            let option = document.createElement('option');
                            option.value = seat.seatNumber;
                            option.text = seat.seatNumber + ' (' + seat.seatClass + ')';
                            seatSelect.add(option);
                        });
                    })
                    .catch(error => console.error('Error fetching seats:', error));
            } else {
                document.getElementById('seat_number').innerHTML = '<option value="">-- Select a Seat --</option>';
            }
        }
    </script>
</body>
</html>