<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q＆A</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
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
        color: #FFD700;
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
    .qna-title, .qna-meta {
        font-size: 16px;
        color: #555;
        margin-bottom: 20px;
        text-align: center;
    }
    .qna-title {
        font-size: 22px;
        font-weight: bold;
        color: #333;
    }
    .qna-content {
        font-size: 16px;
        color: #555;
        line-height: 1.8;
        white-space: pre-wrap;
        padding: 20px;
        background-color: #fafafa;
        border-left: 4px solid #00467F;
        border-radius: 4px;
        text-indent: 0;
        margin: 0;
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
    .answer-form {
        margin-top: 20px;
        text-align: center;
    }
    .answer-form textarea {
        width: 100%;
        height: 150px;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-bottom: 10px;
    }
    .answer-form input[type="submit"] {
        padding: 8px 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .answer-form input[type="submit"]:hover {
        background-color: #45a049;
    }
    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .container {
            padding: 20px;
        }
        .content h2 {
            font-size: 22px;
        }
        .qna-title {
            font-size: 20px;
        }
        .cta-button {
            width: 100%;
            text-align: center;
        }
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
        <a href="../inquiry/list">Q＆A</a>
        <a href="../promot/list">이벤트</a>
		<a href="../review/list">여행후기</a>
    </nav>

    <div class="container">
        <div class="content">
            <h2>여행후기</h2>

            <div class="qna-title">제목: ${redto.title}</div>
            <div class="qna-meta">
                조회수: ${redto.readnum}
            </div>
            <div class="qna-content">
            	<img src="../static/resources/${redto.fname}" alt="리뷰 이미지">
                ${redto.content}
            </div>

            <!-- 버튼 영역 -->
            <div style="text-align: center;">
                <a class="cta-button" href="list">목록</a>
            </div>
        </div>
    </div>
</section>
</body>
</html>