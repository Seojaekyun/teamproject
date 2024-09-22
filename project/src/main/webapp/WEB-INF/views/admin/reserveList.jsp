<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
	#cal {
		width: 30%;
		margin-right: 70px;
	}
	#tables {
		display: flex;
		justify-content: space-between;
		width: 90%;
	}
	.table-container {
		width: 33%;
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
		font-size: 12px; /* 테이블 내용을 작게 조정 */
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
	#datepicker {
		width: 100%;
		background-color: white;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
	}
	.ui-datepicker {
		width: 100% !important;
	}
	.ui-datepicker td {
		text-align: center;
		padding: 8px;
		border-radius: 4px;
		transition: background-color 0.3s ease;
	}
	.ui-datepicker td:hover {
		background-color: #4CAF50;
		color: white;
	}
	.ui-datepicker th {
		padding: 10px 0;
		background-color: #000A8E;
		color: white;
	}
	.ui-datepicker-header {
		background-color: #4CAF50;
		color: white;
		border: none;
	}
	#selectedDate {
		font-size: 16px;
		font-weight: bold;
		color: #333;
		margin-bottom: 20px;
	}
	.pagination {
		text-align: center;
		margin-top: 20px;
	}
	.pagination a {
		display: inline-block;
		padding: 5px 10px; /* 버튼 크기를 줄임 */
		margin: 0 3px; /* 간격을 줄임 */
		background-color: #4CAF50;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 12px; /* 폰트 크기 조정 */
	}
	.pagination a.active, .pagination span.active {
		background-color: #333;  /* 현재 페이지 색상 */
		color: white;
		cursor: default; /* 클릭 불가능한 상태 표시 */
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
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function loadPage(page, table, selectedDate) {
    if (!selectedDate) {
        selectedDate = sessionStorage.getItem("selectedDate");
    }

    var data = {
        gmpPage: (table === 'gmp') ? page : ${gmpPage},
        icnPage: (table === 'icn') ? page : ${icnPage},
        otherPage: (table === 'other') ? page : ${otherPage}
    };

    if (selectedDate && selectedDate !== "") {
        data.selectedDate = selectedDate;
    } else {
        sessionStorage.removeItem("selectedDate");
    }

    $.ajax({
        url: "/admin/reserveList",
        type: "GET",
        data: data,
        success: function(data) {
            $("#gmpFlights").html($(data).find("#gmpFlights").html());
            $("#icnFlights").html($(data).find("#icnFlights").html());
            $("#otherFlights").html($(data).find("#otherFlights").html());
        },
        error: function(error) {
            console.log("데이터 가져오기 실패:", error);
        }
    });
}

$(function() {
    $("#datepicker").datepicker({
        inline: true,
        dateFormat: 'yy-mm-dd',
        onSelect: function(dateText) {
            $("#selectedDate").text(dateText);
            sessionStorage.setItem("selectedDate", dateText);
            loadPage(1, 'gmp', dateText);
        }
    });

    var savedDate = sessionStorage.getItem("selectedDate");
    if (savedDate) {
        $("#selectedDate").text(savedDate);
    } else {
        $("#selectedDate").text('');
    }
});
</script>
</head>

<body>
<div width="100%" style="text-align: center"><h2>예약관리</h2></div>

<!-- Section 1: 날짜 필터링된 예약 내역 (달력 포함) -->
<section id="sec1">
	<div id="cal">
		<div id="datepicker"></div>
	</div>

	<div id="tables">
		<!-- GMP 항공편 테이블 -->
		<div class="table-container" id="gmpFlights">
			<table>
				<caption>GMP 출발 항공편</caption>
				<tr>
					<th>항공편명</th>
					<th>출항시간</th>
					<th>예약석</th>
				</tr>
				<c:forEach var="grsv" items="${gmpRsv}">
					<tr>
						<td>${grsv.flightName}</td>
						<td>${grsv.departureTime}</td>
						<td>${grsv.reservationCount}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty gmpRsv}">
					<tr>
						<td colspan="3">GMP 출발 항공편 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>

		<!-- ICN 항공편 테이블 -->
		<div class="table-container" id="icnFlights">
			<table>
				<caption>ICN 출발 항공편</caption>
				<tr>
					<th>항공편명</th>
					<th>출항시간</th>
					<th>예약석</th>
				</tr>
				<c:forEach var="irsv" items="${icnRsv}">
					<tr>
						<td>${irsv.flightName}</td>
						<td>${irsv.departureTime}</td>
						<td>${irsv.reservationCount}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty icnRsv}">
					<tr>
						<td colspan="3">ICN 출발 항공편 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>

		<!-- 기타 항공편 테이블 -->
		<div class="table-container" id="otherFlights">
			<table>
				<caption>기타 출발 항공편</caption>
				<tr>
					<th>항공편명</th>
					<th>출항시간</th>
					<th>예약석</th>
				</tr>
				<c:forEach var="orsv" items="${otherRsv}">
					<tr>
						<td>${orsv.flightName}</td>
						<td>${orsv.departureTime}</td>
						<td>${orsv.reservationCount}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty otherRsv}">
					<tr>
						<td colspan="3">기타 출발 항공편 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
</section>

<!-- Section 2: 전체 예약 내역 -->
<section id="sec2">
	<!-- 전체 GMP 항공편 테이블 -->
	<div class="table-container" id="allGmpFlights">
		<table>
			<caption>전체 GMP 출발 항공편</caption>
			<tr>
				<th>항공편명</th>
				<th>출항시간</th>
				<th>예약석</th>
			</tr>
			<c:forEach var="allGmpRsv" items="${allGmpReservations}">
				<tr>
					<td>${allGmpRsv.flightName}</td>
					<td>${allGmpRsv.departureTime}</td>
					<td>${allGmpRsv.reservationCount}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty allGmpReservations}">
				<tr>
					<td colspan="3">GMP 출발 항공편 내역이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>

	<!-- 전체 ICN 항공편 테이블 -->
	<div class="table-container" id="allIcnFlights">
		<table>
			<caption>전체 ICN 출발 항공편</caption>
			<tr>
				<th>항공편명</th>
				<th>출항시간</th>
				<th>예약석</th>
			</tr>
			<c:forEach var="allIcnRsv" items="${allIcnReservations}">
				<tr>
					<td>${allIcnRsv.flightName}</td>
					<td>${allIcnRsv.departureTime}</td>
					<td>${allIcnRsv.reservationCount}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty allIcnReservations}">
				<tr>
					<td colspan="3">ICN 출발 항공편 내역이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>

	<!-- 전체 기타 항공편 테이블 -->
	<div class="table-container" id="allOtherFlights">
		<table>
			<caption>전체 기타 출발 항공편</caption>
			<tr>
				<th>항공편명</th>
				<th>출항시간</th>
				<th>예약석</th>
			</tr>
			<c:forEach var="allOtherRsv" items="${allOtherReservations}">
				<tr>
					<td>${allOtherRsv.flightName}</td>
					<td>${allOtherRsv.departureTime}</td>
					<td>${allOtherRsv.reservationCount}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty allOtherReservations}">
				<tr>
					<td colspan="3">기타 출발 항공편 내역이 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>
</section>
</body>
</html>
