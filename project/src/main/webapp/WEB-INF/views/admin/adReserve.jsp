<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	body {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		box-sizing: border-box;
	}

	header {
		width: 100%;
	}
	header #first {
		display: flex;
		height: 30px;
		align-items: right;
		justify-content: flex-end;
		background-color: lightblue;
		padding: 10px 20px;
		box-sizing: border-box;
	}
	header #second {
		display: flex;
		height: 50px;
		align-items: center;
		justify-content: space-between;
		background-color: lightblue;
		padding: 10px 20px;
		box-sizing: border-box;
	}
	header #one {
		flex-shrink: 0;
		font-size: 17px;
	}
	header #one a {
		text-decoration: none;
		color: black;
	}
	header #one a:hover {
		font-weight: bold;
	}
	header #logo {
		flex-shrink: 0;
		valign: top;
	}
	header #two {
		display: flex;
		flex-grow: 1;
		justify-content: flex-start;
	}

	header #two button {
		background: none;
		border: none;
		margin: 0 10px;
		font-size: 17px;
		cursor: pointer;
	}
	header #two button a {
		text-decoration: none;
		color: black;
	}
	header #two button:hover a {
		font-weight: bold;
	}
	section {
		margin: auto;
	}
	section #cal {
		margin: auto;
		display: flex; /* Flexbox로 내부 아이템들을 가로로 배치 */
		width: 1000px;
		box-sizing: border-box;
		gap: 20px; /* 달력과 테이블 사이에 간격 추가 */
	}
	section #sced {
		width: 400px;
		box-sizing: border-box;
	}
	.ui-datepicker {
		width: 600px !important; /* 달력의 전체 너비를 600px로 설정 */
	}
	.ui-datepicker table {
		width: 100% !important; /* 달력 테이블 너비를 100%로 설정 */
	}
	.ui-datepicker td {
		width: 14.28% !important; /* 달력을 7개의 열로 나눔 (100% / 7열) */
		height: 60px !important; /* 셀의 높이 */
		text-align: center !important; /* 텍스트 중앙 정렬 */
	}
	.ui-datepicker .ui-datepicker-header {
		padding: 10px !important;
	}
	.ui-datepicker th {
		padding: 10px 0 !important;
	}
	.ui-datepicker td span,
	.ui-datepicker td a {
		display: block !important;
		padding: 10px !important;
		line-height: 30px !important; /* 날짜 텍스트의 세로 정렬 */
	}
	table {
		border-collapse: collapse;
		width: 100%;
	}
	td, th {
		border: 1px solid black;
		padding: 8px;
		text-align: center;
	}
	th {
		background-color: #f2f2f2;
	}

</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			inline: true, // 달력이 항상 표시되도록 설정
			onSelect: function(dateText) { // 날짜 선택 시 호출되는 이벤트
				// 선택한 날짜 값을 처리
				// alert("선택한 날짜: " + dateText);
				$("#selectedDate").text("선택한 날짜: " + dateText); // 선택한 날짜를 화면에 표시
			}
		});
	});
</script>

</head>
<body>

<section>
	<div id="first">
		<div id="one">
			비행편성
		</div>
		<!-- 선택한 날짜 표시 -->
		<div id="selectedDate" style="margin-top: 20px; font-size: 18px; font-weight: bold;">
			선택한 날짜: 없음
		</div>
		<div id="cal">
			<!-- 달력 -->
			<div id="datepicker"></div>
			<!-- 테이블 -->
			<div id="sced">
				<table>
					<tr>
						<th>항공편</th>
						<th>기종</th>
						<th>출발시간</th>
						<th>잔여석</th>
					</tr>
					<tr>
						<td>korean</td>
						<td>KOR710</td>
						<td>09:20</td>
						<td>150</td>
					</tr>
					<tr>
						<td>asiana</td>
						<td>ASN404</td>
						<td>12:30</td>
						<td>120</td>
					</tr>
					<tr>
						<td>je-ju</td>
						<td>JEU164</td>
						<td>15:00</td>
						<td>50</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="second">
		<div id="one">
			
		</div>
		<div id="two">
			
		</div>
	</div>
</section>

</body>
</html>
