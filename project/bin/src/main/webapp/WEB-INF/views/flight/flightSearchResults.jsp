<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>항공편 검색 결과</title>
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #aaa;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">항공편 검색 결과</h1>
    <c:if test="${not empty flights}">
        <table>
            <tr>
                <th>항공편 ID</th>
                <th>출발 공항</th>
                <th>도착 공항</th>
                <th>출발 시간</th>
                <th>도착 시간</th>
                <th>비행 시간</th>
            </tr>
            <c:forEach var="flight" items="${flights}">
                <tr>
                    <td>${flight.flightId}</td>
                    <td>${flight.departureAirport}</td>
                    <td>${flight.arrivalAirport}</td>
                    <td>${flight.departureTime}</td>
                    <td>${flight.arrivalTime}</td>
                    <td>${flight.flightDuration}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty flights}">
        <p style="text-align: center;">조건에 맞는 항공편이 없습니다.</p>
    </c:if>
</body>
</html>