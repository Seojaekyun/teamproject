<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행지 추천</title>
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
		font-size: 36px;
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
		font-size: 18px;
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
		font-size: 28px;
		color: #00467F;
		margin-bottom: 20px;
	}
	section .content p {
		font-size: 18px;
		line-height: 1.8;
		margin-bottom: 20px;
	}
	section .destination {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	section .destination-card {
		background-color: #fff;
		width: 30%;
		margin-bottom: 20px;
		border: 1px solid #ddd;
		border-radius: 10px;
		overflow: hidden;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	section .destination-card img {
		width: 100%;
		height: auto;
	}
	section .destination-card h3 {
		font-size: 22px;
		margin: 15px;
		color: #333;
	}
	section .destination-card p {
		font-size: 16px;
		margin: 15px;
		color: #666;
	}
	section .destination-card a {
		display: block;
		text-align: center;
		padding: 10px;
		background-color: #00467F;
		color: white;
		text-decoration: none;
		font-size: 16px;
	}
	section .destination-card a:hover {
		background-color: #003A66;
	}
	@media screen and (max-width: 768px) {
		.destination-card {
			width: 100%;
		}
	}
</style>
</head>
<body>

<section>
<header>
	<h1>여행지 추천</h1>
</header>

<nav>
	<a href="travel">홈</a>
	<a href="">국내 여행</a>
	<a href="">해외 여행</a>
	<a href="">테마 여행</a>
	<a href="">문의하기</a>
</nav>

<div class="container">
	<div class="content">
		<h2>인기 여행지</h2>
		<p>
			다양한 여행지를 탐험하고 특별한 추억을 만들어 보세요. 아래에는 현재 가장 인기 있는 여행지들이 소개되어 있습니다.
		</p>

		<div class="destination">
			<div class="destination-card">
				<img src="../static/resources/travel1.jpg" alt="서울">
				<h3>서울</h3>
				<p>한국의 수도로 전통과 현대가 어우러진 도시입니다. 역사적인 궁궐과 최첨단 기술이 공존합니다.</p>
				<a href="seoul.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travel2.jpg" alt="제주도">
				<h3>제주도</h3>
				<p>아름다운 자연과 독특한 문화로 유명한 섬입니다. 신비로운 오름과 맑은 바다를 즐겨보세요.</p>
				<a href="jeju.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travel3.jpg" alt="부산">
				<h3>부산</h3>
				<p>다채로운 해변과 맛있는 음식이 가득한 해양 도시입니다. 해운대와 자갈치 시장을 방문해보세요.</p>
				<a href="busan.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travel4.jpg" alt="교토">
				<h3>교토</h3>
				<p>일본의 전통적인 아름다움이 살아있는 도시입니다. 고즈넉한 사찰과 정원을 감상해보세요.</p>
				<a href="kyoto.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travel5.jpg" alt="파리">
				<h3>파리</h3>
				<p>예술과 낭만의 도시로 알려져 있습니다. 에펠탑과 루브르 박물관을 방문해보세요.</p>
				<a href="paris.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travel6.jpg" alt="발리">
				<h3>발리</h3>
				<p>인도네시아의 아름다운 섬으로 휴양과 문화 체험이 가능합니다. 맑은 바다와 열대 우림을 즐겨보세요.</p>
				<a href="bali.html">자세히 보기</a>
			</div>
		</div>

		<h2>테마별 여행지 추천</h2>
		<p>여행 스타일에 맞는 테마별 여행지를 찾아보세요.</p>
		<div class="destination">
			<div class="destination-card">
				<img src="../static/resources/travelact.jpg" alt="모험 여행">
				<h3>모험 여행</h3>
				<p>아드레날린이 넘치는 액티비티와 함께하는 모험 여행을 즐겨보세요.</p>
				<a href="adventure.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travelcul.jpg" alt="문화 탐방">
				<h3>문화 탐방</h3>
				<p>다양한 문화와 역사를 경험할 수 있는 여행지입니다.</p>
				<a href="culture.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travelrel.jpg" alt="휴양지">
				<h3>휴양지</h3>
				<p>편안한 휴식과 재충전을 위한 최고의 장소를 소개합니다.</p>
				<a href="relax.html">자세히 보기</a>
			</div>
		</div>

		<h2>실시간 인기 여행지 순위</h2>
		<table>
			<tr>
				<th>순위</th>
				<th>여행지</th>
				<th>인기도</th>
			</tr>
			<tr>
				<td>1</td>
				<td>서울</td>
				<td>★★★★★</td>
			</tr>
			<tr>
				<td>2</td>
				<td>제주도</td>
				<td>★★★★★</td>
			</tr>
			<tr>
				<td>3</td>
				<td>파리</td>
				<td>★★★★☆</td>
			</tr>
			<tr>
				<td>4</td>
				<td>발리</td>
				<td>★★★★☆</td>
			</tr>
			<tr>
				<td>5</td>
				<td>도쿄</td>
				<td>★★★★☆</td>
			</tr>
		</table>

		<h2>이벤트 & 프로모션</h2>
		<ul>
			<li><strong>봄맞이 할인 이벤트:</strong> 특정 여행지 항공권 최대 30% 할인!</li>
			<li><strong>가족 여행 패키지:</strong> 가족과 함께하는 특별한 여행 상품을 만나보세요.</li>
			<li><strong>조기 예약 특가:</strong> 미리 예약하고 할인 혜택을 받으세요.</li>
		</ul>

		<h2>여행 블로그 & 후기</h2>
		<p>실제 여행자들의 생생한 후기를 확인하고 여행 팁을 얻어보세요.</p>
		<div class="destination">
			<div class="destination-card">
				<img src="../static/resources/traveljeju.jpg" alt="블로그 이미지 1">
				<h3>제주도 힐링 여행기</h3>
				<p>맑은 공기와 아름다운 자연 속에서의 힐링 여행 후기입니다.</p>
				<a href="blog1.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/travelparis.jpg" alt="블로그 이미지 2">
				<h3>파리의 숨은 명소 탐방</h3>
				<p>관광객이 많이 찾지 않는 파리의 숨은 보석 같은 장소들을 소개합니다.</p>
				<a href="blog2.html">자세히 보기</a>
			</div>
			<div class="destination-card">
				<img src="../static/resources/traveltokyo.jpg" alt="블로그 이미지 3">
				<h3>도쿄 맛집 투어</h3>
				<p>도쿄에서 꼭 가봐야 할 맛집을 소개합니다. 음식 사진과 함께!</p>
				<a href="blog3.html">자세히 보기</a>
			</div>
		</div>

		<h2>맞춤 여행 상담</h2>
		<p>
			당신의 취향과 예산에 맞는 맞춤 여행을 계획해 드립니다. 전문가와 함께 완벽한 여행을 만들어 보세요.
		</p>
		<a class="cta-button" href="consultation.html">맞춤 여행 상담 신청하기</a>
	</div>
</div>

</section>
</body>
</html>
