<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>항공편 검색 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        .flight-results {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .flight-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }
        .flight-card:last-child {
            border-bottom: none;
        }
        .flight-info {
            display: flex;
            justify-content: space-between;
            flex-grow: 2;
            margin-right: 20px;
        }
        .flight-info div {
            text-align: center;
        }
        .flight-time {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .flight-airport {
            font-size: 16px;
            color: #555;
        }
        .flight-duration {
            color: #999;
            margin-top: 5px;
            font-size: 14px;
        }
        .seat-options {
            display: flex;
            justify-content: space-around;
            flex-grow: 1;
        }
        .seat-option {
            text-align: center;
        }
        .seat-option .price {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .seat-option .label {
            font-size: 14px;
            color: #777;
        }
        .detail-button {
            background-color: #1a73e8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .detail-button:hover {
            background-color: #155ab2;
        }
    </style>
</head>
<body>
    <h1>항공편 검색 결과</h1>
    <c:if test="${not empty flights}">
        <div class="flight-results">
            <c:forEach var="flight" items="${flights}">
                <div class="flight-card">
                    <!-- Flight information -->
                    <div class="flight-info">
                        <div>
                            <div class="flight-time">${flight.departureTime}</div>
                            <div class="flight-airport">${flight.departureAirport}</div>
                        </div>
                        <div>
                            <div class="flight-duration">${flight.flightDuration}</div>
                        </div>
                        <div>
                            <div class="flight-time">${flight.arrivalTime}</div>
                            <div class="flight-airport">${flight.arrivalAirport}</div>
                        </div>
                    </div>

                    <!-- Seat pricing options -->
                    <div class="seat-options">
                        <div class="seat-option">
                            <div class="price">193,000 원</div>
                            <div class="label">일반석 세이버</div>
                        </div>
                        <div class="seat-option">
                            <div class="price">203,000 원</div>
                            <div class="label">일반석 스탠다드</div>
                        </div>
                        <div class="seat-option">
                            <div class="price">283,000 원</div>
                            <div class="label">일반석 플렉스</div>
                        </div>
                    </div>

                    <!-- Detail button -->
                    <div>
                        <button class="detail-button">상세 보기</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty flights}">
        <p style="text-align: center;">조건에 맞는 항공편이 없습니다.</p>
    </c:if>
</body>
</html>
