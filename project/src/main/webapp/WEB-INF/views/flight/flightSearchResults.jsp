<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공편 검색 결과 - eLT항공</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        .flight-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .flight-box:hover {
            transform: scale(1.02);
        }
        .flight-details {
            display: flex;
            align-items: center;
        }
        .flight-info {
            margin-right: 30px;
        }
        .flight-time {
            text-align: center;
        }
        .select-flight-btn {
            align-self: flex-end;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4">항공편 검색 결과</h2>
        
        <!-- 가는날 비행기 목록 -->
        <c:if test="${not empty flights}">
            <h4 class="mt-4">가는 날 비행기</h4>
            <c:forEach var="flight" items="${flights}">
                <div class="flight-box">
                    <div class="flight-details">
                        <div class="flight-info">
                            <p><strong>Flight ID:</strong> ${flight.flightId}</p>
                        </div>
                        <div class="flight-time">
                            <p><strong>${flight.departureTime}</strong> → <strong>${flight.arrivalTime}</strong></p>
                            <p>${flight.flightDuration}</p>
                            <p>${flight.departureAirport} → ${flight.arrivalAirport}</p>
                        </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/flights/searchReturn" method="get">
                        <input type="hidden" name="selectedGoingFlightId" value="${flight.flightId}">
                        <input type="hidden" name="selectedGoingFlightDeparture" value="${flight.departureAirport}">
                        <input type="hidden" name="selectedGoingFlightArrival" value="${flight.arrivalAirport}">
                        <input type="hidden" name="selectedGoingFlightTime" value="${flight.departureTime}">
                        <input type="hidden" name="selectedGoingFlightArrivalTime" value="${flight.arrivalTime}">
                        <input type="hidden" name="returnDate" value="${arrivalDate}">
                        <input type="hidden" name="seatClass" value="${seatClass}">
                        <input type="hidden" name="passengers" value="${passengers}">
                        <button type="submit" class="btn btn-primary select-flight-btn">
                            선택
                        </button>
                    </form>
                </div>
            </c:forEach>
        </c:if>
        
        <!-- 오는날 비행기 목록 -->
        <c:if test="${not empty returnFlights}">
            <h4 class="mt-4">오는 날 비행기</h4>
            <c:forEach var="flight" items="${returnFlights}">
                <div class="flight-box">
                    <div class="flight-details">
                        <div class="flight-info">
                            <p><strong>Flight ID:</strong> ${flight.flightId}</p>
                        </div>
                        <div class="flight-time">
                            <p><strong>${flight.departureTime}</strong> → <strong>${flight.arrivalTime}</strong></p>
                            <p>${flight.flightDuration}</p>
                            <p>${flight.departureAirport} → ${flight.arrivalAirport}</p>
                        </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/flights/confirmSelection" method="post">
                        <input type="hidden" name="selectedGoingFlightId" value="${selectedGoingFlightId}">
                        <input type="hidden" name="selectedGoingFlightDeparture" value="${selectedGoingFlightDeparture}">
                        <input type="hidden" name="selectedGoingFlightArrival" value="${selectedGoingFlightArrival}">
                        <input type="hidden" name="selectedGoingFlightTime" value="${selectedGoingFlightTime}">
                        <input type="hidden" name="selectedGoingFlightArrivalTime" value="${selectedGoingFlightArrivalTime}">
                        <input type="hidden" name="seatClass" value="${seatClass}">
                        <input type="hidden" name="passengers" value="${passengers}">
                        <input type="hidden" name="selectedReturnFlightId" value="${flight.flightId}">
                        <input type="hidden" name="selectedReturnFlightDeparture" value="${flight.departureAirport}">
                        <input type="hidden" name="selectedReturnFlightArrival" value="${flight.arrivalAirport}">
                        <input type="hidden" name="selectedReturnFlightTime" value="${flight.departureTime}">
                        <input type="hidden" name="selectedReturnFlightArrivalTime" value="${flight.arrivalTime}">
                        <button type="submit" class="btn btn-primary select-flight-btn">오는편 선택</button>
                    </form>
                </div>
            </c:forEach>
        </c:if>

        <!-- 결과가 없을 경우 -->
        <c:if test="${empty flights and empty returnFlights}">
            <p class="mt-4">검색 조건에 부합하는 항공편이 없습니다.</p>
        </c:if>
    </div>
</body>
</html>
