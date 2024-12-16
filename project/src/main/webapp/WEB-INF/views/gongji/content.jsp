<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세</title>
    <style>
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
            font-size: 24px;
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
            font-size: 16px;
            transition: color 0.3s ease;
        }
        section nav a:hover {
            text-decoration: underline;
            color: #FFD700; /* 호버 시 색상 변경 */
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            background-color: white;
            padding: 30px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        .content h2 {
            font-size: 26px;
            color: #00467F;
            margin-bottom: 20px;
            text-align: center;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
        }
        .notice-title {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .notice-meta {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
            text-align: center;
        }
        .notice-content {
            font-size: 16px;
            color: #555;
            line-height: 1.8;
            white-space: pre-wrap; /* 줄바꿈 유지 */
            padding: 20px;
            background-color: #fafafa;
            border-left: 4px solid #00467F;
            border-radius: 4px;
            text-indent: 0; /* 들여쓰기 제거 */
            margin: 0; /* 상하 마진 제거 */
        }
        .cta-button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #00467F;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 30px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .cta-button:hover {
            background-color: #003A66;
            transform: translateY(-2px);
        }
        /* 배지 스타일링 */
        .badge {
            display: inline-block;
            padding: 5px 8px;
            font-size: 12px;
            font-weight: bold;
            border-radius: 3px;
            margin-right: 8px;
            color: white;
            vertical-align: middle;
        }
        .badge-important {
            background-color: #DF251F; /* 필독 배지 색상 */
        }
        .badge-notice {
            background-color: #65FF5E; /* 공지 배지 색상 */
        }
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            .content h2 {
                font-size: 22px;
            }
            .notice-title {
                font-size: 20px;
            }
            .cta-button {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body> <!-- gongji/content.jsp -->
    <section>
        <header>
            <h1>고객센터</h1>
        </header>

        <nav>
            <a href="../gongji/list">공지사항</a>
            <a href="../inquiry/list">Q＆A</a>
            <a href="">FAQ</a>
        </nav>
        
        <div class="container">
            <div class="content">
                <h2>공지사항 상세</h2>
                <div class="notice-title">
                    <c:if test="${gdto.state == 2}">
                        <span class="badge badge-important">필독</span>
                    </c:if>
                    <c:if test="${gdto.state == 1}">
                        <span class="badge badge-notice">공지</span>
                    </c:if>
                    <c:out value="${gdto.title}" />
                </div>
                <div class="notice-meta">
                    작성자: <c:out value="${gdto.writer}" /> | 조회수: <c:out value="${gdto.readnum}" /> | 작성일: <c:out value="${gdto.writeday}" />
                </div>
                <div class="notice-content">
                    <c:out value="${gdto.content}" escapeXml="false" />
                </div>
                <div style="text-align: center;">
                    <a class="cta-button" href="list">목록으로</a>
                </div>
            </div>
        </div>
    </section>
</body>
</html>