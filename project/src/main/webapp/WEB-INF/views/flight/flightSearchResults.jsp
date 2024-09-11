<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Search Results</title>
</head>
<body>

<h2>검색된 항공편</h2>
<table border="1">
    <tr>
        <th>항공편 번호</th>
        <th>출발지</th>
        <th>도착지</th>
        <th>출발 시간</th>
        <th>도착 시간</th>
    </tr>
    <c:forEach var="flight" items="${flights}">
        <tr>
            <td>${flight.flight_number}</td>
            <td>${flight.departure_airport}</td>
            <td>${flight.arrival_airport}</td>
            <td>${flight.departure_time}</td>
            <td>${flight.arrival_time}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
