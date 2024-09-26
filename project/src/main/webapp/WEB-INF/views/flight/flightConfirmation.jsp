<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공편 선택 확인 - eLT항공</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">항공편 선택 확인</h2>
        
        <!-- 가는편 정보 -->
        <h4>가는편 비행기</h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Flight ID</th>
                    <th>출발 공항</th>
                    <th>도착 공항</th>
                    <th>출발 시간</th>
                    <th>도착 시간</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${selectedGoingFlightId}</td>
                    <td>${selectedGoingFlightDeparture}</td>
                    <td>${selectedGoingFlightArrival}</td>
                    <td>${selectedGoingFlightTime}</td>
                    <td>${selectedGoingFlightArrivalTime}</td>
                </tr>
            </tbody>
        </table>

        <!-- 오는편 정보 -->
        <h4>오는편 비행기</h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Flight ID</th>
                    <th>출발 공항</th>
                    <th>도착 공항</th>
                    <th>출발 시간</th>
                    <th>도착 시간</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${selectedReturnFlightId}</td>
                    <td>${selectedReturnFlightDeparture}</td>
                    <td>${selectedReturnFlightArrival}</td>
                    <td>${selectedReturnFlightTime}</td>
                    <td>${selectedReturnFlightArrivalTime}</td>
                </tr>
            </tbody>
        </table>

        <!-- 예약 버튼 -->
        <form action="${pageContext.request.contextPath}/flights/booking" method="post">
            <input type="hidden" name="goingFlightId" value="${selectedGoingFlightId}">
            <input type="hidden" name="returnFlightId" value="${selectedReturnFlightId}">
            <button type="submit" class="btn btn-success">예약하기</button>
        </form>
    </div>
</body>
</html>
