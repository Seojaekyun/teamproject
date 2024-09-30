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
                         <th>Available Seats</th> <!-- 추가된 컬럼 -->
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
            				<td>${flight.availableSeats}</td> <!-- 추가된 데이터 -->
            				<td>
                		<!-- 가는날 비행기 선택 시 오는날 비행기 조회 -->
               				 	<form action="${pageContext.request.contextPath}/flights/searchReturn" method="get">
               				 		<input type="hidden" name="selectedGoingFlightId" value="${flight.flightId}">
                    				<input type="hidden" name="selectedGoingFlightDeparture" value="${flight.departureAirport}">
                    				<input type="hidden" name="selectedGoingFlightArrival" value="${flight.arrivalAirport}">
                    				<input type="hidden" name="selectedGoingFlightTime" value="${flight.departureTime}">
                    				<input type="hidden" name="selectedGoingFlightArrivalTime" value="${flight.arrivalTime}">
                    				
                    				<input type="hidden" name="returnDate" value="${arrivalDate}"> <!-- returnDate 추가 -->

                    				<input type="hidden" name="seatClass" value="${seatClass}"> <!-- 추가된 숨겨진 필드 -->
                    				<input type="hidden" name="passengers" value="${passengers}"> <!-- 추가된 숨겨진 필드 -->
                    				<button type="submit" class="btn btn-primary select-flight-btn" 
                        				${flight.availableSeats < passengers ? 'disabled' : ''}>
                        					선택
                    </button>
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
                        <th>Available Seats</th> <!-- 추가된 컬럼 -->
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
                            <td>${flight.availableSeats}</td> <!-- 추가된 데이터 -->
                            
                            <td>
                            <!-- 선택된 가는편과 오는편 정보를 모두 확인 페이지로 전달 -->
                                <form action="${pageContext.request.contextPath}/flights/confirmSelection" method="post">
                                    <input type="hidden" name="selectedGoingFlightId" value="${selectedGoingFlightId}">
                                    <input type="hidden" name="selectedGoingFlightDeparture" value="${selectedGoingFlightDeparture}">
                                    <input type="hidden" name="selectedGoingFlightArrival" value="${selectedGoingFlightArrival}">
                                    <input type="hidden" name="selectedGoingFlightTime" value="${selectedGoingFlightTime}">
                                    <input type="hidden" name="selectedGoingFlightArrivalTime" value="${selectedGoingFlightArrivalTime}">
                                    <input type="hidden" name="seatClass" value="${seatClass}"> <!-- 추가된 숨겨진 필드 -->
                    				<input type="hidden" name="passengers" value="${passengers}"> <!-- 추가된 숨겨진 필드 -->
                                    
                                    <!-- 오는편 정보도 함께 넘김 -->
                                    <input type="hidden" name="selectedReturnFlightId" value="${flight.flightId}">
                                    <input type="hidden" name="selectedReturnFlightDeparture" value="${flight.departureAirport}">
                                    <input type="hidden" name="selectedReturnFlightArrival" value="${flight.arrivalAirport}">
                                    <input type="hidden" name="selectedReturnFlightTime" value="${flight.departureTime}">
                                    <input type="hidden" name="selectedReturnFlightArrivalTime" value="${flight.arrivalTime}">
                                    
                                    <button type="submit" class="btn btn-primary select-flight-btn">오는편 선택</button>
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
</body>
</html>
