<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style>
    /* 공통 스타일 정의 */
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
    }
    section nav a:hover {
        text-decoration: underline;
    }
    .container {
        max-width: 1200px;
        margin: 20px auto;
        background-color: white;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .content h2 {
        font-size: 22px;
        color: #00467F;
        margin-bottom: 10px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .badge {
        display: inline-block;
        padding: 3px 6px;
        font-size: 11px;
        font-weight: bold;
        border-radius: 3px;
        margin-right: 5px;
        color: white;
    }
    .badge-important {
        background-color: #DF251F; /* 필독 배지 색상 */
    }
    .badge-notice {
        background-color: #65FF5E; /* 공지 배지 색상 */
    }
    .cta-button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #00467F;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 20px;
    }
    .cta-button:hover {
        background-color: #003A66;
    }
    
    /* 추가적인 테이블 스타일링 */
    .notice-table th, .notice-table td {
        text-align: center;
    }
    .notice-table a {
        color: #00467F;
        text-decoration: none;
    }
    .notice-table a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<section>
    <header>
        <h1>고객센터</h1>
    </header>

    <nav>
        <a href="../gongji/list">공지사항</a>
        <a href="../inquiry/list">Q & A</a>
        <a href="">FAQ</a>
    </nav>
    
    <div class="container">
        <div class="content">
            <h2>공지사항</h2>
            <table class="notice-table">
                <tr>
                    <th>제 목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                </tr>
                <c:forEach items="${glist}" var="gdto">
                <tr>
                    <td>
                        <c:if test="${gdto.state == 2}">
                            <span class="badge badge-important">필독</span>
                        </c:if>
                        <c:if test="${gdto.state == 1}">
                            <span class="badge badge-notice">공지</span>
                        </c:if>
                        <a href="readnum?id=${gdto.id}">${gdto.title}</a>
                    </td>
                    <td>${gdto.writer}</td>
                    <td>${gdto.readnum}</td>
                    <td>${gdto.writeday}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <div>
        <p>© 2024 eLTA항공. 모든 권리 보유.</p>
    </div>
    
</section>

</body>
</html>