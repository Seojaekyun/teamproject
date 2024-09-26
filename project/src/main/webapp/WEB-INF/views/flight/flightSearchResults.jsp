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


        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;

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
                                <form action="${pageContext.request.contextPath}/flights/confirmSelection" method="get">
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
                                    <input type="hidden" name="seatClass" value="${seatClass}"> <!-- 추가된 숨겨진 필드 -->
                    				<input type="hidden" name="passengers" value="${passengers}"> <!-- 추가된 숨겨진 필드 -->
                                    
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
