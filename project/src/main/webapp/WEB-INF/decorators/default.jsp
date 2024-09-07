<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Gugi&family=Hahmlet:wght@100..900&display=swap');
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	body {
		margin: auto;
		font-family: 'Hahmlet';
	}
	header {
		width: 100%;
		margin: auto;
	}
	#section1 {
		width: 100%;
		height: 80px;
		margin: auto;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	#section1 #logo {
		width: 200px;
		height: 75px;
		margin-left: 50px;
	}
	#section1 #loginMenu {
		display: flex;
		align-items: center;
		font-size: 20px;
		font-weight: 600;
		margin-right: 60px;
	}
	#section1 #loginMenu a {
		text-decoration: none;
		color: black;
	}
	#section1 #loginMenu a:hover {
		text-decoration: none;
		color: green;
		font-weight: 900;
	}
	#section1 #loginMenu ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
		display: flex;
		align-items: center;
	}
	#section1 #loginMenu ul li {
		position: relative;
		margin-right: 10px;
	}
	#section1 #loginMenu .cmenu, #section1 #loginMenu .mmenu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 30px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
	}
	#section1 #loginMenu .cmenu > li, #section1 #loginMenu .mmenu > li {
		list-style-type: none;
		width: 130px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		border-bottom: 1px solid #ddd;
	}
	#section1 #loginMenu .cmenu > li:hover, #section1 #loginMenu .mmenu > li:hover {
		text-decoration: underline;
		color: green;
	}
	#section1 #loginMenu #supMenu {
		position: relative;
	}
	#section1 #loginMenu #myInfo {
		position: relative;
	}
	#section1 #loginMenu #supMenu .menu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 30px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
	}
	#section1 #loginMenu #supMenu .menu > li {
		list-style-type: none;
		width: 130px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		border-bottom: 1px solid #ddd;
	}
	#section1 #loginMenu #supMenu .menu > li:hover {
		text-decoration: underline;
		color: green;
	}
	header > nav {
		width: 1200px;
		height: 70px;
		margin: auto;
		line-height: 50px;
		font-family: 'Gugi';
	}
	header > nav a {
		text-decoration: none;
		color: black;
	}
	header > nav a:hover {
		text-decoration: underline;
		color: green;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px  1px 0 #000, 1px  1px 0 #000;
	}
	header > nav #main {
		padding-left: 0px;
		margin-left: 100px;
	}
	header > nav #main > li {
		display: inline-block;
		list-style-type: none;
		width: 200px;
		height: 50px;
		line-height: 30px;
		text-align: center;
		font-weight: 900;
		position: relative;
		z-index: 5;
	}
	header > nav #main > li > .menu {
		padding-left: 0px;
		position: absolute;
		left: 0px;
		top: 48px;
		background: white;
		visibility: hidden;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	header > nav #main > li > .menu > li {
		list-style-type: none;
		width: 200px;
		height: 35px;
		line-height: 35px;
		border-bottom: 1px solid #ddd;
	}
	footer {
		padding-top: 10px;
		padding-bottom: 5px;
		width: 100%;
		height: auto;
		margin: auto;
		font-family: 'Hahmlet';
		margin-top: 30px;
		font-size: 13px;
		background: #9AB973;
		color: white;
		text-align: center;
	}
	footer table {
		width: 100%;
		max-width: 1000px;
		margin: auto;
	}
	@media (max-width: 768px) {
		header, #outer #first, nav ul {
			flex-direction: column;
			text-align: center;
		}
		nav ul li {
			display: block;
			margin: 10px 0;
		}
		footer table, footer td {
			font-size: 11px;
		}
	}
	.air_service {
		position: relative;
		background-image: url('../static/resources/background.jpg');
		background-size: cover;
		width: 100%;
		height: 503px;
		background-repeat: no-repeat;
		z-index: 0;
	}
	.air_align {
		margin-left: 73px;
		margin-right: 73px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.air_contentbox {
		position: relative;
		top: 5.3rm;
		left: 0;
		width: 90%;
		height: 70%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		z-index: 2;
	}
	.air_widget {
		position: absolute;
		top: 7.4rem;
		display: block;
		width: 100%;
		height: 54px;
		content: "";
		z-index: 1;
		margin: auto;
	}
	.booking_widget_list {
		list-style-type: none;
		padding: 0;
		margin: 0;
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 100%;
		height: 100ox;
		position: relative;
	}
	.booking_widget_list:before {
		position: absolute;
		top: 0;
		left: 1.3rem;
		display: block;
		width: calc(100% - 2.6rem);
		height: 100%;
		content: none;
		background-color: #65728a;
	}
	.booking_widget_list li {
		flex: 1;
		text-align: center;
		border: 1px solid #65728a;
		padding-block: 15px;
		border-top-left-radius: 15px;
		border-top-right-radius: 15px;
		margin: 0.5px;
		background-color: #65728a;
		z-index: 2;
	}
	#booking_menu {
		display: inline-block;
	}
	.booking_widget_list button {
		width: 100%;
		height: 100%;
		background: none;
		border: none;
		font-size: 16px;
		cursor: pointer;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.booking_widget_list button span {
		font-size: 16px;
		color: white;
		position: relative;
		top: -5px;
	}
	.booking_contents {
		position: relative;
		width: 100%;
		height: 220px;
		z-index: 3;
		background-color: white;
		border: 2px solid white;
		border-radius: 15px;
		margin-top: -10px;
	}
</style>
<script>
	function viewCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "block";
	}
	
	function hideCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "none";
	}
	
	function viewMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "block";
	}
	
	function hideMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "none";
	}
	
	function viewMenu(n) {
		document.getElementsByClassName("menu")[n].style.visibility = "visible";
	}
	
	function hideMenu(n) {
		document.getElementsByClassName("menu")[n].style.visibility = "hidden";
	}

</script>

	<sitemesh:write property="head"/>
	
</head>
<body>

<script>
	window.onload = function() {
		// 현재 URL을 가져옴
		var currentURL = window.location.pathname;

		// 만약 현재 페이지가 member 페이지라면
		if(currentURL.includes("/member/member")||currentURL.includes("/login/login")) {
			// main_content 요소를 숨김
			document.querySelector('.main_content').style.display = 'none';
		}
	};
</script>

	<header>
		<div id="section1">
			<div id="logo">
				<a href="../main/index">
					<img src="../static/resources/eltlogo.png" width="200px" height="75px">
				</a>
			</div>
			<div id="loginMenu">
				<c:if test="${userid!=null&&userid=='admin'}">
					<a href="../admin/index" style="color: orange;"> 관리자 홈 </a>&nbsp;|&nbsp;
				</c:if>
				<c:if test="${userid==null}">
					<a href="../member/member" onclick="hideMainContent()"> 회원가입 </a>&nbsp;|&nbsp;
					<a href="../login/login"> 로그인 </a>&nbsp;|&nbsp;
				</c:if>
				<c:if test="${userid!=null}">
					<span id="myInfo" onmouseover="viewMmenu(0)" onmouseout="hideMmenu(0)"> ${name}님 &nbsp;|&nbsp;
						<ul class="mmenu">
							<li> 회원정보 </li>
							<li> 예약정보 </li>
							<li> 나의문의 </li>
						</ul>
					</span>
					<a href="../login/logout"> 로그아웃 </a>&nbsp;|&nbsp;
				</c:if>
				<span id="supMenu" onmouseover="viewCmenu(0)" onmouseout="hideCmenu(0)"> 고객센터
					<ul class="cmenu">
						<li><a href="../gongji/list"> 공지사항 </a></li>
						<li><a href="../inquiry/list"> Q & A </a></li>
						<li> 이벤트 </li>
					</ul>
				</span>
			</div>
		</div>
		<nav>
			<ul id="main">
				<li onmouseover="viewMenu(0)" onmouseout="hideMenu(0)"> 예약
					<ul class="menu">
						<li><a href="../menu/index1">여행 준비</a></li>
						<li><a href="../menu/index2">여행</a></li>
						<li><a href="../menu/index3">예약 취소</a></li>
					</ul>
				</li>
				<li onmouseover="viewMenu(1)" onmouseout="hideMenu(1)"> 항공권
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(2)" onmouseout="hideMenu(2)"> 최저가
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(3)" onmouseout="hideMenu(3)"> 여행지
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(4)" onmouseout="hideMenu(4)"> 호텔
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
	<div class="main_content">
		<div class="air_service">
			<div class="air_align">
				<div class="air_contentbox">
					<div id="air_alert"></div>
					<div class="air_widget">
						<ul class="booking_widget_list">
							<li id="booking_menu">
								<button type="button">
									<span> 항공권예매 </span>
								</button>
							</li>
							<li id="booking_menu">
								<button type="button">
									<span> 예약조회 </span>
								</button>
							</li>
							<li id="booking_menu">
								<button type="button">
									<span> 체크인 </span>
								</button>
							</li>
							<li id="booking_menu">
								<button type="button">
									<span> 출도착/스케쥴 </span>
								</button>
							</li>
						</ul>
						<div class="booking_contents">
							<div id="trip methods">
								<input type="radio" name="t_methods" value="0">
								<label>왕복</label>
								<input type="radio" name="t_methods" value="1">
								<label>편도</label>
							</div>
							<div id="quick_booking">
								<button type="button">
									<span>From</span>
								<span>$nbsp;출발지</span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<sitemesh:write property="body"/>

	<footer>
		<table>
			<tr>
				<td rowspan="5" width="200"></td>
				<td rowspan="5"><img alt="logo" src="../static/resources/123.png" width="80" align="middle"></td>
				<td> 상호명 : ELTA </td>
				<td> 365고객센터 </td>
			</tr>
			<tr>
				<td> 대표이사 : 주인장 </td>
				<td> 080-888-1234(무료) </td>
			</tr>
			<tr>
				<td> 본사 : 경기도 파주시 야당동 </td>
				<td> email : Tmaster@air.co.kr </td>
			</tr>
			<tr>
				<td> 사업자 등록번호 : 444-44-44444 </td>
				<td> 전화번호 : 010-1234-5678 </td>
			</tr>
			<tr>
				<td> 통신판매업신고 : 2023-경기비행-1234 </td>
				<td></td>
			</tr>
		</table>
	</footer>
</body>
</html>