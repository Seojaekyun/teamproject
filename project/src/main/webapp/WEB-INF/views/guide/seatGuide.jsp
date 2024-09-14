<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>얼리버드 좌석 배정 안내</title>
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
	section .content ul, section .content ol {
		list-style-type: disc;
		margin-left: 20px;
	}
	section .content ul li, section .content ol li {
		margin-bottom: 10px;
	}
	section .content #table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	section .content #table, th, td {
		border: 1px solid #ddd;
	}
	section .content th, td {
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
		<h1>얼리버드 좌석 배정 안내</h1>
	</header>

	<nav>
		<a href="checkinGuide">체크인 안내</a>
		<a href="seatGuide">좌석배정 안내</a>
		<a href="baggageGuide">수하물 안내</a>
		<a href="">FAQ</a>
	</nav>

	<div class="container">
		<div class="content">
			<h2>얼리버드 좌석 배정 서비스란?</h2>
			<p>
				얼리버드 좌석 배정 서비스는 항공편 출발 전에 원하는 좌석을 미리 선택할 수 있는 유료 서비스입니다. 창가 자리, 복도 자리 등 선호하는 좌석을 사전에 예약하여 더욱 편안한 여행을 즐기세요.
			</p>

			<h2>서비스 특징</h2>
			<table id="table">
				<tr>
					<th>구분</th>
					<th>내용</th>
				</tr>
				<tr>
					<td>이용 대상</td>
					<td>항공권 예매를 완료한 모든 승객</td>
				</tr>
				<tr>
					<td>이용 가능 시간</td>
					<td>항공편 출발 361일 전부터 48시간 전까지</td>
				</tr>
				<tr>
					<td>좌석 종류</td>
					<td>일반석, 프리미엄 좌석 등</td>
				</tr>
				<tr>
					<td>결제 방법</td>
					<td>신용카드, 온라인 결제 등</td>
				</tr>
			</table>

			<h2>좌석 요금 안내</h2>
			<table id="table">
				<tr>
					<th>좌석 종류</th>
					<th>구간</th>
					<th>요금</th>
				</tr>
				<tr>
					<td>일반석</td>
					<td>국내선</td>
					<td>₩10,000</td>
				</tr>
				<tr>
					<td>일반석</td>
					<td>국제선</td>
					<td>₩30,000</td>
				</tr>
				<tr>
					<td>프리미엄 좌석</td>
					<td>국내선</td>
					<td>₩20,000</td>
				</tr>
				<tr>
					<td>프리미엄 좌석</td>
					<td>국제선</td>
					<td>₩50,000</td>
				</tr>
			</table>

			<h2>서비스 이용 방법</h2>
			<ol>
				<li>항공권 예약 및 구매 완료</li>
				<li>홈페이지 또는 모바일 앱에서 '얼리버드 좌석 배정' 메뉴 선택</li>
				<li>예약 번호와 성명을 입력하여 로그인</li>
				<li>원하는 좌석 선택 후 결제 진행</li>
				<li>좌석 배정 완료 확인 (이메일 또는 문자로 확인서 발송)</li>
			</ol>

			<h2>유의 사항</h2>
			<ul>
				<li>좌석 배정 후 변경이나 환불은 제한될 수 있습니다.</li>
				<li>안전상의 이유로 일부 좌석은 제공되지 않을 수 있습니다.</li>
				<li>탑승 수속 마감 시간 전에 공항에 도착해 주시기 바랍니다.</li>
				<li>기타 상세 내용은 고객 센터에 문의해 주세요.</li>
			</ul>

			<h2>FAQ</h2>
			<p>
				자주 묻는 질문은 <a href="#">여기</a>에서 확인하실 수 있습니다.
			</p>

			<a class="cta-button" href="#">좌석 배정하기</a>
		</div>
	</div>

	<div>
		<p>© 2024 eLTA항공. 모든 권리 보유.</p>
	</div>
	
</section>

</body>
</html>