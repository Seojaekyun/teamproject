<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        }

        #chat-body {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
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
            right: 20px;
            background-color: #2DD1C5;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
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
    <div id="chat-header">채팅 상담</div>
    <div id="chat-body"></div>
    <div id="chat-input">
        <input type="text" id="chat-message" placeholder="답변을 입력하세요">
        <button onclick="sendMessage()">보내기</button>
    </div>
</div>

<!-- 채팅 상담 버튼 -->
<div id="chat-toggle" onclick="toggleChat()">채팅 상담 열기</div>

<script>
//채팅 창 토글
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

// 메시지 전송 함수 (관리자 페이지)
function sendMessage() {
    var messageInput = document.getElementById('chat-message').value;
    var chatBody = document.getElementById('chat-body');

    if (messageInput.trim() === "") {
        return; // 빈 메시지는 전송하지 않음
    }

    // AJAX 요청을 통해 서버에 메시지 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "sendMessage", true);  // Controller 경로로 요청
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var newMessage = document.createElement('div');
            newMessage.textContent = "관리자: " + messageInput; // 관리자로 구분
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
    xhr.open("GET", "getMessages", true);  // Controller 경로로 요청
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var chatBody = document.getElementById('chat-body');
            chatBody.innerHTML = xhr.responseText;  // 서버에서 받은 메시지를 출력

            // 새로운 메시지를 받으면 바로 다시 메시지 요청 (Long Polling)
            pollMessages();
        }
    };
    xhr.onerror = function() {
        // 에러가 발생하면 일정 시간 후 다시 요청 (네트워크 오류 대비)
        setTimeout(pollMessages, 3000);  // 3초 후 다시 시도
    };
    xhr.send();
}

// 페이지 로드 후 처음 메시지 요청 시작
pollMessages();

</script>

</body>
</html>