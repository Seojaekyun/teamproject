<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>title</title>
<!-- Flatpickr(달력 라이브러리) CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
		height: 450px;
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
		height: 55px;
		position: relative;
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
	.booking_widget_list li.active {
		background-color: white;
		border: 3px solid white;
	}
	.booking_widget_list li.active span {
		color: #65728a;
		font-weight: 900;
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
		display: block;
		padding-left: 40px;
		padding-top: 30px;
		padding-right: 40px;
		padding-bottom: 10px;
	}
	.select_contents, .check-in_contents, .schedule_contents {
		position: relative;
		width: 100%;
		height: 220px;
		z-index: 3;
		background-color: white;
		border: 2px solid white;
		border-radius: 15px;
		margin-top: -10px;
		padding-left: 40px;
		padding-top: 30px;
		padding-right: 40px;
		padding-bottom: 10px;
		display: none;
	}
	.b_methodbox {
		float: left;
		width: auto;
		margin-top: 0;
		margin-right: 3.5rem;
		margin-bottom: 1rem;
		text-align: left;
	}
	.booking_types {
		border: 1px solid black;
		border-radius: 25px;
	}
	.booking_types li {
		display: inline-block;
		list-style-list: none;
	}
	.booking_types li button {
		font-size: 17px;
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
		border: none;
		border-radius: 23px;
		color: white;
		background-color: #65728a;
		cursor: pointer;
	}
	#quick_booking {
		display: flex;
		justify-content: space-between;
		align-items: center;
		align-self: flex-start;
		width: 270px;
		height: 80px;
	}
	.quick_booking_button {
		flex: 1;
		text-align: center;
		margin: 0 5px;
		padding: 10px;
		border: none;
		background-color: white;
		cursor: pointer;
		font-size: 16px;
		color: #333;
		border-radius: 15px;
	}
	.circle_button {
		flex-grow: 1;
		width: 40px;
		height: 40px;
		border-radius: 50%;
		padding: 0px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.quick_booking_button:first-child {
		flex-grow: 2;
	}
	.quick_booking_button:last-child {
		flex-grow: 2;
	}
	.quick_booking_button:hover {
		background-color: #ddd;
	}
	#from-text, #departure-text {
		display: block;
		margin: 0;
	}
	#from-text, #to-text {
		font-size: 40px;
		font-weight: bold;
	}
	#departure-text, #arrival-text {
		font-size: 14px;
		color: #666;
	}
	.popup {
		display: none;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
		z-index: 1000;
	}
	.popup-content {
		position: relative;
		margin: 15% auto;
		padding: 20px;
		width: 80%;
		max-width: 600px;
		background-color: #fff;
		border-radius: 5px;
	}
	.close-btn {
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 24px;
		cursor: pointer;
	}
	.quick_booking_aligner {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 10px;
		width: 1000px;
		margin-left: -10px;
		margin-top: 45px;
	}
	p {
		font-size: 13px;
		color: #333;
	}
	#date_selection button, #passenger_selection button, #seats_selection button {
		width: 130px;
		padding-top: 20px;
		padding-bottom: 5px;
		background-color: transparent;
		border: none;
		border-bottom: 1px solid #333;
		font-size: 14px;
		color: #333;
		cursor: pointer;
		text-align: left;
		outline: none;
	}
	#date_selection button {
		width: 300px;
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
	function showContent(type) {
		document.querySelectorAll('.booking_contents, .select_contents, .check-in_contents, .schedule_contents').forEach(function(el) {
			el.style.display = 'none';
		});
		if (type === 'booking') {
			document.querySelector('.booking_contents').style.display = 'block';
		} else if (type === 'select') {
			document.querySelector('.select_contents').style.display = 'block';
		} else if (type === 'check-in') {
			document.querySelector('.check-in_contents').style.display = 'block';
		} else if (type === 'schedule') {
			document.querySelector('.schedule_contents').style.display = 'block';
		}
	}
	window.onload = function() {
		document.getElementById('from-text').textContent = 'ICN';
		document.getElementById('departure-text').textContent = '인천';
		showContent('booking');
	};
	document.addEventListener('DOMContentLoaded', function() {
		function activateMenu(event) {
			document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
				el.classList.remove('active');
			});
				event.currentTarget.parentNode.classList.add('active');
		}
		document.querySelectorAll('.booking_widget_list li button').forEach(function(button) {
			button.addEventListener('click', activateMenu);
		});
	});
	function openPopup(type) {
		if (type === 'departure') {
			document.getElementById('popup').style.display = 'block';
		} else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'block';
		}
	}
	function closePopup(type) {
		if (type === 'departure') {
			document.getElementById('popup').style.display = 'none';
		} else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'none';
		}
	}
	function autocomplete(type) {
		var input, list, airports;
		if (type === 'departure') {
			input = document.getElementById('departure-input').value;
			list = document.getElementById('departure-list');
			airports = [
				{ city: "오사카", code: "KIX" },
				{ city: "인천", code: "ICN" },
				{ city: "도쿄", code: "NRT" },
				{ city: "부산", code: "PUS" }
			];
		} else if (type === 'arrival') {
			input = document.getElementById('arrival-input').value;
			list = document.getElementById('arrival-list');
			airports = [
				{ city: "도쿄", code: "NRT" },
				{ city: "부산", code: "PUS" },
				{ city: "인천", code: "ICN" },
				{ city: "오사카", code: "KIX" }
			];
		}
		if (input.trim() === '') {
			list.style.display = 'none';
			return;
		}
		list.innerHTML = '';
		var matches = airports.filter(function(airport) {
			return airport.city.toLowerCase().includes(input.toLowerCase()) || airport.code.toLowerCase().includes(input.toLowerCase());
		});
		if (matches.length > 0) {
			matches.forEach(function(match) {
				var listItem = document.createElement('li');
				listItem.textContent = match.city + ' ' + match.code;
				listItem.onclick = function() {
					if (type === 'departure') {
						document.getElementById('from-text').textContent = match.code;
						document.getElementById('departure-text').textContent = match.city;
					} else if (type === 'arrival') {
						document.getElementById('to-text').textContent = match.code;
						document.getElementById('arrival-text').textContent = match.city;
					}
					list.style.display = 'none';
					closePopup(type);
				};
				list.appendChild(listItem);
			});
			list.style.display = 'block';
		} else {
			list.style.display = 'none';
		}
	}
	function setLocation(type) {
		var input, matchedAirport, textElement, codeElement, airports;
		if (type === 'departure') {
			input = document.getElementById('departure-input').value;
			textElement = document.getElementById('departure-text');
			codeElement = document.getElementById('from-text');
			airports = [
				{ city: "오사카", code: "KIX" },
				{ city: "인천", code: "ICN" },
				{ city: "도쿄", code: "NRT" },
				{ city: "부산", code: "PUS" }
			];
		} else if (type === 'arrival') {
			input = document.getElementById('arrival-input').value;
			textElement = document.getElementById('arrival-text');
			codeElement = document.getElementById('to-text');
			airports = [
				{ city: "도쿄", code: "NRT" },
				{ city: "부산", code: "PUS" },
				{ city: "인천", code: "ICN" },
				{ city: "오사카", code: "KIX" }
			];
		}
		matchedAirport = airports.find(function(airport) {
			return airport.city.toLowerCase() === input.toLowerCase() || airport.code.toLowerCase() === input.toLowerCase();
		});
		if (matchedAirport) {
			codeElement.textContent = matchedAirport.code;
			textElement.textContent = matchedAirport.city;
		} else {
			alert("유효한 " + (type === 'departure' ? '출발지' : '도착지') + "를 선택해주세요.");
		}
		closePopup(type);
	}
	document.addEventListener('DOMContentLoaded', function() {
		var tripMethod = "round";
		var calendar = flatpickr("#date-btn", {
			mode: "range",
			dateFormat: "Y-m-d",
			showMonths: 2,
			onChange: function(selectedDates) {
				if (tripMethod === "round" && selectedDates.length === 2) {
					document.getElementById('date-btn').innerHTML = "가는 날: " + selectedDates[0].toLocaleDateString() + " - 오는 날: " + selectedDates[1].toLocaleDateString();
				} else if (tripMethod === "one-way" && selectedDates.length === 1) {
					document.getElementById('date-btn').innerHTML = "가는 날: " + selectedDates[0].toLocaleDateString();
				}
			}
		});
		var tripMethods = document.querySelectorAll('input[name="t_methods"]');
		tripMethods.forEach(function(radio) {
			radio.addEventListener('change', function() {
				if (this.value === "round") {
					tripMethod = "round";
					calendar.set("mode", "range");
				} else if (this.value === "one-way") {
					tripMethod = "one-way";
					calendar.set("mode", "single");
				}
			});
		});
	});
</script>
<sitemesh:write property="head" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		var currentURL = window.location.pathname;
		if (currentURL.includes("/member/member") || currentURL.includes("/login/login")) {
			$('.main_content').slideUp(500);
		}
	});
</script>
<body>
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
					<a href="../member/member"> 회원가입 </a>&nbsp;|&nbsp;
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
							<li class="booking_menu">
								<button type="button" onclick="showContent('booking')">
									<span> 항공권예매 </span>
								</button>
							</li>
							<li class="booking_menu">
								<button type="button" onclick="showContent('select')">
									<span> 예약조회 </span>
								</button>
							</li>
							<li class="booking_menu">
								<button type="button" onclick="showContent('check-in')">
									<span> 체크인 </span>
								</button>
							</li>
							<li class="booking_menu">
								<button type="button" onclick="showContent('schedule')">
									<span> 출도착/스케쥴 </span>
								</button>
							</li>
						</ul>
						<div class="booking_contents">
							<div class="booking_methods">
								<div class="b_methodbox">
									<ul class="booking_types">
										<li>
											<button type="button">예매</button>
										</li>
										<li>
											<button type="button">마일리지 예매</button>
										</li>
									</ul>
								</div>
								<div id="trip-methods">
									<input type="radio" name="t_methods" value="round" id="round-trip" checked>
									<label for="round-trip">왕복</label>
									<input type="radio" name="t_methods" value="one-way" id="one-way">
									<label for="one-way">편도</label>
								</div>
								<div class="quick_booking_aligner">
									<div id="quick_booking">
										<button type="button" class="quick_booking_button" onclick="openPopup('departure')">
											<span id="from-text">From</span>
											<span id="departure-text">&nbsp;출발지</span>
										</button>
										<button type="button" class="quick_booking_button circle_button">
											<img src="../static/resources/booking_reverse.png" width="40px" height="40px">
										</button>
										<button type="button" class="quick_booking_button" onclick="openPopup('arrival')">
											<span id="to-text">To</span>
											<span id="arrival-text">&nbsp;도착지</span>
										</button>
									</div>
									<div id="popup" class="popup">
										<div class="popup-content">
											<span class="close-btn" onclick="closePopup('departure')">&times;</span>
											<h2>출발지 검색</h2>
											<input type="text" id="departure-input" placeholder="출발지 입력" onkeyup="autocomplete('departure')">
											<ul id="departure-list"></ul>
											<button onclick="setLocation('departure')">선택</button>
										</div>
									</div>
									<div id="arrival-popup" class="popup">
										<div class="popup-content">
											<span class="close-btn" onclick="closePopup('arrival')">&times;</span>
											<h2>도착지 검색</h2>
											<input type="text" id="arrival-input" placeholder="도착지 입력" onkeyup="autocomplete('arrival')">
											<ul id="arrival-list"></ul>
											<button onclick="setLocation('arrival')">선택</button>
										</div>
									</div>
									<div id="date_selection">
										<p>출발일&nbsp;</p>
										<button type="button" id="date-btn"><span>가는날 ~ 오는날</span></button>
									</div>
									<div id="passenger_selection">
										<p>탑승객&nbsp;</p>
										<button type="button" id="passenger-btn"><span>인원수</span></button>
									</div>
									<div id="seats_selection">
										<p>좌석등급&nbsp;</p>
										<button type="button" id="seats-btn"><span>선택하세요</span></button>
									</div>
									<div id="search_airline">
										<button type="button" id="search-btn"><span>항공편 검색</span></button>
									</div>
								</div>
							</div>
						</div>
						<div class="select_contents">
							<div id="select methods">
								<input type="radio" name="t_methods" value="0">
								<label>왕복</label>
								<input type="radio" name="t_methods" value="1">
								<label>편도</label>
							</div>
							<div id="quick_booking">
								<button type="button">
									<span>rom</span>
									<span>$nbsp;출발지</span>
								</button>
							</div>
						</div>
						<div class="check-in_contents">
							<div id="check-in methods">
								<input type="radio" name="t_methods" value="0">
								<label>왕복</label>
								<input type="radio" name="t_methods" value="1">
								<label>편도</label>
							</div>
							<div id="quick_booking">
								<button type="button">
									<span>om</span>
									<span>$nbsp;출발지</span>
								</button>
							</div>
						</div>
						<div class="schedule_contents">
							<div id="schedule methods">
								<input type="radio" name="t_methods" value="0">
								<label>왕복</label>
								<input type="radio" name="t_methods" value="1">
								<label>편도</label>
							</div>
							<div id="quick_booking">
								<button type="button">
									<span>From</span>
									<span>$nbsp;출발지</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<style>
	#chat-console {
		width: 300px;
		height: 400px;
		border: 2px solid #2DD1C5;
		position: fixed;
		bottom: 20px;
		right: 20px;
		background-color: #fff;
		display: none;
		flex-direction: column;
	}
	#chat-header {
		background-color: #2DD1C5;
		color: white;
		padding: 10px;
		text-align: center;
		font-weight: bold;
		cursor: pointer;
		position: relative;
	}
	#chat-header button {
		position: absolute;
		top: 10px;
		right: 10px;
		background-color: red;
		color: white;
		border: none;
		padding: 5px;
		cursor: pointer;
		font-size: 12px;
		border-radius: 5px;
	}
	#chat-body {
		flex: 1;
		padding: 10px;
		overflow-y: auto;
	}
	#chat-body .message {
		margin-bottom: 10px;
	}
	#chat-body .user-message {
		color: black;
		text-align: left;
	}
	#chat-body .admin-message {
		color: blue;
		text-align: right;
	}
	#chat-input {
		display: flex;
		padding: 10px;
	}
	#chat-input input[type="text"] {
		flex: 1;
		padding: 5px;
	}
	#chat-input button {
		padding: 5px 10px;
		background-color: #23297A;
		color: white;
		border: none;
		cursor: pointer;
	}
	#chat-toggle {
		position: fixed;
		bottom: 20px;
		right: 30px;
		background-color: #2DD1C5;
		color: white;
		padding: 10px 20px;
		cursor: pointer;
		border-radius: 5px;
	}
</style>
<script>
	// 채팅 종료 및 기록 리셋
	function endChat() {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/endChat", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var chatBody = document.getElementById('chat-body');
				chatBody.innerHTML = '';
				toggleChat();
			}
		};
		xhr.send();
	}
	// 채팅 창 토글
	function toggleChat() {
		var chatConsole = document.getElementById('chat-console');
		var chatToggle = document.getElementById('chat-toggle');
		if (chatConsole.style.display === 'none' || chatConsole.style.display === '') {
			chatConsole.style.display = 'flex';
			chatToggle.style.display = 'none';
		} else {
			chatConsole.style.display = 'none';
			chatToggle.style.display = 'block';
		}
	}
	// 메시지 전송 함수
	function sendMessage() {
		var messageInput = document.getElementById('chat-message').value;
		var chatBody = document.getElementById('chat-body');
		if (messageInput.trim() === "") {
			return;
		}
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/sendMessage", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var newMessage = document.createElement('div');
				newMessage.className = "user-message";
				newMessage.textContent = "사용자: " + messageInput;
				chatBody.appendChild(newMessage);
				document.getElementById('chat-message').value = "";
			}
		};
		xhr.send("message=" + encodeURIComponent(messageInput) + "&isAdmin=false");
	}
	// Enter 키로 메시지 전송
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById('chat-message').addEventListener('keydown', function(event) {
			if (event.key === "Enter") {
				event.preventDefault();  // 기본 엔터키 동작(줄바꿈) 방지
				sendMessage();  // 메시지 전송 함수 호출
			}
		});
	});
	
	// Long Polling으로 메시지 갱신
	function pollMessages() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/main/getMessages", true);  // 메시지를 서버에서 가져옴
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var chatBody = document.getElementById('chat-body');
				var messages = JSON.parse(xhr.responseText);
				
				chatBody.innerHTML = '';  // 기존 메시지 초기화
				
				// 새로운 메시지를 화면에 추가
				messages.forEach(function(msg) {
					var newMessage = document.createElement('div');
					newMessage.className = msg.startsWith('관리자:') ? 'admin-message' : 'user-message';
					newMessage.textContent = msg;
					chatBody.appendChild(newMessage);
				});
				
				pollMessages();  // 계속해서 새로운 메시지를 가져옴
			}
		};
		
		xhr.send();
	}
	
	// 페이지 로드 후 메시지 요청 시작
	pollMessages();
</script>
	<div id="chat-toggle" onclick="toggleChat()">채팅 상담</div>
	<div id="chat-console">
		<div id="chat-header">
			채팅 상담
			<button onclick="endChat()">끝내기</button>
		</div>
		<div id="chat-body"></div>
		<div id="chat-input">
			<input type="text" id="chat-message" placeholder="메시지를 입력하세요">
			<button onclick="sendMessage()">보내기</button>
		</div>
	</div>
	<sitemesh:write property="body" />
	<footer>
		<table>
			<tr>
				<td rowspan="5" width="200"></td>
				<td rowspan="5"><img alt="logo" src="../static/resources/123.png" width="80" align="middle"></td>
				<td> 상호명 : LLTA </td>
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
				<td> 통신판매업신고 : 2023-경기비행-1233 </td>
				<td></td>
			</tr>
		</table>
	</footer>
</body>
</html>