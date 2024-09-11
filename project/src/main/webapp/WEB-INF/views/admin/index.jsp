<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	section #first {
		width: 100%;
		height: 100%;
		margin: auto;
	}
	section #first div{
		background: white;
		display: flex;
		margin: auto;
	}
	section #first div table {
		border: 1px solid lightgray;
		width: 350px;
	}
	section #first div table td{
		border: 1px solid lightgray;
		width: 100px;
		height: 40px;
		text-align: center;
	}
	section #second {
		width: 100%;
		height: 200px;
		background: pink;
	}
	section #third {
		width: 100%;
		height: 200px;
		background: olive;
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

</script>

</head>
<body>

<section>
	<div id="first">
		<h4> | 당일 예약 현황</h4>
		<div id="one">
			<div id="ap1">
				<table>
					<caption><h5 align="left"> 대한항공 </h5></caption>
					<tr>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>잔여석</td>
					</tr>
					<tr>
						<td>kal708</td>
						<td>09:20</td>
						<td>28ea</td>
					</tr>
				</table>
			</div>
			<div id="ap2">
				<table>
					<caption><h5 align="left"> 아시아나 </h5></caption>
					<tr>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>잔여석</td>
					</tr>
					<tr>
						<td>asn458</td>
						<td>10:00</td>
						<td>3ea</td>
					</tr>
				</table>
			</div>
			<div id="ap3">
				<table>
					<tr>
						<caption><h5 align="left"> 제주항공 </h5></caption>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>잔여석</td>
					</tr>
					<tr>
						<td>jja172</td>
						<td>11:20</td>
						<td>54ea</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<hr>
	<div id="second">
		<div id="one">
			당일 비행 편성
		</div>
	</div>
	<div id="third">
		<div id="one">
			주요 문의
		</div>
	</div>
</section>

</body>
</html>
