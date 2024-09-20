<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>title</title>
<!-- Flatpickr(달력 라이브러리) CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
		padding: 10px 0;
		width: 100%;
		background: lightgray;
		color: white;
		text-align: center;
		font-family: 'Hahmlet';
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
		width: 80px;
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
		.footer-info, .footer-contact {
			text-align: center;
		}
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

</script>

<sitemesh:write property="head" />

</head>

<body>
	<header>
		<div id="section1">
			<div id="logo">
				<a href="../main/index"> <img src="../static/resources/eltlogo.png" width="200px" height="75px"> </a>

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
		}
		else {
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
					}
					else {
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
			</div>
		</div>
	</footer>

</body>
</html>