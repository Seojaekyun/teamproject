<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 체크인 안내</title>
<style>
	/* 스타일 정의 */
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
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
	section .container {
		max-width: 1200px;
		margin: 20px auto;
		background-color: white;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	section .content h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 10px;
	}
	section .content p {
		font-size: 16px;
		line-height: 1.6;
		margin-bottom: 20px;
	}
	section .content ul {
		list-style-type: disc;
		margin-left: 20px;
	}
	section .content ul li {
		margin-bottom: 10px;
	}
	section .content ol {
		list-style-type: decimal;
		margin-left: 20px;
	}
	section .content ol li {
		margin-bottom: 10px;
	}
	section table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	section > table, th, td {
		border: 1px solid #ddd;
	}
	section > th, td {
		padding: 12px;
		text-align: left;
	}
	section .content th {
		background-color: #f2f2f2;
	}
	section .cta-button {
		display: inline-block;
		padding: 10px 20px;
		background-color: #00467F;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		margin-top: 20px;
	}
	section .cta-button:hover {
		background-color: #003A66;
	}

</style>
</head>
<body>

<section>
	<header>
		<h1>온라인 체크인 안내</h1>
	</header>

	<nav>
		<a href="checkinGuide">체크인 안내</a>
		<a href="seatGuide">좌석배정 안내</a>
		<a href="baggageGuide">수하물 안내</a>
		<a href="">FAQ</a>
	</nav>
	
	<div class="container">
		<div class="content">
			<h2>온라인 체크인 서비스란?</h2>
			<p>
				온라인 체크인 서비스는 공항에 도착하기 전에 미리 체크인을 완료하고 탑승권을 발급받을 수 있는 편리한 서비스입니다. 이를 통해 공항에서의 대기 시간을 줄이고 더욱 편리하게 여행을 시작할 수 있습니다.
			</p>
			
			<h2>서비스의 장점</h2>
			<table>
				<tr>
					<th>장점</th>
					<th>설명</th>
				</tr>
				<tr>
					<td>시간 절약</td>
					<td>공항에서 체크인 대기 시간을 단축합니다.</td>
				</tr>
				<tr>
					<td>좌석 선택</td>
					<td>원하는 좌석을 사전에 선택할 수 있습니다.</td>
				</tr>
				<tr>
					<td>편의성</td>
					<td>모바일 탑승권으로 간편하게 이용 가능합니다.</td>
				</tr>
				<tr>
					<td>환경 보호</td>
					<td>종이 사용을 줄여 환경 보호에 기여합니다.</td>
				</tr>
			</table>

			<h2>이용 가능 시간</h2>
			<table>
				<tr>
					<th>노선</th>
					<th>체크인 가능 시간</th>
				</tr>
				<tr>
					<td>국내선</td>
					<td>출발 24시간 전 ~ 1시간 전</td>
				</tr>
				<tr>
					<td>국제선</td>
					<td>출발 48시간 전 ~ 2시간 전</td>
				</tr>
			</table>

			<h2>이용 방법</h2>
			<ol>
				<li>항공사 공식 웹사이트나 모바일 앱에 접속합니다.</li>
				<li>예약 번호와 개인 정보를 입력하여 로그인합니다.</li>
				<li>탑승할 항공편을 선택하고 체크인을 진행합니다.</li>
				<li>좌석을 선택하고 탑승권을 발급받습니다.</li>
				<li>탑승권을 모바일 기기에 저장하거나 출력합니다.</li>
			</ol>

			<h2>유의 사항</h2>
			<ul>
				<li>체크인 후 예약 변경은 불가능하니 신중히 진행해 주시기 바랍니다.</li>
				<li>위탁 수하물이 있는 경우 공항의 전용 카운터를 방문해야 합니다.</li>
				<li>출발 시간 30분 전까지 탑승구에 도착해야 합니다.</li>
			</ul>

			<h2>도움이 필요하신가요?</h2>
			<p>
				질문하기(<a href="../inquiry/write">QnA</a>) 를 방문하시거나 고객 센터로 문의해 주시면 친절하게 안내해 드리겠습니다.
			</p>

			<a class="cta-button" href="../reserve/checkin">지금 체크인하기</a>
		</div>
	</div>
	
</section>

</body>
</html>