<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공편 검색 결과 - eLT항공</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        /* 간단한 스타일 추가 */
        .flight-table {
            margin-top: 30px;
        }
        .select-flight-btn {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4">항공편 검색 결과</h2>
        
        <!-- 가는날 비행기 목록 -->
        <c:if test="${not empty flights}">
            <h4 class="mt-4">가는 날 비행기</h4>
            <table class="table table-bordered flight-table">
                <thead class="thead-dark">
                    <tr>
                        <th>Flight ID</th>
                        <th>출발 공항</th>
                        <th>도착 공항</th>
                        <th>출발 시간</th>
                        <th>도착 시간</th>
                        <th>비행 시간</th>
                        <th>항공기 ID</th>
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
                            <td>${flight.airplaneId}</td>
                            <td>
                                <!-- 가는날 비행기 선택 시 오는날 비행기 조회 -->
                                <form action="${pageContext.request.contextPath}/flights/searchReturn" method="get">
                                    <input type="hidden" name="selectedDeparture" value="${flight.arrivalAirport}">
                                    <input type="hidden" name="selectedArrival" value="${flight.departureAirport}">
                                    <input type="hidden" name="returnDate" value="${arrivalDate}">
                                    <button type="submit" class="btn btn-primary select-flight-btn">선택</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- 오는날 비행기 목록 -->
        <c:if test="${not empty returnFlights}">
            <h4 class="mt-4">오는 날 비행기</h4>
            <table class="table table-bordered flight-table">
                <thead class="thead-dark">
                    <tr>
                        <th>Flight ID</th>
                        <th>출발 공항</th>
                        <th>도착 공항</th>
                        <th>출발 시간</th>
                        <th>도착 시간</th>
                        <th>비행 시간</th>
                        <th>항공기 ID</th>
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
                            <td>${flight.airplaneId}</td>
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
</body>
</html>
