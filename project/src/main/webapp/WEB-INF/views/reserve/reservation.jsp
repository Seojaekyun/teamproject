<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Reservation</title>
    <style>

       section .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
       section h1 {
            text-align: center;
            color: #333;
        }
       section label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
       section select, input[type="text"], input[type="email"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
       section input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
       section input[type="submit"]:hover {
            background-color: #218838;
        }
       section .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<section>
    <h1>항공권 예약</h1>

    <form action="/reserve" method="post">
       <!-- 항공편 선택 -->
    <label for="flight_id">Select Flight:</label>
    <select name="flight_id" id="flight_id" required>
        <option value="">-- Select a Flight --</option>  <!-- 기본적으로 비어 있는 항목이 없도록 함 -->
        <c:forEach var="flight" items="${flights}">
            <option value="${flight.flightId}">${flight.departureAirport} to ${flight.arrivalAirport} (Departure: ${flight.departureTime})</option>
        </c:forEach>
    </select>
    <br><br>

        <!-- 좌석 선택 -->
<label for="seat_number">Select Seat:</label>
<select name="seat_number" id="seat_number" required>
    <option value="">-- Select a Seat --</option>
    <c:forEach var="seat" items="${availableSeats}">
        <option value="${seat.seatNumber}">${seat.seatNumber}</option>
    </c:forEach>
</select>

<!-- 데이터가 없는 경우 확인용 메시지 -->
<c:if test="${empty availableSeats}">
    <p>No seats .</p>
</c:if>





        <!-- 나머지 예약 관련 필드 (좌석 클래스, 고객 정보) -->
        <label for="seat_class">Select Seat Class:</label>
        <select name="seat_class" id="seat_class" required>
            <option value="Economy">Economy</option>
            <option value="Business">Business</option>
            <option value="First">First Class</option>
        </select>
        <br><br>

        <!-- 고객 정보 입력 -->
        <label for="customer_id">Customer ID:</label>
        <input type="text" id="customer_id" name="customer_id" required placeholder="Enter your customer ID">
        <br><br>

        <label for="customer_name">Customer Name:</label>
        <input type="text" id="customer_name" name="customer_name" required placeholder="Enter your full name">
        <br><br>

        <label for="customer_email">Customer Email:</label>
        <input type="email" id="customer_email" name="customer_email" required placeholder="Enter your email">
        <br><br>

        <!-- 예약 제출 -->
        <input type="submit" value="Reserve">
    </form>
    </div>
</section>
</body>
</html>