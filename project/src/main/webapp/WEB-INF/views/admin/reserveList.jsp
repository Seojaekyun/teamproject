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
	#clsd {
		background: #000A8E;
		color: white;
		border-radius: 5px;
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
<div width="100%" style="text-align: center"><h2>예약관리</h2></div>

<!-- Section 1: 날짜 필터링된 예약 내역 (달력 포함) -->
<section id="sec1">
	<div id="cal">
		<button id="clsd" onclick="clearDate()">날짜 선택 해제</button>
		<div id="datepicker"></div>
		<div id="selectedDate">
			<c:if test="${not empty selectedDate}">
				선택한 날짜: ${selectedDate}
			</c:if>
		</div>
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
			<!-- 페이지네이션 -->
			<div class="pagination">
				<c:if test="${totalGmpPages > 1}">
					<!-- 이전 3페이지 버튼 -->
					<c:if test="${gmpPage > 3}">
						<a href="javascript:void(0);" onclick="loadPage(${gmpPage - 3}, 'gmp');">이전3</a>
					</c:if>
					<!-- 페이지 번호 표시 -->
					<c:set var="startPage" value="${gmpPage - 1}" />
					<c:set var="endPage" value="${gmpPage + 1}" />
					<c:if test="${startPage < 1}">
						<c:set var="startPage" value="1" />
						<c:set var="endPage" value="3" />
					</c:if>
					<c:if test="${endPage > totalGmpPages}">
						<c:set var="endPage" value="${totalGmpPages}" />
						<c:set var="startPage" value="${totalGmpPages - 2}" />
						<c:if test="${startPage < 1}">
							<c:set var="startPage" value="1" />
						</c:if>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<c:choose>
							<c:when test="${i == gmpPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="loadPage(${i}, 'gmp');">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 3페이지 버튼 -->
					<c:if test="${gmpPage + 3 <= totalGmpPages}">
						<a href="javascript:void(0);" onclick="loadPage(${gmpPage + 3}, 'gmp');">다음3</a>
					</c:if>
				</c:if>
			</div>
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
			<!-- 페이지네이션 -->
			<div class="pagination">
				<c:if test="${totalIcnPages > 1}">
					<!-- 이전 3페이지 버튼 -->
					<c:if test="${icnPage > 3}">
						<a href="javascript:void(0);" onclick="loadPage(${icnPage - 3}, 'icn');">이전3</a>
					</c:if>
					<!-- 페이지 번호 표시 -->
					<c:set var="startPage" value="${icnPage - 1}" />
					<c:set var="endPage" value="${icnPage + 1}" />
					<c:if test="${startPage < 1}">
						<c:set var="startPage" value="1" />
						<c:set var="endPage" value="3" />
					</c:if>
					<c:if test="${endPage > totalIcnPages}">
						<c:set var="endPage" value="${totalIcnPages}" />
						<c:set var="startPage" value="${totalIcnPages - 2}" />
						<c:if test="${startPage < 1}">
							<c:set var="startPage" value="1" />
						</c:if>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<c:choose>
							<c:when test="${i == icnPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="loadPage(${i}, 'icn');">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 3페이지 버튼 -->
					<c:if test="${icnPage + 3 <= totalIcnPages}">
						<a href="javascript:void(0);" onclick="loadPage(${icnPage + 3}, 'icn');">다음3</a>
					</c:if>
				</c:if>
			</div>
		</div>

		<!-- 기타 항공편 테이블 -->
		<div class="table-container" id="otherFlights">
			<table>
				<caption>기타 항공편</caption>
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
			<!-- 페이지네이션 -->
			<div class="pagination">
				<c:if test="${totalOtherPages > 1}">
					<!-- 이전 3페이지 버튼 -->
					<c:if test="${otherPage > 3}">
						<a href="javascript:void(0);" onclick="loadPage(${otherPage - 3}, 'other');">이전3</a>
					</c:if>
					<!-- 페이지 번호 표시 -->
					<c:set var="startPage" value="${otherPage - 1}" />
					<c:set var="endPage" value="${otherPage + 1}" />
					<c:if test="${startPage < 1}">
						<c:set var="startPage" value="1" />
						<c:set var="endPage" value="3" />
					</c:if>
					<c:if test="${endPage > totalOtherPages}">
						<c:set var="endPage" value="${totalOtherPages}" />
						<c:set var="startPage" value="${totalOtherPages - 2}" />
						<c:if test="${startPage < 1}">
							<c:set var="startPage" value="1" />
						</c:if>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<c:choose>
							<c:when test="${i == otherPage}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="loadPage(${i}, 'other');">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 3페이지 버튼 -->
					<c:if test="${otherPage + 3 <= totalOtherPages}">
						<a href="javascript:void(0);" onclick="loadPage(${otherPage + 3}, 'other');">다음3</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
</section>

<script>
	$(function() {
		$("#datepicker").datepicker({
			inline: true,
			dateFormat: 'yy-mm-dd',
			defaultDate: null,
			onSelect: function(dateText) {
				$("#selectedDate").text('선택한 날짜: ' + dateText);
				sessionStorage.setItem("selectedDate", dateText);
	
				// 페이지 번호 초기화
				gmpPage = 1;
				icnPage = 1;
				otherPage = 1;
	
				// 각 테이블의 첫 페이지 로드
				loadPage(1, 'gmp', dateText);
				loadPage(1, 'icn', dateText);
				loadPage(1, 'other', dateText);
			}
		});
	
		var savedDate = sessionStorage.getItem("selectedDate");
		if (savedDate) {
			$("#selectedDate").text('선택한 날짜: ' + savedDate);
			$("#datepicker").datepicker('setDate', savedDate);
	
			// 페이지 번호 초기화
			gmpPage = 1;
			icnPage = 1;
			otherPage = 1;
	
			// 저장된 날짜로 데이터 로드
			loadPage(1, 'gmp', savedDate);
			loadPage(1, 'icn', savedDate);
			loadPage(1, 'other', savedDate);
		} else {
			$("#selectedDate").text('');
			$("#datepicker").datepicker('setDate', null);
	
			// 페이지 번호 초기화
			gmpPage = 1;
			icnPage = 1;
			otherPage = 1;
	
			// 전체 데이터 로드
			loadPage(1, 'gmp');
			loadPage(1, 'icn');
			loadPage(1, 'other');
		}
	});
	
	function loadPage(page, table, selectedDate) {
		if (typeof selectedDate === 'undefined') {
			selectedDate = sessionStorage.getItem("selectedDate");
		}
	
		// 페이지 번호 업데이트
		if (table === 'gmp') {
			gmpPage = page;
		} else if (table === 'icn') {
			icnPage = page;
		} else if (table === 'other') {
			otherPage = page;
		}
	
		var data = {
			gmpPage: gmpPage,
			icnPage: icnPage,
			otherPage: otherPage
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
			success: function(response) {
				var newGmpFlights = $(response).find("#gmpFlights").html();
				var newIcnFlights = $(response).find("#icnFlights").html();
				var newOtherFlights = $(response).find("#otherFlights").html();
	
				$("#gmpFlights").html(newGmpFlights);
				$("#icnFlights").html(newIcnFlights);
				$("#otherFlights").html(newOtherFlights);
			},
			error: function(error) {
				console.log("데이터 가져오기 실패:", error);
			}
		});
	}
	
	function clearDate() {
		sessionStorage.removeItem("selectedDate");
		$("#selectedDate").text('');
		$("#datepicker").datepicker('setDate', null);
	
		// 페이지 번호 초기화
		gmpPage = 1;
		icnPage = 1;
		otherPage = 1;
	
		// 전체 데이터 로드
		loadPage(1, 'gmp');
		loadPage(1, 'icn');
		loadPage(1, 'other');
	}
</script>
</body>
</html>