<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수하물 안내</title>
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
	/* '수하물이란 무엇인가요?' 섹션 */
	section .intro-section {
		display: flex;
		flex-direction: row;
		align-items: center;
		margin-bottom: 40px;
		background: #E6E2DF;
	}
	section .intro-section .text {
		padding-left: 20px;
		width: 60%;
	}
	section .intro-section .text h2 {
		font-size: 22px;
		color: #00467F;
		margin-bottom: 10px;
	}
	section .intro-section .text p {
		font-size: 16px;
		line-height: 1.6;
		color: #333;
	}
	section .intro-section .image {
		width: 40%;
		text-align: center;
	}
	section .intro-section .image img {
		max-width: 100%;
		height: auto;
	}
	/* 콘텐츠 섹션 */
	section .content {
		margin-bottom: 40px;
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
		color: #333;
	}
	section .content ul {
		list-style-type: disc;
		margin-left: 20px;
		color: #555;
		margin-bottom: 20px;
	}
	section .content ul li {
		margin-bottom: 10px;
	}
	section .content a {
		
		text-decoration: none;
		font-weight: bold;
	}
	section .content a:hover {
		text-decoration: underline;
	}
	/* 버튼 스타일 */
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
	/* 반응형 디자인 */
	@media screen and (max-width: 768px) {
		section .intro-section {
			flex-direction: column;
		}
		section .intro-section .text, section .intro-section .image {
			width: 100%;
		}
		section .intro-section .image {
			margin-top: 20px;
		}
	}
</style>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>

<section>
	<header>
		<h1>수하물 안내</h1>
	</header>

	<nav>
		<a href="checkinGuide">체크인 안내</a> 
		<a href="seatGuide">좌석 배정 안내</a> 
		<a href="baggageGuide">수하물 안내</a> 
		<a href="faq">FAQ</a> 
	</nav>

	<!-- 컨테이너 -->
	<div class="container">
		<!-- '수하물이란 무엇인가요?' 섹션 -->
		<div class="intro-section">
			<div class="text">
				<h1>수하물이란?</h1>
				<p>
					수하물은 승객이 여행 시 항공기에 반입하거나 위탁하여 운송하는 모든 물품을 말합니다.<br>
					수하물은 크게 <strong>기내 수하물</strong>과 <strong>위탁 수하물</strong>로 구분됩니다.<br>
					짐을 준비하시는 고객님의 여행이 한결 편안할 수 있도록 꼭 알아두셔야 하는 수하물 관련 정보를 안내해 드리고 있습니다.
				</p>
			</div>
			<div class="image">
				<img src="../static/resources/carrier.png" alt="수하물 이미지">
			</div>
		</div>

		<!-- 이미지 섹션 아래에 추가 내용 -->
		<div class="content">
			<h2>기내 수하물</h2>
			<p>
				기내 수하물은 승객이 항공기 객실 내에 휴대하여 보관할 수 있는 수하물을 의미합니다. 각 승객은 규정된 크기와 중량 이내의 수하물을 기내에 반입할 수 있습니다.
			</p>
			<ul>
				<li>일반석: 1개, 최대 7kg</li>
				<li>비즈니스석: 2개, 각각 최대 7kg</li>
			</ul>
			<p>
				기내 수하물의 크기는 <strong>55cm x 40cm x 20cm</strong> 이내여야 합니다.
			</p>

			<h2>위탁 수하물</h2>
			<p>
				위탁 수하물은 승객이 항공사에 맡겨 화물칸에 보관되는 수하물을 의미합니다. 위탁 수하물은 항공권에 따라 무료 허용량이 다를 수 있습니다.
			</p>
			<ul>
				<li>일반석: 1개, 최대 23kg</li>
				<li>비즈니스석: 2개, 각각 최대 32kg</li>
			</ul>
			<p>
				위탁 수하물의 크기는 각 수하물당 세 변의 합이 <strong>158cm</strong> 이내여야 합니다.
			</p>

			<h2>운송 제한 품목 안내</h2>
			<p>
				항공 안전을 위해 운송이 제한되거나 금지된 품목이 있습니다. 다음은 주요 제한 품목에 대한 안내입니다.
			</p>
			<h3>위험물품 분류</h3>
			<ul>
				<li><strong>폭발성 물질</strong>: 폭죽, 탄약 등</li>
				<li><strong>인화성 액체</strong>: 페인트, 신나 등</li>
				<li><strong>독성 물질</strong>: 농약, 비소 등</li>
				<li><strong>방사성 물질</strong>: 방사성 동위원소 등</li>
				<li><strong>부식성 물질</strong>: 수은, 염산 등</li>
				<li><strong>산화성 물질</strong>: 표백제, 과산화수소 등</li>
			</ul>
			<h3>기내 반입 금지 품목</h3>
			<ul>
				<li>총기류 및 무기류</li>
				<li>날카로운 물품: 칼, 가위 등</li>
				<li>둔기류: 야구 방망이, 골프채 등</li>
			</ul>
			<h3>액체류 반입 제한</h3>
			<p>
				액체, 에어로졸, 젤류(LAGs)는 각각 100ml 이하의 용기에 담아야 하며, 총량 1L 이하의 투명한 지퍼백에 보관해야 합니다.
			</p>
			<h3>예외 품목</h3>
			<ul>
				<li>의약품: 처방전 또는 의사 소견서 지참 시</li>
				<li>유아용 음식: 동반 유아 탑승 시</li>
				<li>필수 특별식: 의료상 필요 시</li>
			</ul>
			<p>
				더 자세한 내용은 <a href="restrictedItems">운송 제한 품목 안내</a> 페이지를 참고하시기 바랍니다.
			</p>

			<!-- 문의사항 버튼 -->
			<a class="cta-button" href="contactUs">문의사항</a>
		</div>
	</div>

</section>

</body>
</html>