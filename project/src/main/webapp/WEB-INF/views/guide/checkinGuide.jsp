<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 체크인 안내</title>
<style>
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
        <a href="chedkinGuide">체크인 안내</a>
        <a href="seatGuide">좌석배정 안내</a>
        <a href="#">수하물</a>
    </nav>
	
	<div class="container">
		<div class="content">
			<h2>온라인 체크인 서비스란?</h2>
				<p> 온라인 체크인 서비스는 공항에 도착하기 전에 미리 탑승권을 발급받아, 공항에서 시간을 절약할 수 있는 서비스입니다. 항공편 출발 전 48시간부터 1시간 전까지 체크인이 가능합니다. </p>
			<h2>서비스 이용 방법</h2>
				<ul>
					<li>1. 항공편 정보를 확인한 후, 온라인 체크인 페이지에 접속합니다.</li>
					<li>2. 예약 번호와 여권 정보를 입력하여 체크인을 진행합니다.</li>
					<li>3. 좌석을 선택하고, 탑승권을 발급받습니다.</li>
					<li>4. 발급된 탑승권을 출력하거나 모바일 기기에 저장하여 공항으로 이동합니다.</li>
				</ul>
			<h2>주의 사항</h2>
			<p> 온라인 체크인 후에도 공항에서 보안 검색 및 출입국 심사를 받아야 하며, 위탁 수하물이 있는 경우 별도로 수하물 카운터를 방문해야 합니다. </p>
			<a class="cta-button" href="#">지금 체크인하기</a>
		</div>
	</div>
	<div>
		<p>© 2024 eLTA항공. 모든 권리 보유.</p>
	</div>
	
</section>

</body>
</html>
