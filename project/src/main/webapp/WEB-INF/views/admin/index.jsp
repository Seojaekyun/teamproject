<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>administrator</title>
<style>
	section {
		width: 100%;
		height: 100%;
	}
	h4 {
		height: 0px;
	}
	caption {
		height: 45px;
	}
	section div{
		width: 1200px;
		background: white;
		display: flex;
		margin: auto;
	}
	section div table {
		border-spacing:0px;
		width: 350px;
		border-spacing:0px;
		
	}
	section div table tr:first-child {
		background: lightblue;
	}
	section div table td{
		border: 1px solid lightgray;
		width: 100px;
		height: 40px;
		text-align: center;
		border-spacing:0px;
		border-radius: 5px;
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
	<h4>&nbsp;&nbsp;&nbsp; | 당일 예약 현황</h4>
	<div id="first">
		
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
	<h4>&nbsp;&nbsp;&nbsp; | 당일 항공 현황</h4>
	<div id="second">
		<div id="one">
			<div id="ac1">
				<table>
					<caption><h5 align="left"> 대한항공 </h5></caption>
					<tr>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>예정</td>
					</tr>
					<tr>
						<td>kal708</td>
						<td>09:20</td>
						<td>출항</td>
					</tr>
				</table>
			</div>
			<div id="ac2">
				<table>
					<caption><h5 align="left"> 아시아나 </h5></caption>
					<tr>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>예정</td>
					</tr>
					<tr>
						<td>asn458</td>
						<td>10:00</td>
						<td>우천 결항</td>
					</tr>
				</table>
			</div>
			<div id="ac3">
				<table>
					<tr>
						<caption><h5 align="left"> 제주항공 </h5></caption>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>예정</td>
					</tr>
					<tr>
						<td>jja172</td>
						<td>11:20</td>
						<td>결항</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<hr>
	<div id="third">
		<div id="one">
			주요 문의
		</div>
	</div>
</section>

</body>
</html>
