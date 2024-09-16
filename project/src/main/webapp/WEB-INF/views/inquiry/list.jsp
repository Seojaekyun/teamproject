<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q & A</title>
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
        .badge-category1 {
            background-color: #2DD1C5; /* 예약접수 관련 문의 */
        }
        .badge-category2 {
            background-color: #65FF5E; /* 탑승수속 관련 문의 */
        }
        .badge-category3 {
            background-color: #DF251F; /* 예약취소 관련 문의 */
        }
        .badge-category4 {
            background-color: #23297A; /* 웹사이트 관련 문의 */
        }
        .badge-category5 {
            background-color: #FFA500; /* 기타 문의 */
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
        .qna-table th, .qna-table td {
            text-align: center;
        }
        .qna-table a {
            color: #00467F;
            text-decoration: none;
        }
        .qna-table a:hover {
            text-decoration: underline;
        }
        /* 버튼 스타일 */
        #write {
            display: inline-block;
            width: 100px;
            background: #23297A;
            color: white;
            text-align: center;
            text-decoration: none;
            padding: 10px 0;
            box-sizing: border-box;
            border-radius: 5px;
            cursor: pointer;
        }
        #write:hover {
            background: #1A1F6B;
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
                <h2>Q & A</h2>
                <table class="qna-table">
                    <tr>
                        <th>문의사항</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                    <c:forEach items="${ilist}" var="idto">
                        <tr>
                            <td>
                            	<c:choose>
                            		<c:when test="${idto.state == 0}">
                                    	<span class="badge badge-category1">예약접수 관련 문의</span>
                                    </c:when>
                                    <c:when test="${idto.state == 1}">
                                        <span class="badge badge-category2">탑승수속 관련 문의</span>
                                    </c:when>
                                    <c:when test="${idto.state == 2}">
                                        <span class="badge badge-category3">예약취소 관련 문의</span>
                                    </c:when>
                                    <c:when test="${idto.state == 3}">
                                        <span class="badge badge-category4">웹사이트 관련 문의</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-category5">기타 문의</span>
                                    </c:otherwise>
                                </c:choose>
                                <a href="readnum?id=${idto.id}">
                                	${idto.title} <!-- titleName은 각 문의사항의 구체적인 제목을 의미 -->
                                </a>
                            </td>
                            <td>${idto.userid}</td>
                            <td>${idto.readnum}</td>
                            <td>${idto.writeday}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4" style="text-align: right;">
                            <a href="write" id="write">문의하기</a>
                        </td>
                    </tr>
                </table>
                <!-- 필요한 경우 페이징 네비게이션 추가 -->
            </div>
        </div>

        <div>
            <p>© 2024 eLTA항공. 모든 권리 보유.</p>
        </div>
        
    </section>

</body>
</html>