<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>항공편 검색 결과 - eLT항공</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
    /* 기본 스타일 설정 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    section {
        width: 100%;
        max-width: 1200px;
        margin: auto;
    }
    section header {
        background-color: #00467F;
        padding: 20px;
        text-align: center;
        color: white;
    }
    section header h1 {
        margin: 0;
        font-size: 26px;
    }
    section nav {
        background-color: #0059A3;
        padding: 10px;
        text-align: center;
    }
    section nav a {
        color: white;
        margin: 0 15px;
        text-decoration: none;
        font-size: 16px;
        transition: color 0.3s ease;
    }
    section nav a:hover {
        text-decoration: underline;
        color: #FFD700;
    }
    .container {
        max-width: 1200px;
        margin: 30px auto;
        background-color: white;
        padding: 30px;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
    }
    h2 {
        font-size: 26px;
        color: #00467F;
        margin-bottom: 20px;
        text-align: center;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
    }
    .flight-table th, .flight-table td {
        text-align: center;
    }
    .flight-table th {
        background-color: #0059A3;
        color: white;
    }
    .select-flight-btn {
    	font-size: 12px;
        padding: 3px 6px;
        background-color: #00467F;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    .select-flight-btn:hover {
        background-color: #003A66;
        transform: translateY(-2px);
    }
    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .container {
            padding: 20px;
        }
        h2 {
            font-size: 22px;
        }
        .select-flight-btn {
            width: 100%;
            text-align: center;
        }
    }
</style>
</head>
<body>
<section>
    <header>
        <h1>항공편 검색 결과</h1>
    </header>

    <nav>
        <a href="../main/index">홈</a>
        <a href="/flights/search">항공편 검색</a>
        <a href="/contact">고객센터</a>
    </nav>

    <div class="container">
        <h2>가는 비행기</h2>
        
        <!-- 가는날 비행기 목록 -->
        <c:if test="${not empty flights}">
            <table class="table table-bordered flight-table">
                <thead class="thead-dark">
                    <tr>
                        <th>Flight ID</th>
                        <th>출발 공항</th>
                        <th>도착 공항</th>
                        <th>출발 시간</th>
                        <th>도착 시간</th>
                        <th>비행 시간</th>
                        <th>Available Seats</th>
                        <th>선택</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="flight" items="${flights}">
                        <tr>
                            <td>${flight.flightId}</td>
                            <td>${flight.departureAirport}</td>
                            <td>${flight.arrivalAirport}</td>
                            <td>${flight.departureTime}</td>
                            <td>${flight.arrivalTime}</td>
                            <td>${flight.flightDuration}</td>
                            <td>${flight.availableSeats}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/flights/searchReturn" method="get">
                                    <input type="hidden" name="selectedGoingFlightId" value="${flight.flightId}">
                                    <input type="hidden" name="selectedGoingFlightDeparture" value="${flight.departureAirport}">
                                    <input type="hidden" name="selectedGoingFlightArrival" value="${flight.arrivalAirport}">
                                    <input type="hidden" name="selectedGoingFlightTime" value="${flight.departureTime}">
                                    <input type="hidden" name="selectedGoingFlightArrivalTime" value="${flight.arrivalTime}">
                                    <input type="hidden" name="returnDate" value="${arrivalDate}">
                                    <input type="hidden" name="seatClass" value="${seatClass}">
                                    <input type="hidden" name="passengers" value="${passengers}">
                                    <button type="submit" class="select-flight-btn" ${flight.availableSeats < passengers ? 'disabled' : ''}>선택</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- 오는날 비행기 목록 -->
        <c:if test="${not empty returnFlights}">
            <h2>오는 비행기</h2>
            <table class="table table-bordered flight-table">
                <thead class="thead-dark">
                    <tr>
                        <th>Flight ID</th>
                        <th>출발 공항</th>
                        <th>도착 공항</th>
                        <th>출발 시간</th>
                        <th>도착 시간</th>
                        <th>비행 시간</th>
                        <th>Available Seats</th>
                        <th>선택</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="flight" items="${returnFlights}">
                        <tr>
                            <td>${flight.flightId}</td>
                            <td>${flight.departureAirport}</td>
                            <td>${flight.arrivalAirport}</td>
                            <td>${flight.departureTime}</td>
                            <td>${flight.arrivalTime}</td>
                            <td>${flight.flightDuration}</td>
                            <td>${flight.availableSeats}</td>
                            <td>
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
                                    <button type="submit" class="select-flight-btn">선택</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- 결과가 없을 경우 -->
        <c:if test="${empty flights and empty returnFlights}">
            <p class="mt-4">검색 조건에 부합하는 항공편이 없습니다.</p>
        </c:if>
    </div>
</section>
</body>
</html>
