<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 조회</title>
<!-- 디자인에 필요한 CSS 및 스크립트 추가 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
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
		max-width: 1000px;
		margin: 20px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 10px;
	}
	.form-group {
		margin-bottom: 20px;
	}
	label {
		font-weight: bold;
		color: #555;
	}
	select, input[type="text"], input[type="email"] {
		width: 100%;
		padding: 10px;
		margin-top: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		font-size: 16px;
	}
	input[type="submit"] {
		background-color: #00467F;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
	}
	input[type="submit"]:hover {
		background-color: #003A66;
	}
	/* 달력 디자인 */
	#cal {
		margin: 20px auto;
		width: 100%;
	}
	.ui-datepicker {
		width: 450px !important;
		background-color: #f9f9f9;
		border: 1px solid #ddd;
	}
	.ui-datepicker .ui-datepicker-header {
		background-color: #00467F;
		color: white;
		padding: 10px;
	}
	.ui-datepicker td a {
		color: #00467F;
	}
	.ui-datepicker td a:hover {
		background-color: #ddd;
	}
</style>

<script>
	$(function() {
		// 달력 설정
		$("#selectedDate").datepicker({
			inline: true,
			dateFormat: "yy-mm-dd",
			onSelect: function(dateText) {
				$("#selectedDate").val(dateText);  // 선택한 날짜를 화면에 표시
				fetchFlightsByDate(dateText);  // 선택한 날짜에 맞는 항공편 불러오기
			}
		});
	});
	
</script>

</head>
<body>

<section>
	<header>
		<h1>예약 조회</h1>
	</header>
	
	<nav>
		<a href="../reserve/reservation">항공권 예약</a>
		<a href="../reserve/reserveInfo">예약 조회</a>
		<a href="">체크인</a>
		<a href="../flight/flightList">운항 정보</a>
	</nav>
	
	<div class="container">
		<h2>예약 정보 조회</h2>
		<form id="reservationForm" action="/reserve" method="post">
			<!-- 날짜 선택 -->
			<div id="cal">
				<input type="text" id="selectedDate" placeholder="날짜 선택" readonly>
			</div>
			<!-- 예약 번호 -->
			<div class="form-group">
				<label for="flight_id">예약번호</label>
				<input type="text" id="pnr" name="pnr" value="">
			</div>
			<!-- 고객 정보 -->
			<div class="form-group">
				<label for="customer_id">예약자 ID</label>
				<input type="text" id="userid" name="userid" value="${userid }">
			</div>
	
			<div class="form-group">
				<label for="customer_sung">First Name</label>
				<input type="text" id="sung" name="sung">
			</div>
			
			<div class="form-group">
				<label for="customer_name">Last Name</label>
				<input type="text" id="lname" name="lname">
			</div>
	
			<div class="form-group">
				<label for="customer_email">이메일</label>
				<input type="email" id="customer_email" name="customer_email" value="${email}" required>
			</div>
	
			<input type="submit" value="예약조회">
		</form>
	</div>
</section>

</body>
</html>