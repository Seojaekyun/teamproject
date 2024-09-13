<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	body {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		box-sizing: border-box;
	}
	header {
		width: 100%;
		background-color: gray;
		color: white;
	}
	header #first {
		display: flex;
		height: 30px;
		align-items: right;
		justify-content: flex-end;
		background-color: gray;
		padding: 10px 20px;
		box-sizing: border-box;
		color: white;
	}
	header #second {
		display: flex;
		height: 50px;
		align-items: center;
		justify-content: space-between;
		background-color: gray;
		padding: 10px 20px;
		box-sizing: border-box;
		color: white;
	}
	header #one {
		flex-shrink: 0;
		font-size: 17px;
	}
	header #one a {
		text-decoration: none;
		color: white;
	}
	header #one a:hover {
		font-weight: bold;
	}
	header #logo {
		width: 200px;
		flex-shrink: 0;
		valign: top;
	}
	header #two {
		display: flex;
		flex-grow: 1;
		justify-content: flex-start;
	}
	header #two button {
		background: none;
		border: none;
		margin: 0 10px;
		font-size: 17px;
		cursor: pointer;
	}
	header #two button a {
		text-decoration: none;
		color: white;
	}
	header #two button:hover a {
		font-weight: bold;
	}
	/* 채팅 상담 UI 스타일 */
	#chat-console {
		width: 300px;
		height: 400px;
		border: 2px solid #2DD1C5;
		position: fixed;
		bottom: 20px;
		right: 20px;
		background-color: #fff;
		display: flex; /* 기본적으로 채팅 창을 표시 */
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
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

</script>
	<sitemesh:write property="head"/>
</head>
<body>

	<header>
		<div id="first">
			<div id="one">
				<a href="../main/index">홈페이지</a>&nbsp;&nbsp;|&nbsp;&nbsp;    
				${name}&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="../login/logout">로그아웃</a>
			</div>
		</div>
		<div id="second">
			<div id="logo">
				<a href="../admin/index">
					<img src="../static/resources/eltlogo.png" height="60px" alt="로고">
				</a>
			</div>
			<div id="two">    
				<button><a href="adReserve">예약관리</a></button>
				<button><a href="gongjiList">공지사항</a></button>
				<button><a href="memberList">회원관리</a></button>
				<button><a href="">비행일정</a></button>
				<button><a href="">호텔예약</a></button>
				<button><a href="">예약통계</a></button>
				<button><a href="inquiryList">고객문의</a></button>
			</div>
		</div>
	</header>
<section>

</section>
	<!-- 관리자 채팅 상담 UI -->
	<div id="chat-console">
		<div id="chat-header">
			채팅 상담
			<button onclick="adendChat()">끝내기</button>
		</div>
		<div id="chat-body"></div>
		<div id="chat-input">
			<input type="text" id="chat-message" placeholder="답변을 입력하세요">
			<button onclick="sendMessage()">보내기</button>
		</div>
	</div>

<script>
    // 채팅 종료 시 "상담이 종료되었습니다." 메시지 전송
    function adendChat() {
        sendMessage("상담이 종료되었습니다.");
    }

    // 메시지 전송 함수 (관리자 페이지)
    function sendMessage(message, callback) {
        var messageInput = message || document.getElementById('chat-message').value;
        var chatBody = document.getElementById('chat-body');
    
        if (messageInput.trim() === "") {
            return; // 빈 메시지는 전송하지 않음
        }

        // AJAX 요청을 통해 서버에 메시지 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "../main/sendMessage", true);  // Controller 경로로 요청
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var newMessage = document.createElement('div');
                newMessage.className = "admin-message"; // 관리자로 구분
                newMessage.textContent = "팅커벨: " + messageInput; 
                chatBody.appendChild(newMessage);

                // 입력 창 비우기 (상담 종료 메시지가 아니면)
                if (!message) {
                    document.getElementById('chat-message').value = "";
                }
            }
        };
        xhr.send("message=" + encodeURIComponent(messageInput) + "&isAdmin=true");
    }

    // Enter 키로 메시지 전송 (keydown 이벤트 추가)
    document.getElementById('chat-message').addEventListener('keydown', function(event) {
        if (event.key === "Enter") {
            event.preventDefault();  // 기본 엔터키 동작(줄바꿈) 방지
            sendMessage();  // 메시지 전송 함수 호출
        }
    });

    // Long Polling으로 새로운 메시지가 있을 때만 갱신
    function pollMessages() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "../main/getMessages", true);  // 서버로부터 메시지 요청
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var chatBody = document.getElementById('chat-body');
                var messages = JSON.parse(xhr.responseText); // JSON 배열 파싱
                chatBody.innerHTML = '';  // 기존 메시지 초기화
                // 각 메시지를 화면에 추가
                messages.forEach(function(msg) {
                    var newMessage = document.createElement('div');
                    newMessage.className = msg.startsWith('팅커벨:') ? 'admin-message' : 'user-message';
                    newMessage.textContent = msg;
                    chatBody.appendChild(newMessage);
                });
                pollMessages(); // 재귀 호출로 새로운 메시지 확인
            }
        };
        xhr.send();
    }

    // 페이지 로드 후 처음 메시지 요청 시작
    pollMessages();

</script>

<sitemesh:write property="body"/>
</body>
</html>