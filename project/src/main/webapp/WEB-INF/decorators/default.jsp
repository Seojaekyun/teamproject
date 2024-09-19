<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>title</title>
<!-- Flatpickr(달력 라이브러리) CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- Flatpickr 한국어 로케일 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
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
		text-align: left;
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
/* booking_contents의 기본 스타일 */
.booking_contents {
	display: flex;
	flex-direction: column; /* 자식 요소들을 세로로 배치 */
	align-items: center;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 15px;
	width: 100%;
	height: 220px;
	padding-left: 40px;
	padding-top: 30px;
	padding-right: 40px;
	padding-bottom: 10px;
}

/* 예약 방법과 왕복/편도 선택 버튼을 한 줄에 나열 */
.booking_methods {
	display: absolute;
	align-items: center;
	width: 100%;
	height: 170px;
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
    list-style-type: none; /* 리스트 스타일 제거 */
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: space-between;
    border: 1px solid #ccc; /* 경계선 추가 */
    border-radius: 25px;
}

.booking_types li {
    flex: 1;
    text-align: center;
}

/* 기본 스타일 */
#general, #mileage {
	padding: 10px 20px;
    background-color: white;
    color: #1f0c59;
    border: 1px solid #ccc;
    cursor: pointer;
    border-radius: 25px;
    list-style-type: none;
    transition: background-color 0.3s, color 0.3s;
    font-size:16px;
    border:none;
}
#general{
 width: 75px;
}

#mileage{
width: 145px;}



#general:hover, #mileage:hover {
    text-decoration: underline; /* hover 시 밑줄 추가 */
    text-decoration-color: #1f0c59; /* 밑줄 색을 글씨색과 동일하게 설정 */
}

.active-button  {
	background-color: #1f0c59 !important; /* 파란색 배경 */
    color: white !important; /* 하얀색 글씨 */
    padding: 10px 20px !important; /* 좌우 패딩 */
    border-radius: 25px !important; /* 모서리 둥글게 */
    border: 1px solid #1f0c59 !important; /* 기본 테두리 제거 */
    font-size: 16px !important;
    font-weight: bold !important;
    cursor: pointer !important;
}

.active-button:hover {
    text-decoration: underline !important; /* 기본적으로 밑줄 없음 */
    text-decoration-color: white !important;}



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

/* 출/도착지 팝업 스타일 */
.popup {
	position: absolute;
	top: 280px;
	left: 0%; /* 원하는 위치로 변경 가능 */
	width: 740px;
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
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
	width: 100%;
	max-width: 1150px;
	margin-left: -10px;
	margin-top: 45px;
}

.flatpickr-calendar {
	position: absolute !important;
	left: 10% !important; top : 550px !important;
	width: 80% !important; /* 달력 전체 너비 */
	max-width: 100% !important;
	border-radius: 10px !important;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1) !important;
	font-size: 16px !important;
	top: 550px !important;
}

p {
	font-size: 14px;
	color: #333;
}

#date_selection button, #passenger_selection button, #seats_selection button
	{
	padding-top: 20px;
	padding-bottom: 5px;
	background-color: transparent;
	border: none;
	border-bottom: 1px solid #333;
	font-size: 16px;
	color: #333;
	cursor: pointer;
	text-align: left;
	outline: none;
}

#date_selection button {
	width: 310px;
}

#passenger_selection button {
	width: 150px;
}

.passenger-popup {
	position: absolute;
	top: 280px;
	left: 40%; /* 원하는 위치로 변경 가능 */
	width: 740px;
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	z-index: 1000;
	border-radius: 15px;
}

.passenger-counter {
	display: flex; /* 가로로 정렬 */
	justify-content: space-around; /* 여유 공간을 균등하게 배치 */
	align-items: center; /* 세로 정렬 */
}

.passenger-type {
	display: flex;
	align-items: center; /* 세로 정렬 */
	margin-top: 20px;
	font-size: 20px;
}

.decrease-btn, .increase-btn {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	border: 1px solid #ccc;
	background-color: #fff;
	font-size: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	margin: 0 10px; /* 버튼 간의 여유 공간 */
}

#seats_selection button {
	width: 150px;
	padding-top: 20px;
	padding-bottom: 5px;
	background-color: transparent; /* 배경색을 투명하게 설정 */
	border: none; /* 기본 테두리를 제거 */
	border-bottom: 1px solid #333; /* 하단에만 테두리 추가 */
	font-size: 14px; /* 글자 크기 조정 */
	color: #333; /* 텍스트 색상 */
	cursor: pointer; /* 마우스 포인터를 손 모양으로 변경 */
	text-align: left; /* 텍스트를 왼쪽으로 정렬 */
	outline: none; /* 클릭 시 기본 아웃라인 제거 */
}

/* 좌석 선택 팝업 스타일 */
.seats-popup {
	position: absolute;
	top: 280px;
	left: 40%; /* 원하는 위치로 변경 가능 */
	width: 740px;
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	z-index: 1000;
	border-radius: 15px;
}

.seat-options {
	display: flex;
	justify-content: space-around;
	margin-top: 20px;
}

.seat-options button {
	flex: 1;
	margin: 5px;
	padding: 15px;
	cursor: pointer;
	background-color: white;
	border: 1px solid #ccc;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

.seat-options button:hover {
	background-color: #f0f0f0;
}

/* 라디오 버튼 숨기기 */
input[name="t_methods"] {
    display: none;
}

/* 기본 버튼 스타일 */
#trip-methods label {
    cursor: pointer;
    padding: 5px 10px;
    font-size: 16px;
    border: none;
    display: inline-block;
    margin-right: 10px;
    position: relative;
    color: black;
}

/* 선택된 버튼 아래 빨간 줄 */
input[name="t_methods"]:checked + label {
    font-weight: bold;
    color: black;
}

/* 선택된 버튼 아래에 빨간 줄 */
input[name="t_methods"]:checked + label::after {
    content: "";
    display: block;
    width: 80%;
    height: 3px;
    background-color: red;
    position: absolute;
    bottom: -2px; /* 밑으로 약간의 공간을 주기 */
    left: 10%;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

<sitemesh:write property="head" />

</head>

<body>
	<header>
		<div id="section1">
			<div id="logo">
				<a href="../main/index"> <img
					src="../static/resources/eltlogo.png" width="200px" height="75px">
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
					<span id="myInfo" onmouseover="viewMmenu(0)"
						onmouseout="hideMmenu(0)"> ${name}님 &nbsp;|&nbsp;
						<ul class="mmenu">
							<li>회원정보</li>
							<li>예약정보</li>
							<li>나의문의</li>
						</ul>
					</span>
					<a href="../login/logout"> 로그아웃 </a>&nbsp;|&nbsp;
				</c:if>
				<span id="supMenu" onmouseover="viewCmenu(0)"
					onmouseout="hideCmenu(0)"> 고객센터
					<ul class="cmenu">
						<li><a href="../gongji/list"> 공지사항 </a></li>
						<li><a href="../inquiry/list"> Q & A </a></li>

						<li><a href="../main/eventList"> 이벤트 </a></li>

					</ul>
				</span>
			</div>
		</div>
		<nav>
			<ul id="main">
				<li onmouseover="viewMenu(0)" onmouseout="hideMenu(0)">예약
					<ul class="menu">
						<li><a href="../reserve/reservation">항공권 예약</a></li>
						<li><a href="">예약 조회</a></li>
						<li><a href="">체크인</a></li>
						<li><a href="">운항정보</a></li>
					</ul>
				</li>

				<li onmouseover="viewMenu(1)" onmouseout="hideMenu(1)">
					<a href="../guide/checkinGuide">여행준비</a>

					<ul class="menu">
						<li><a href="../guide/checkinGuide">체크인 안내</a></li>
						<li><a href="../guide/seatGuide">좌석배정 안내</a></li>
						<li><a href="../guide/baggageGuide">수하물 안내</a></li>
					</ul>
				</li>
				<li onmouseover="viewMenu(2)" onmouseout="hideMenu(2)">최저가
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>

				<li onmouseover="viewMenu(3)" onmouseout="hideMenu(3)">
					<a href="../guide/travel"> 여행지 </a>

					<ul class="menu">
						<li><a href="">국내 여행</a></li>
						<li><a href="">해외 여행</a></li>
						<li><a href="">테마 여행</a></li>
					</ul>
				</li>

				<li onmouseover="viewMenu(4)" onmouseout="hideMenu(4)"> 호텔/렌터카

					<ul class="menu">
						<li><a href="https://www.agoda.com/" target="_blank" rel="noopener noreferrer"> 호텔 </a></li>
						<li><a href="https://www.skyscanner.co.kr/car-hire" target="_blank" rel="noopener noreferrer"> 렌터카 </a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
	
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
				<img alt="logo" src="../static/resources/eltlogo.png" width="80" align="middle">
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