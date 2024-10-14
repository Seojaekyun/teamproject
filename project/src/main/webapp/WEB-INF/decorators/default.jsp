<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>eLT항공</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&family=Gugi&display=swap" rel="stylesheet">
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
		height: 100px;
		position: relative;
		max-width: 1900px;
	}
	/* Logo Positioning */
	#section1 #logo {
		position: absolute;
		bottom: 0;
		left: 8%;
	}
	/* Login Menu Positioning */
	#section1 #loginMenu {
		position: absolute;
		top: 0;
		right: 10%;
		display: flex;
		text-align: right;
		font-size: 14px;
		font-weight: 600;
		padding: 10px;
	}
	#section1 #loginMenu a {
		text-decoration: none;
		color: black;
	}
	#section1 #loginMenu a:hover {
		color: #00467F;
	}
	#section1 #loginMenu ul {
		list-style: none;
		margin: 0;
		padding: 10px;
		display: flex;
		align-items: center;
	}
	#section1 #loginMenu ul li {
		position: relative;
	}
	#section1 #loginMenu .cmenu,
	#section1 #loginMenu .mmenu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 17px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
		border-radius: 5px;
	}
	#section1 #loginMenu .cmenu > li, #section1 #loginMenu .mmenu > li {
		list-style: none;
		width: 100px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		font-size: 14px;
	}
	#section1 #loginMenu .cmenu > li:hover, #section1 #loginMenu .mmenu > li:hover {
		color: #00467F;
	}
	#section1 #loginMenu #supMenu, #section1 #loginMenu #myInfo {
		position: relative;
	}
	/* Navigation Styling */
	#section1 #nav {
		position: absolute;
		bottom: 0;
		left: 40%;
		transform: translateX(-50%);
		z-index: 2000;
		max-width: 1000px;
	}
	#section1 nav {
		display: flex;
		line-height: 30px;
		font-family: Arial, sans-serif;
		font-size: 16px;
	}
	#section1 nav a {
		text-decoration: none;
		color: black;
	}
	#section1 nav a:hover {
		color: #00467F;
	}
	#section1 nav #main {
		padding-left: 0;
		margin-left: 0;
	}
	#section1 nav #main > li {
		display: inline-block;
		list-style: none;
		height: 30px;
		padding: 0 20px 0 0;
		line-height: 30px;
		text-align: left;
		font-size: 18px;
		font-weight: 750;
		position: relative;
		z-index: 5;
	}
	#section1 nav #main > li > .menu {
		padding-left: 0;
		position: absolute;
		left: 0;
		top: 29px;
		background: white;
		visibility: hidden;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 5px;
		z-index: 2000;
	}
	#section1 nav #main > li > .menu > li {
		list-style: none;
		width: 150px;
		height: 40px;
		line-height: 40px;
		padding-left: 30px;
		font-size: 14px;
		font-weight: 600;
		z-index: 2000;
	}
	/* Login Button Styling */
	#login {
		position: absolute;
		bottom: 10px;
		left: 83%;
	}
	#loginbtn {
		width: 120px;
		padding: 10px;
		border-radius: 20px;
		background: #1f0c59;
		color: white;
		font-size: 15px;
	}
	#loginbtn:hover {
		cursor: pointer;
		font-weight: bold;
		border: 2px solid #90EE90;
	}
	/* Footer Styling */
	footer {
		padding: 10px 0;
		width: 100%;
		background: lightgray;
		color: white;
		text-align: center;
		font-family: 'Hahmlet', sans-serif;
		font-size: 13px;
	}
	.footer-container {
		display: flex;
		justify-content: space-around;
		align-items: center;
		max-width: 1000px;
		margin: auto;
		flex-wrap: wrap;
	}
	.footer-logo img {
		height: 80px;
	}
	.footer-info, .footer-contact {
		text-align: left;
	}
	.footer-info div, .footer-contact div {
		margin-bottom: 5px;
	}
	@media (max-width: 768px) {
		.footer-container {
			flex-direction: column;
			text-align: center;
		}
		.footer-info,
		.footer-contact {
			text-align: center;
		}
	}
		/* Icon Hover Effects */
	#main1 .icona, #main2 .iconb, #main3 .iconc, #main4 .icond, #main5 .icone, #into .iconmem {
		margin-right: 8px;
		opacity: 0;
		transition: opacity 0.3s;
	}
	#main1:hover .icona, #main2:hover .iconb, #main3:hover .iconc, #main4:hover .icond, #main5:hover .icone, #into:hover .iconmem {
		opacity: 1;
	}
	/* Chat Console Styling */
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
		align-self: flex-end;
		clear: both;
	}
	#chat-body .admin-message {
		color: black;
		text-align: left;
		background-color: #E3F2FD;
		padding: 10px;
		border-radius: 15px;
		max-width: 80%;
		align-self: flex-start;
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
	/* Additional Footer Styling */
	.footer {
		background-color: #00467F;
		color: white !important;
		text-align: center;
		padding: 15px 0;
		margin-top: 40px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	// Menu Display Functions
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
		// Chat Functions
	function endChat() {
		sendMessage("상담이 종료되었습니다.");
		var endButton = document.getElementById('endChatButton');
		endButton.innerText = '닫기';
		endButton.onclick = closeAndResetChat;
	}
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
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById('chat-message').addEventListener('keydown', function(event) {
			if (event.key === "Enter") {
				event.preventDefault();
				sendMessage();
			}
		});
	});

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
						newMessage.textContent = '‍💻' + msg.replace(/^팅커벨:\s*/, '');
					} else {
						newMessage.className = 'user-message';
						newMessage.textContent = msg.replace(/^손님:\s*/, '');
					}
					chatBody.appendChild(newMessage);
				});
				pollMessages();
			}
		};
		xhr.send();
	}
	pollMessages();
	// Chat Popup Management
	function closePopup(type) {
		if (type === 'passenger') {
			document.getElementById('passenger-selection-popup').style.display = 'none';
		} else if (type === 'departure') {
			document.getElementById('popup').style.display = 'none';
		} else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'none';
		} else if (type === 'seats') {
			document.getElementById('seats-popup').style.display = 'none';
		}
	}
	function openPopup(type) {	
		closeAllPopups();
		if (type === 'passenger') {
			document.getElementById('passenger-selection-popup').style.display = 'block';
		} else if (type === 'departure') {
			document.getElementById('popup').style.display = 'block';
		} else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'block';
		}
	}
	function closeAllPopups() {
		document.getElementById('passenger-selection-popup').style.display = 'none';
		document.getElementById('popup').style.display = 'none';  
		document.getElementById('arrival-popup').style.display = 'none';  
		document.getElementById('seats-popup').style.display = 'none';
	}
	document.addEventListener('click', function(event) {
		var passengerPopup = document.getElementById('passenger-selection-popup');
		var seatPopup = document.getElementById('seats-popup');
		var seatSelectBtn = document.getElementById('seats-btn');
		var passengerBtn = document.getElementById('passenger-btn');
		if (passengerPopup.style.display === 'block' && !passengerPopup.contains(event.target) && event.target !== passengerBtn) {
			passengerPopup.style.display = 'none';
		}
		if (seatPopup.style.display === 'block' && !seatPopup.contains(event.target) && event.target !== seatSelectBtn) {
			seatPopup.style.display = 'none';
		}
	});
	document.addEventListener('DOMContentLoaded', function () {
		const seatSelectBtn = document.getElementById('seats-btn');
		const seatPopup = document.getElementById('seats-popup');
		seatSelectBtn.addEventListener('click', function(event) {
			event.stopPropagation();
			seatPopup.style.display = seatPopup.style.display === 'block' ? 'none' : 'block';
		});
		window.selectSeat = function(seatType) {
			document.querySelector('#seats-btn span').innerText = seatType;
			document.getElementById('seatClass-hidden').value = seatType;
			seatPopup.style.display = 'none';
		}
	});
</script>
<!-- Additional Head Content via Sitemesh -->
<sitemesh:write property="head" />
</head>
<body>
	<header>
		<div id="section1">
			<div id="logo">
				<a href="../main/index">
					<img src="../static/resources/eltlogo.png" height="90px" alt="eLT항공 로고">
				</a>
			</div>
			<div id="nav">
				<nav>
					<ul id="main">
						<li id="main1" onmouseover="viewMenu(0)" onmouseout="hideMenu(0)">
							<span class="icona">✈️</span>예약
							<ul class="menu">
								<li><a href="../reserve/reservation">항공권 예약</a></li>
								<li><a href="">예약 조회</a></li>
								<li><a href="">체크인</a></li>
								<li><a href="">운항정보</a></li>
							</ul>
						</li>
						<li id="main2" onmouseover="viewMenu(1)" onmouseout="hideMenu(1)">
							<a href="../guide/checkinGuide"><span class="iconb">✈️</span>여행준비</a>
							<ul class="menu">
								<li><a href="../guide/checkinGuide">체크인 안내</a></li>
								<li><a href="../guide/seatGuide">좌석배정 안내</a></li>
								<li><a href="../guide/baggageGuide">수하물 안내</a></li>
							</ul>
						</li>
						<li id="main3" onmouseover="viewMenu(2)" onmouseout="hideMenu(2)">
							<span class="iconc">✈️</span>최저가
							<ul class="menu">
								<li>1</li>
								<li>2</li>
								<li>3</li>
							</ul>
						</li>
						<li id="main4" onmouseover="viewMenu(3)" onmouseout="hideMenu(3)">
							<a href="../guide/travel"><span class="icond">✈️</span>여행지</a>
							<ul class="menu">
								<li><a href="">국내 여행</a></li>
								<li><a href="">해외 여행</a></li>
								<li><a href="">테마 여행</a></li>
							</ul>
						</li>
						<li id="main5" onmouseover="viewMenu(4)" onmouseout="hideMenu(4)">
							<span class="icone">✈️</span>호텔/렌터카
							<ul class="menu">
								<li><a href="https://www.agoda.com/" target="_blank" rel="noopener noreferrer">호텔</a></li>
								<li><a href="https://www.skyscanner.co.kr/car-hire" target="_blank" rel="noopener noreferrer">렌터카</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			<div id="loginMenu">
				<c:if test="${userid!=null && userid=='admin'}">
					<a href="../admin/index" style="color: orange;">관리자 홈</a>&nbsp;|&nbsp;
				</c:if>
				<c:if test="${userid==null}">
					<a href="../member/member" id="into"><span class="iconmem">📋</span>회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				</c:if>
				<c:if test="${userid!=null && userid!='admin'}">
					<span id="myInfo" onmouseover="viewMmenu(0)" onmouseout="hideMmenu(0)">
						${name}님&nbsp;|&nbsp;
						<ul class="mmenu">
							<li><a href="../member/memberView">나의정보</a></li>
							<li><a href="../reserve/list">예약정보</a></li>
							<li><a href="../member/myInq">나의문의</a></li>
						</ul>
					</span>
					<a href="../login/logout">로그아웃</a>&nbsp;|&nbsp;
				</c:if>
				<span id="supMenu" onmouseover="viewCmenu(0)" onmouseout="hideCmenu(0)">
					고객센터
					<ul class="cmenu">
						<li><a href="../gongji/list">공지사항</a></li>
						<li><a href="../inquiry/list">Q & A</a></li>
						<li><a href="../main/eventList">이벤트</a></li>
					</ul>
				</span>
			</div>
			<div id="login">
				<c:if test="${userid==null}">
					<a href="../login/login">
						<button type="button" id="loginbtn"><span>로그인</span></button>
					</a>
				</c:if>
			</div>
		</div>
	</header>

	<!-- 채팅 상담 버튼 -->
	<div id="chat-toggle" onclick="toggleChat()">
		<img src="../static/resources/cb.png" id="chatbot" alt="채팅 상담">
	</div>
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

	<!-- Sitemesh Body Content -->
	<sitemesh:write property="body" />

	<!-- Footer -->
	<div class="footer" style="color: white">
		<span>© 2024 여행사. 모든 권리 보유.</span>
	</div>
	<footer>
		<div class="footer-container">
			<div class="footer-logo">
				<img alt="eLT항공 로고" src="../static/resources/eltlogo.png" align="middle">
			</div>
			<div class="footer-info">
				<div>(주)eLT항공</div>
				<div>대표이사 주인장</div>
				<div>본사 : 경기도 파주시 야당동</div>
				<div>사업자 등록번호 444-44-44444</div>
				<div>통신판매업신고 : 2023-경기비행-1233</div>
			</div>
			<div class="footer-contact">
				<div>365고객센터</div>
				<div>080-888-1234(무료)</div>
				<div>email : Tmaster@air.co.kr</div>
				<div>전화번호 010-1234-5678</div>
				<div>&nbsp;</div>
			</div>
		</div>
	</footer>
</body>
</html>