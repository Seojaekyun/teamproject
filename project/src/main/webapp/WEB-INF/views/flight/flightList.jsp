<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 확인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }
    section header {
		background-color: #00467F;
		padding: 20px;
		text-align: center;
		color: white;
	}
	section header h1 {
		margin: 0;
		font-size: 24px;
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
	}
	section nav a:hover {
		text-decoration: underline;
	}
    .container {
        margin-top: 20px;
        padding: 20px;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }
    h2 {
        font-size: 24px;
        color: #00467F;
        margin-bottom: 20px;
        text-align: center;
    }
    table {
        width: 100%;
        margin-bottom: 20px;
    }
    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #00467F;
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a {
        color: #00467F;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
        margin: 0 2px;
        border-radius: 5px;
    }
    .pagination a:hover {
        background-color: #00467F;
        color: white;
    }
    .pagination .active {
        background-color: #00467F;
        color: white;
        border: 1px solid #00467F;
    }
    .filter-section {
        margin-bottom: 20px;
    }
    .filter-section label {
        font-weight: bold;
    }
    select, input[type="text"] {
        margin-left: 10px;
        padding: 5px;
    }
</style>
<script>
$(function() {
    // 오늘 날짜 기본 설정 (기존 선택된 값이 없을 때만 설정)
    if ($("#selectedDate").val() === "") {
        var today = new Date().toISOString().split('T')[0];
        $("#selectedDate").val(today);
    }

    // jQuery UI 날짜 선택기
    $("#selectedDate").datepicker({
        dateFormat: "yy-mm-dd",
        onSelect: function() {
            document.getElementById("filterForm").submit();
        }
    });
});

</script>
</head>
<body>
<section>
	<header>
		<h1>운항 정보</h1>
	</header>
	<nav>
		<a href="../reserve/reservation">항공권 예약</a>
		<a href="../reserve/reserveInfo">예약 조회</a>
		<a href="">체크인</a>
		<a href="../flight/flightList">운항 정보</a>
	</nav>
	
	<div class="container">
	<h2>항공편 목록</h2>
	<!-- 필터 섹션: 출발지, 도착지, 날짜 선택 -->
	<form id="filterForm" method="get" action="/flight/flightList">
		<div class="filter-section">
			<label for="departureAirport">출발 공항:</label>
			<select name="departureAirport" id="departureAirport" onchange="document.getElementById('filterForm').submit()">
				<option value="">-- 선택 --</option>
				<c:forEach var="airport" items="${airports}">
					<option value="${airport.airportCode}" ${param.departureAirport == airport.airportCode ? 'selected="selected"' : ''}>
					${airport.airportName} (${airport.airportCode})
					</option>
				</c:forEach>
			</select>
			
			<label for="arrivalAirport">도착 공항:</label>
				<select name="arrivalAirport" id="arrivalAirport" onchange="document.getElementById('filterForm').submit()">
				<option value="">-- 선택 --</option>
				<c:forEach var="airport" items="${airports}">
					<option value="${airport.airportCode}" ${param.arrivalAirport == airport.airportCode ? 'selected="selected"' : ''}>
					${airport.airportName} (${airport.airportCode})
					</option>
				</c:forEach>
			</select>
			
			<label for="selectedDate">출발 날짜:</label>
			<input type="text" id="selectedDate" name="selectedDate" value="${param.selectedDate}" readonly>
		</div>
	</form>

    <!-- 항공편 목록 테이블 -->
    <table class="table table-hover">
        <thead>
            <tr>
                <th>NO.</th>
                <th>출발지</th>
                <th>도착지</th>
                <th>출발시간</th>
                <th>도착시간(현지)</th>
                <th>비행시간</th>
                <th>항공편명</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="flight" items="${flightList}">
                <tr>
                    <td>${flight.flightId}</td>
                    <td>${flight.departureAirport}</td>
                    <td>${flight.arrivalAirport}</td>
                    <td>${flight.departureTime}</td>
                    <td>${flight.arrivalTime}</td>
                    <td>${flight.flightDuration}</td>
                    <td>${flight.flightName}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 페이지 네이션 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}">이전</a>
        </c:if>
        <c:set var="startPage" value="${currentPage - (currentPage - 1) % 10}"/>
        <c:forEach begin="${startPage}" end="${startPage + 9}" var="i">
            <c:if test="${i <= totalPages}">
                <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
            </c:if>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}">다음</a>
        </c:if>
    </div>
</div>
</section>
</body>
</html>
