<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석 선택</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        .seat {
            display: inline-block;
            width: 50px;
            height: 50px;
            margin: 5px;
            border: 1px solid #000;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
        }
        .available {
            background-color: #28a745;
        }
        .unavailable {
            background-color: #dc3545;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4">좌석 선택</h2>
        <p>선택된 좌석 등급: ${seatClass}</p>
        <p>비행기 ID: ${flightId}</p>
        
        <!-- 좌석 목록 표시 -->
        <div id="seatsContainer">
            <c:forEach var="seat" items="${seats}">
                <!-- 수정 후 -->
					<div class="seat ${seat.available ? 'available' : 'unavailable'}">
    					${seat.seatNumber}
					</div>
            </c:forEach>
        </div>
        
        <button class="btn btn-primary mt-4" onclick="window.close();">선택 완료</button>
    </div>
</body>
</html>
