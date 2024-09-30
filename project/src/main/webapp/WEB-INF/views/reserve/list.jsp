<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 예약 정보</title>
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
		justify-content: space-between;
	}
	#sec1 #tables {
		display: flex;
		justify-content: space-between;
		width: 100%;
		height: 700px;
	}
	#sec1 .table-container {
		width: 100%;
		padding: 10px;
		background-color: white;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		overflow: hidden;
		margin-bottom: 20px;
		height: 680px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		border: 1px solid gray;
		margin: 0;
		font-size: 14px;
		border-radius: 5px;
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
	#cal {
		display: inline-block;
	}
	#datepicker {
		width: 180px;
		padding: 8px;
		font-size: 14px;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		text-align: center;
		background-color: #f9f9f9;
		margin-bottom: 10px;
	}
	#clearDate {
		margin-top: 10px;
		padding: 8px 12px;
		background-color: #000A8E;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.pagination {
		text-align: center;
		margin-top: 20px;
	}
	.pagination a, .pagination span {
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
		cursor: default;
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	// Datepicker 설정
	$("#datepicker").datepicker({
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText) {
			// 선택한 날짜를 input 필드에 설정
			$("#datepicker").val(dateText);
			
			// 선택한 날짜에 맞는 예약 내역을 불러오기 위해 페이지 새로고침
			window.location.href = "/reserve/list?selectedDate=" + dateText;
		}
	});

	// 이전에 선택된 날짜가 있다면 input 필드에 표시
	var selectedDate = '${selectedDate}';
	if (selectedDate !== "") {
		$("#datepicker").datepicker("setDate", selectedDate);
		$("#datepicker").val(selectedDate);  // input 필드에 날짜 표시
	}

	// 날짜 초기화 버튼 클릭 시 전체 내역으로 돌아가기
	$("#clearDate").click(function() {
		window.location.href = "/reserve/list";
	});
});
</script>
</head>

<body>
<!-- Section 1: 예약 내역 (날짜 선택 포함) -->
<section id="sec1">
	<div id="tables">
		<!-- 예약 테이블 -->
		<div class="table-container" id="allFlights">
		<div width="100%" style="text-align: center"><h2>나의 예약 정보</h2></div>
		<!-- 날짜 선택 필드 -->
		<div id="cal">
			<input type="text" id="datepicker" placeholder="날짜를 선택하세요" readonly/>
			<!-- 날짜 초기화 버튼 -->
			<button id="clearDate">날짜 초기화</button>
		</div>
			<table>
				<caption>전체 예약</caption>
				<tr>
					<th>예약번호</th>
					<th>예약일시</th>
					<th>항공편명</th>
					<th>출항시간</th>
					<th>좌석등급</th>
					<th>예약인원</th>
					<th>요금</th>
					<th>결제</th>
				</tr>
				<c:forEach var="res" items="${rsvClist}">
					<tr>
						<td><a href="/select/selection?pnr=${res.pnr}&date=${res.reservationDate}&sung=${res.sung}&name=${res.name}">${res.pnr}</a></td>
						<td>${res.reservationDate}</td>
						<td>${res.flightName}</td>
						<td>${res.departure_time}</td>
						<td>${res.seat_class}</td>
						<td>${res.reservation_count}</td>
						<td>${totalCharge} 원</td>
						<td>
							<c:if test="${totalChargePay == 0}">
								결제 예정
							</c:if>
							<c:if test="${totalChargePay != 0}">
								결제 완료
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty rsvClist}">
					<tr>
						<td colspan="7">예약 데이터가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<!-- 페이지네이션 -->
			<div class="pagination">
				<c:if test="${totalPages > 1}">
					<a href="?page=<c:out value='${currentPage > 10 ? currentPage - 10 : 1}'/>&selectedDate=${selectedDate}">이전10</a>
					<a href="?page=<c:out value='${currentPage > 1 ? currentPage - 1 : 1}'/>&selectedDate=${selectedDate}">이전</a>
					
					<!-- 페이지 번호 계산 -->
					<c:set var="startPage" value="${currentPage - (currentPage - 1) % 10}" />
					<c:set var="endPage" value="${startPage + 9}" />
					<c:if test="${endPage > totalPages}">
						<c:set var="endPage" value="${totalPages}" />
					</c:if>
					
					<!-- 페이지 번호 출력 -->
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="?page=${i}&selectedDate=${selectedDate}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<a href="?page=<c:out value='${currentPage < totalPages ? currentPage + 1 : totalPages}'/>&selectedDate=${selectedDate}">다음</a>
					<a href="?page=<c:out value='${currentPage + 10 <= totalPages ? currentPage + 10 : totalPages}'/>&selectedDate=${selectedDate}">다음10</a>
				</c:if>
			</div>
		</div>
	</div>
</section>

</body>
</html>
