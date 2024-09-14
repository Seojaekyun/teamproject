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
		font-family: Arial, sans-serif;
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
		color: #00467F;
	}
	#section1 #loginMenu ul {
		list-style-type: none;
		margin: 0;
		padding: 10px;;
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
		top: 28px;
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
	#section1 #loginMenu .cmenu > li:hover,	#section1 #loginMenu .mmenu > li:hover {
		text-decoration: none;
		color: #00467F;
	}
	#section1 #loginMenu #supMenu, #section1 #loginMenu #myInfo {
		position: relative;
	}
	header > nav {
		width: 1200px;
		height: 70px;
		margin: auto;
		line-height: 50px;
		font-family: Arial, sans-serif;
		font-size: 18px;
	}
	header > nav a {
		text-decoration: none;
		color: black;
	}
	header > nav a:hover {
		text-decoration: none;
		color: #00467F;
		
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
		top: 33px;
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
			background: gray;
			color: white;
			text-align: center;
		}
		.footer-container {
			width: 100%;
			max-width: 1000px;
			margin: auto;
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			align-items: flex-start;
		}
		.footer-logo {
			flex: 0 0 200px;
			margin-bottom: 10px;
		}
		.footer-content {
			flex: 1;
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
		}
		.footer-row {
			width: 100%;
			display: flex;
			justify-content: space-between;
			margin-bottom: 5px;
		}
		.footer-column {
			flex: 1;
			text-align: left;
			padding: 0 10px;
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
			footer .footer-container, .footer-content, .footer-row {
				flex-direction: column;
				align-items: center;
			}
			.footer-column {
				text-align: center;
				padding: 5px 0;
			}
		}
	.main_content {
		display: none;
	}
	.air_service {
		position: relative;
		background-image: url('../static/resources/background.jpg');
		background-size: cover;
		width: 100%;
		height: 450px;
		background-repeat: no-repeat;
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
	.booking_contents, .select_contents, .check-in_contents, .schedule_contents {
		position: relative;
		width: 100%;
		height: 220px;
		z-index: 3;
		background-color: white;
		border: 2px solid white;
		border-radius: 15px;
		margin-top: -10px;
		padding: 30px 40px 10px 40px;
		display: none;
	}
	.booking_contents {
		display: block;
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
		list-style-type: none;
	}
	.booking_types li button {
		font-size: 17px;
		padding: 10px 20px;
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
	.quick_booking_button:first-child,
	.quick_booking_button:last-child {
		flex-grow: 2;
	}
	.quick_booking_button:hover {
		background-color: #ddd;
	}
	#from-text,
	#departure-text,
	#to-text,
	#arrival-text {
		display: block;
		margin: 0;
	}
	#from-text,
	#to-text {
		font-size: 40px;
		font-weight: bold;
	}
	#departure-text,
	#arrival-text {
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
	#date_selection button,
	#passenger_selection button,
	#seats_selection button {
		width: 130px;
		padding: 20px 0 5px;
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
	/* 인원 선택 팝업 스타일 */
	#passenger-selection-popup .passenger-counter {
		display: flex;
		flex-direction: column;
		gap: 10px;
	}
	.passenger-type {
		display: flex;
		align-items: center;
		gap: 10px;
	}
	.passenger-type p {
		margin: 0;
		width: 50px;
	}
	.passenger-type button {
		width: 30px;
		height: 30px;
		font-size: 20px;
		border: 1px solid #ccc;
		background-color: #fff;
		cursor: pointer;
	}
	.passenger-type span {
		width: 20px;
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					document.getElementById('date-btn').innerHTML = "가는날 ~ 오는날";
				} else if (this.value === "one-way") {
					tripMethod = "one-way";
					calendar.set("mode", "single");
					document.getElementById('date-btn').innerHTML = "가는날";
				}
			});
		});
	});
	// 인원 선택 팝업 열기
	function openPassengerPopup() {
		document.getElementById('passenger-selection-popup').style.display = 'block';
	}
	// 인원 선택 팝업 닫기
	function closePassengerPopup() {
		document.getElementById('passenger-selection-popup').style.display = 'none';
	}
	// 인원 수 증가 함수
	function increase(type) {
		var countElement = document.getElementById(type + '-count');
		var count = parseInt(countElement.textContent);
		countElement.textContent = count + 1;
	}
	// 인원 수 감소 함수
	function decrease(type) {
		var countElement = document.getElementById(type + '-count');
		var count = parseInt(countElement.textContent);
		if (count > 0) {
			countElement.textContent = count - 1;
		}
	}
	// 인원 선택 완료 함수
	function confirmPassengers() {
		var adultCount = document.getElementById('adult-count').textContent;
		var childCount = document.getElementById('child-count').textContent;
		var infantCount = document.getElementById('infant-count').textContent;
		var totalPassengers = "성인 " + adultCount + "명, 소아 " + childCount + "명, 유아 " + infantCount + "명";
		document.getElementById('passenger-btn').innerHTML = totalPassengers;
		closePassengerPopup();
	}
	
	$(function() {
	    var currentURL = window.location.pathname;
	    var referrerURL = document.referrer ? (new URL(document.referrer)).pathname : '';

	    function isIndex(url) {
	        return url === '/' || url.endsWith('/index') ;
	    }

	    if (isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
	        // 처음 인덱스가 열릴 때: 슬라이드 다운 실행
	        $('.main_content').slideDown(1000);
	    } else if (!isIndex(currentURL) && isIndex(referrerURL)) {
	        // 인덱스에서 다른 페이지로 이동할 때: 슬라이드 업 실행
	        $('.main_content').show().slideUp(500);
	    } else if (!isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
	        // 인덱스가 아닌 다른 페이지들 간 이동: 메인 컨텐츠 상태 변경 없음
	        // 아무 작업도 하지 않음
	    } else {
	        // 그 외의 경우: 메인 컨텐츠 표시
	        $('.main_content').show();
	    }
	});


</script>

<sitemesh:write property="head" />

</head>

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
						<li><a href="../reserve/reserve">항공권 예약</a></li>
						<li><a href="../menu/index2">예약 조회</a></li>
						<li><a href="../menu/index3">체크인</a></li>
						<li><a href="../menu/index3">운항정보</a></li>
					</ul>
				</li>
				<li onmouseover="viewMenu(1)" onmouseout="hideMenu(1)">
					<a href="../guide/checkinGuide">여행준비</a>
					<ul class="menu">
						<li><a href="../guide/checkinGuide">체크인</a></li>
						<li><a href="../guide/seatGuide">좌석배정</a></li>
						<li><a href="../guide/baggageGuide">수하물</a></li>
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
				<li onmouseover="viewMenu(4)" onmouseout="hideMenu(4)">
					<a href="https://kr.hotels.com/en/?locale=en_US&siteid=300000041&semcid=HCOM-KR.B.GOOGLE.BT-c-EN.GT&semdtl=a118251106649.b1141783171757.g1kwd-324456688060.e1c.m1CjwKCAjwxY-3BhAuEiwAu7Y6s7KXpMTsJnHn5PuW6d4K1hEF5a4bjaFUpneW0s8fNCtDXFCZlBGXtRoCHvEQAvD_BwE.r1006f90a2301371776d11c8cc22069d38bd13a4cf95a9f802dfa68907dc4069d6.c18NrPiYS3BbMcb8bv0o2xPA.j11030718.k1.d1624808917252.h1e.i1.l1.n1.o1.p1.q1.s1.t1.x1.f1.u1.v1.w1&gad_source=1&gclid=CjwKCAjwxY-3BhAuEiwAu7Y6s7KXpMTsJnHn5PuW6d4K1hEF5a4bjaFUpneW0s8fNCtDXFCZlBGXtRoCHvEQAvD_BwE" target="_blank">
					 호텔
					</a>
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
									<!-- 출발지 팝업 -->
									<div id="popup" class="popup">
										<div class="popup-content">
											<span class="close-btn" onclick="closePopup('departure')">&times;</span>
											<h2>출발지 검색</h2>
											<input type="text" id="departure-input" placeholder="출발지 입력" onkeyup="autocomplete('departure')">
											<ul id="departure-list"></ul>
										</div>
									</div>
									<!-- 도착지 팝업 -->
									<div id="arrival-popup" class="popup">
										<div class="popup-content">
											<span class="close-btn" onclick="closePopup('arrival')">&times;</span>
											<h2>도착지 검색</h2>
											<input type="text" id="arrival-input" placeholder="도착지 입력" onkeyup="autocomplete('arrival')">
											<ul id="arrival-list"></ul>
										</div>
									</div>
									<!-- 날짜 선택 버튼 -->
									<div id="date_selection">
										<p>출발일&nbsp;</p>
										<button type="button" id="date-btn"><span>가는날 ~ 오는날</span></button>
									</div>
									<!-- 탑승객 선택 버튼 -->
									<div id="passenger_selection">
										<p>탑승객&nbsp;</p>
										<button type="button" id="passenger-btn" onclick="openPassengerPopup()"><span>인원수</span></button>
									</div>
									<!-- 승객 선택 팝업 -->
									<div id="passenger-selection-popup" class="popup">
										<div class="popup-content">
											<span class="close-btn" onclick="closePassengerPopup()">&times;</span>
											<h2>승객 선택</h2>
											<div class="passenger-counter">
												<div class="passenger-type">
													<p>성인</p>
													<button class="decrease-btn" onclick="decrease('adult')">-</button>
													<span id="adult-count">1</span>
													<button class="increase-btn" onclick="increase('adult')">+</button>
												</div>
												<div class="passenger-type">
													<p>소아</p>
													<button class="decrease-btn" onclick="decrease('child')">-</button>
													<span id="child-count">0</span>
													<button class="increase-btn" onclick="increase('child')">+</button>
												</div>
												<div class="passenger-type">
													<p>유아</p>
													<button class="decrease-btn" onclick="decrease('infant')">-</button>
													<span id="infant-count">0</span>
													<button class="increase-btn" onclick="increase('infant')">+</button>
												</div>
											</div>
											<button type="button" onclick="confirmPassengers()">선택 완료</button>
										</div>
									</div>
									<!-- 좌석등급 선택 버튼 -->
									<div id="seats_selection">
										<p>좌석등급&nbsp;</p>
										<button type="button" id="seats-btn"><span>선택하세요</span></button>
									</div>
									<!-- 항공편 검색 버튼 -->
									<div id="search_airline">
										<button type="button" id="search-btn"><span>항공편 검색</span></button>
									</div>
								</div>
							</div>
						</div>
						<div class="select_contents">
							<!-- 예약조회 콘텐츠 -->
						</div>
						<div class="check-in_contents">
							<!-- 체크인 콘텐츠 -->
						</div>
						<div class="schedule_contents">
							<!-- 출도착/스케줄 콘텐츠 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 채팅 스타일 -->
<style>
	#chat-console {
		width: 320px;
		height: 450px;
		border: 2px solid #2DD1C5;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		position: fixed;
		bottom: 20px;
		right: 20px;
		background-color: #fff;
		display: none;
		flex-direction: column;
		overflow: hidden;
		font-family: Arial, sans-serif;
		z-index: 9999;
	}
	#chat-header {
		background-color: #2DD1C5;
		color: white;
		padding: 15px;
		text-align: center;
		font-weight: bold;
		cursor: pointer;
		position: relative;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		z-index: 9999;
	}
	#chat-header button {
		position: absolute;
		top: 50%;
		right: 15px;
		transform: translateY(-50%);
		background-color: #E74C3C;
		color: white;
		border: none;
		padding: 5px 10px;
		cursor: pointer;
		font-size: 12px;
		border-radius: 5px;
		transition: background-color 0.3s;
		z-index: 9999;
	}
	#chat-header button:hover {
		background-color: #C0392B;
	}
	#chat-body {
		flex: 1;
		padding: 15px;
		overflow-y: auto;
		background-color: #F8F9FA;
		display: flex;
		flex-direction: column;
	}
	#chat-body .message {
		margin-bottom: 12px;
		display: flex;
		width: 100%;
	}
	#chat-body .user-message {
		color: white;
		text-align: right;
		background-color: #2DD1C5;
		padding: 10px;
		border-radius: 15px;
		max-width: 80%;
		display: block;
		align-self: flex-end; /* 오른쪽 정렬 */
		clear: both;
	}	
	#chat-body .admin-message {
		color: black;
		text-align: left;
		background-color: #E3F2FD;
		padding: 10px;
		border-radius: 15px;
		max-width: 80%;
		display: block;
		align-self: flex-start; /* 왼쪽 정렬 */
		clear: both;
	}
	#chat-input {
		display: flex;
		padding: 10px;
		background-color: #F1F1F1;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	#chat-input input[type="text"] {
		flex: 1;
		padding: 10px;
		border: 1px solid #CCC;
		border-radius: 20px;
		outline: none;
		margin-right: 10px;
	}
	#chat-input button {
		padding: 8px 15px;
		background-color: #2DD1C5;
		color: white;
		border: none;
		cursor: pointer;
		border-radius: 20px;
		transition: background-color 0.3s;
	}
	#chat-input button:hover {
		background-color: #1A9987;
	}
	#chat-toggle {
		position: fixed;
		width: 60px;
		height: 60px;
		bottom: 20px;
		right: 30px;
		background-color: #00467F;
		color: yellow;
		padding: 5px;
		cursor: pointer;
		border-radius: 30px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		transition: background-color 0.3s;
		font-family: Arial, sans-serif;
		font-size: 30px;
	}
	#chatbot {
		width: 95%;
		height: 95%;
	}
	#chat-toggle:hover {
		background-color: #1A9987;
	}
</style>
<script>
	// 상담 종료 시
	function endChat() {
		sendMessage("상담이 종료되었습니다.");
		var endButton = document.getElementById('endChatButton');
		endButton.innerText = '닫기';
		endButton.onclick = closeAndResetChat;
	}
	// 닫기 버튼
	function closeAndResetChat() {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/resetChatHistory", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var chatBody = document.getElementById('chat-body');
				chatBody.innerHTML = '';
				var chatConsole = document.getElementById('chat-console');
				chatConsole.style.display = 'none';
				var chatToggle = document.getElementById('chat-toggle');
				chatToggle.style.display = 'block';
				var endButton = document.getElementById('endChatButton');
				endButton.innerText = '끝내기';
				endButton.onclick = endChat;
			}
		};
		xhr.send();
	}
	// 메시지 전송 함수
	function sendMessage(message) {
		var messageInput = message || document.getElementById('chat-message').value;
		var chatBody = document.getElementById('chat-body');
		if (messageInput.trim() === "") return;
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "../main/sendMessage", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var newMessage = document.createElement('div');
				newMessage.className = "user-message";
				newMessage.textContent = messageInput;
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
				event.preventDefault();
				sendMessage();
			}
		});
	});
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
	// 메시지 갱신
	function pollMessages() {
	    var xhr = new XMLHttpRequest();
	    xhr.open("GET", "/main/getMessages", true);
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            var chatBody = document.getElementById('chat-body');
	            var messages = JSON.parse(xhr.responseText);
	            chatBody.innerHTML = '';
	            messages.forEach(function(msg) {
	                var newMessage = document.createElement('div');
	                if (msg.startsWith('팅커벨:')) {
	                    newMessage.className = 'admin-message';
	                    newMessage.textContent = '‍💻'+ msg.replace(/^팅커벨:\s*/, '');
	                } else {
	                    newMessage.className = 'user-message';
	                    // "손님: " 접두사를 제거하고 메시지만 출력
	                    newMessage.textContent = msg.replace(/^손님:\s*/, '');
	                }
	                chatBody.appendChild(newMessage);
	            });
	            pollMessages();
	        }
	    };
	    xhr.send();
	}
	// 페이지 로드 후 메시지 요청 시작
	pollMessages();
</script>

	<!-- 채팅 상담 버튼 -->
	<div id="chat-toggle" onclick="toggleChat()"><img src="../static/resources/cb.png" id="chatbot"></div>
	
	<!-- 채팅 창 -->
	<div id="chat-console">
		<div id="chat-header">
		채팅 상담
		<button id="endChatButton" onclick="endChat()">끝내기</button>
		</div>
		<div id="chat-body"></div>
		<div id="chat-input">
			<input type="text" id="chat-message" placeholder="메시지를 입력하세요">
			<button onclick="sendMessage()">보내기</button>
		</div>
	</div>
	
<sitemesh:write property="body" />

	<footer>
		<div class="footer-container">
			<div class="footer-logo">
				<img alt="logo" src="../static/resources/123.png" width="80" align="middle">
			</div>
			<div class="footer-content">
				<div class="footer-row">
					<div class="footer-column">eLTA(주)</div>
					<div class="footer-column">365고객센터</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">대표이사 주인장</div>
					<div class="footer-column">080-888-1234(무료)</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">경기도 파주시 야당동</div>
					<div class="footer-column">email : Tmaster@air.co.kr</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">사업자 등록번호 444-44-44444</div>
					<div class="footer-column">전화번호 010-1234-5678</div>
				</div>
				<div class="footer-row">
					<div class="footer-column">통신판매업 신고 제 24-1233</div>
					<div class="footer-column"></div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>