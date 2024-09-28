<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title> 항공편 현황 </title>
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	section {
		display: flex;
		max-width: 1200px;
		margin: auto;
	}
	.table-container {
		width: 100%;
		background-color: white;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		overflow: hidden;
		margin-bottom: 20px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		margin: 0;
		font-size: 12px;
	}
	th, td {
		border: 1px solid #ddd;
		padding: 10px;
		text-align: center;
	}
	th {
		background-color: #000A8E;
		color: white;
		text-transform: uppercase;
	}
	td {
		background-color: #f9f9f9;
	}
	caption {
		font-size: 16px;
		font-weight: bold;
		padding: 10px;
		background-color: #000A8E;
		color: white;
		text-align: left;
	}
	.pagination {
		text-align: center;
		margin-top: 20px;
	}
	.pagination a {
		display: inline-block;
		padding: 5px 10px;
		margin: 0 3px;
		background-color: #4CAF50;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 12px;
	}
	.pagination a.active, .pagination span.active {
		background-color: #333;
		color: white;
		cursor: default;
		text-decoration: none;
	}
	.pagination span {
		display: inline-block;
		padding: 5px 10px;
		margin: 0 3px;
		background-color: #4CAF50;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 12px;
		cursor: default;
	}
	/* 날짜 선택 달력 스타일 */
	.date-picker-container {
		text-align: center;
		margin-bottom: 20px;
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<div width="100%" style="text-align: center"><h2>항공편 리스트</h2></div>

<!-- 날짜 선택을 위한 달력 추가 -->
<div style="text-align: center; margin-bottom: 20px;">
    <input type="text" id="selectedDate" placeholder="날짜 선택" readonly>
    <button onclick="filterByDate();">조회</button>
</div>

<section id="sec1">
    <div class="table-container" id="flightTable">
        <table>
            <caption>항공편 리스트</caption>
            <tr>
                <th>항공편명</th>
                <th>출발 공항</th>
                <th>도착 공항</th>
                <th>출발 시간</th>
                <th>도착 시간</th>
                <th>좌석 수</th>
            </tr>
            <!-- Flights Data -->
            <c:forEach var="flight" items="${flightList}">
                <tr>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.departureAirport}</td>
                    <td>${flight.arrivalAirport}</td>
                    <td>${flight.departureTime}</td>
                    <td>${flight.arrivalTime}</td>
                    <td>${flight.availableSeats}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty flightList}">
                <tr>
                    <td colspan="6">항공편 데이터가 없습니다.</td>
                </tr>
            </c:if>
        </table>
        <!-- Pagination -->
        <div class="pagination">
            <!-- 페이징 버튼 추가 -->
        </div>
    </div>
</section>

<script>
$(function() {
    $("#selectedDate").datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: function(dateText) {
            sessionStorage.setItem("selectedDate", dateText);
        }
    });
});

function filterByDate() {
    var selectedDate = $("#selectedDate").val();
    loadPage(1, selectedDate);
}

function loadPage(page, selectedDate = null) {
    if (!selectedDate) {
        selectedDate = sessionStorage.getItem("selectedDate");
    } else {
        sessionStorage.setItem("selectedDate", selectedDate);
    }

    console.log("Page: " + page + ", Selected Date: " + selectedDate);  // 로그 추가

    // 서버에 요청 보내서 페이지 로드
    $.ajax({
        url: "/admin/flightsList",
        type: "GET",
        data: {
            page: page,  // 페이지 번호 전달
            selectedDate: selectedDate  // 선택된 날짜
        },
        success: function(data) {
            // 서버에서 받은 데이터를 테이블에 렌더링
            $("#flightTable").html($(data).find("#flightTable").html());
            console.log("Data loaded successfully");  // 데이터 성공 로드 확인
        },
        error: function(error) {
            console.log("데이터 가져오기 실패:", error);
        }
    });
}

</script>

</body>
</html>