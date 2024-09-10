<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 채팅 및 응답</title>
    <style type="text/css">
        section {
            width: 1000px;
            margin: auto;
            font-family: 'hahmlet', sans-serif;
        }
        section table {
            width: 800px;
            margin: 0 auto;
            border-spacing: 0;
            margin-bottom: 200px;
        }
        section table td {
            border-bottom: 1px solid #2DD1C5;
            padding: 5px;
            height: 40px;
        }
        section table tr:first-child td {
            border-top: 2px solid #2DD1C5;
            border-bottom: 2px solid #2DD1C5;
        }
        section table tr:last-child td {
            border-bottom: 2px solid #2DD1C5;
        }
        section table a {
            text-decoration: none;
            color: black;
        }
        section #write {
            display: inline-block;
            width: 100px;
            background: #23297A;
            color: white;
            text-align: center;
            text-decoration: none;
            padding: 5px 0;
            box-sizing: border-box;
            border-radius: 5px;
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
</head>
<body>

<section>
    <!-- 관리자 게시판 섹션 -->
    <table>
        <caption><h3>관리자 Q & A</h3></caption>
        <tr align="center">
            <td> 문의사항 </td>
            <td> 작성자 </td>
            <td> 조회수 </td>
            <td> 작성일 </td>
        </tr>
        <c:forEach items="${ilist}" var="idto">
        <tr align="center">
            <td align="center">
                <a href="readnum?id=${idto.id}">
                    <c:if test="${idto.title==0}">
                    <span id="s1">예약접수 관련 문의</span>
                    </c:if>
                    <c:if test="${idto.title==1}">
                    <span id="s2">탑승수속 관련 문의</span>
                    </c:if>
                    <c:if test="${idto.title==2}">
                    <span id="s1">예약취소 관련 문의</span>
                    </c:if>
                    <c:if test="${idto.title==3}">
                    <span id="s2">웹사이트 관련 문의</span>
                    </c:if>
                    <c:if test="${idto.title==4}">
                    <span id="s1">기타 문의</span>
                    </c:if>
                </a>
            </td>
            <td> writer </td>
            <td> ${idto.readnum} </td>
            <td> ${idto.writeday} </td>
        </tr>
        </c:forEach>
    </table>
</section>

<!-- 관리자 채팅 상담 UI -->
<div id="chat-console">
    <div id="chat-header">
        채팅 상담
        <button onclick="endChat()">끝내기</button>
    </div>
    <div id="chat-body"></div>
    <div id="chat-input">
        <input type="text" id="chat-message" placeholder="답변을 입력하세요">
        <button onclick="sendMessage()">보내기</button>
    </div>
</div>

<script>
// 채팅 종료 및 기록 리셋
function endChat() {
    // 서버에 채팅 기록 초기화 요청
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/inquiry/endChat", true); // Controller 경로로 요청
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 채팅 기록 초기화
            var chatBody = document.getElementById('chat-body');
            chatBody.innerHTML = '';  // 채팅 기록 비우기
        }
    };
    xhr.send();
}

// 메시지 전송 함수 (관리자 페이지)
function sendMessage() {
    var messageInput = document.getElementById('chat-message').value;
    var chatBody = document.getElementById('chat-body');

    if (messageInput.trim() === "") {
        return; // 빈 메시지는 전송하지 않음
    }

    // AJAX 요청을 통해 서버에 메시지 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../inquiry/sendMessage", true);  // Controller 경로로 요청
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var newMessage = document.createElement('div');
            newMessage.className = "admin-message"; // 관리자로 구분
            newMessage.textContent = "관리자: " + messageInput; 
            chatBody.appendChild(newMessage);
            document.getElementById('chat-message').value = "";  // 입력창 비우기
        }
    };
    xhr.send("message=" + encodeURIComponent(messageInput) + "&isAdmin=true"); // 관리자 메시지로 전송
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
    xhr.open("GET", "../inquiry/getMessages", true);  // 서버로부터 메시지 요청
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var chatBody = document.getElementById('chat-body');
            var messages = JSON.parse(xhr.responseText); // JSON 배열 파싱

            chatBody.innerHTML = '';  // 기존 메시지 초기화

            // 각 메시지를 화면에 추가
            messages.forEach(function(msg) {
                var newMessage = document.createElement('div');
                newMessage.className = msg.startsWith('관리자:') ? 'admin-message' : 'user-message';
                newMessage.textContent = msg;
                chatBody.appendChild(newMessage);
            });

            // 메시지 폴링 반복 호출
            pollMessages();
        }
    };
    xhr.send();
}

// 페이지 로드 후 처음 메시지 요청 시작
pollMessages();

</script>

</body>
</html>
