<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 조회</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f4f4f4;
		margin: 0;
		padding: 0;
	}
	/* 헤더 디자인 */
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
	/* 네비게이션 디자인 */
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
	/* 메인 컨테이너 디자인 */
	.container {
		max-width: 800px;
		margin: 30px auto;
		background-color: white;
		padding: 30px;
		border-radius: 8px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 20px;
		text-align: center;
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
		border: none;
		cursor: pointer;
		font-size: 16px;
		margin-top: 15px;
		padding: 10px 20px;
		border-radius: 5px;
	}
	input[type="submit"]:hover {
		background-color: #003A66;
	}
	/* 달력 스타일 */
	.ui-datepicker {
		font-size: 1.1em;
		width: 320px !important;
		background-color: #f4f4f4;
		border: 1px solid #ddd;
		border-radius: 10px;
		padding: 10px;
		box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	}
	.ui-datepicker .ui-datepicker-header {
		background-color: #00467F;
		color: white;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		padding: 10px;
	}
	.ui-datepicker .ui-datepicker-title {
		font-weight: bold;
	}
	.ui-datepicker td a {
		color: #00467F;
		padding: 8px;
		border-radius: 50%;
		transition: background-color 0.3s ease;
	}
	.ui-datepicker td a:hover {
		background-color: #ddd;
	}
	.ui-datepicker .ui-datepicker-prev, .ui-datepicker .ui-datepicker-next {
		color: white;
		font-size: 1.2em;
		cursor: pointer;
	}
</style>

<script>
	$(function() {
		// 날짜 선택기 설정
		$("#selectedDate").datepicker({
			dateFormat: "yy-mm-dd",
			showOtherMonths: true,
			selectOtherMonths: true,
			changeMonth: true,
			changeYear: true,
			onSelect: function(dateText) {
				$("#selectedDate").val(dateText);
				fetchFlightsByDate(dateText);
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
		<a href="../reserve/checkin">체크인</a>
		<a href="../reserve/flightList">운항 정보</a>
	</nav>
	
	<div class="container">
		<h2>예약 정보 조회</h2>
		<form id="reservationForm" action="${pageContext.request.contextPath}/select/selection" method="get" method="post">
			<!-- 예약 번호 -->
			<div class="form-group">
				<label for="pnr">예약번호</label>
				<input type="text" id="pnr" name="pnr" required>
			</div>
			<!-- 날짜 선택 -->
			<div class="form-group">
				<label for="selectedDate">출발일 선택</label>
				<input type="text" id="selectedDate" name="date" placeholder="날짜 선택" readonly>
			</div>
			<!-- 고객 정보 -->
			<div class="form-group">
				<label for="sung">First Name</label>
				<input type="text" id="sung" name="sung" value="${sung }">
			</div>
			
			<div class="form-group">
				<label for="lname">Last Name</label>
				<input type="text" id="name" name="name" value="${lname }">
			</div>
			
			<input type="submit" value="예약 조회">
		</form>
	</div>
</section>

</body>
</html>
