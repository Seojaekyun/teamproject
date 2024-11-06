<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 체크인</title>
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
	input[type="text"], input[type="date"], input[type="submit"] {
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
	}
	input[type="submit"]:hover {
		background-color: #003A66;
	}
</style>

</head>
<body>

<section>
	<header>
		<h1>온라인 체크인</h1>
	</header>
	
	<nav>
		<a href="../reserve/reservation">항공권 예약</a>
		<a href="../reserve/reserveInfo">예약 조회</a>
		<a href="../reserve/checkin">체크인</a>
		<a href="../flight/flightList">운항 정보</a>
	</nav>
	
	<div class="container">
		<h2>체크인 정보 입력</h2>
		<form action="checkinProcess.jsp" method="post">
			<div class="form-group">
				<label for="reservationNumber">예약 번호</label>
				<input type="text" id="reservationNumber" name="reservationNumber" required>
			</div>
			<div class="form-group">
				<label for="lastName">성(Last Name)</label>
				<input type="text" id="lastName" name="lastName" required>
			</div>
			<div class="form-group">
				<label for="firstName">이름(First Name)</label>
				<input type="text" id="firstName" name="firstName" required>
			</div>
			<div class="form-group">
				<label for="departureDate">출발일</label>
				<input type="date" id="departureDate" name="departureDate" required>
			</div>
			<input type="submit" value="체크인">
		</form>
	</div>
</section>

</body>
</html>