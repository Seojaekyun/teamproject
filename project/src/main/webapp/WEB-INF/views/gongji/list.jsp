<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
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
    .content {
    	height: 550px;
    }
    .content h2 {
        font-size: 22px;
        color: #00467F;
        margin-bottom: 10px;
    }
    table {
        width: 100%;
        height: 500px;
        border-collapse: collapse;
    }
    table, th, td {
        border-bottom: 1px solid #ddd;
        height: 30px;        
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
    td {
		font-size: 12px;
    }
	a {
		text-decoration: none;
	}
	a:hover {
		text-decoration: none;
		font-weight: bold;
	}
    .badge {
        display: inline-block;
        padding: 3px;
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
    
    .pagination {
		text-align: center;
		margin-top: 20px;
	}
	.pagination a {
		display: inline-block;
		padding: 5px 10px;
		margin: 0 3px;
		background-color: #4CAF50;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 12px;
	}
	.pagination a.active, .pagination span.active {
		background-color: #333;
		color: white;
		cursor: default;
		text-decoration: none;
	}
	.pagination span {
		display: inline-block;
		padding: 5px 10px;
		margin: 0 3px;
		background-color: #4CAF50;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 12px;
		cursor: default;
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
            <h2>공지사항</h2>
            <table class="notice-table">
                <tr>
                    <th colspan="2">제 목</th>
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
                    </td>
                    <td style="text-align: left">
                        <a href="gongjiReadnum?id=${gdto.id}">${gdto.title}</a>
                    </td>
                    <td>${gdto.writer}</td>
                    <td>${gdto.readnum}</td>
                    <td>${gdto.writeday}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <!-- 페이징 처리 -->
		<div class="pagination">
			<c:set var="prevPage" value="${currentPage - 10 < 1 ? 1 : currentPage - 10}" />
			<a href="?page=${prevPage}">&laquo; 이전10</a>
			<c:set var="startPage" value="${currentPage <= 5 ? 1 : currentPage - 4}" />
			<c:set var="endPage" value="${startPage + 9}" />
			<c:if test="${startPage < 1}">
				<c:set var="startPage" value="1" />
			</c:if>
			<c:if test="${endPage > totalPages}">
				<c:set var="endPage" value="${totalPages}" />
				<c:set var="startPage" value="${endPage - 9 > 0 ? endPage - 9 : 1}" />
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<c:choose>
					<c:when test="${i == currentPage}">
						<span class="active">${i}</span>
					</c:when>
					<c:otherwise>
						<a href="?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:set var="nextPage" value="${currentPage + 10 > totalPages ? totalPages : currentPage + 10}" />
			<a href="?page=${nextPage}">다음10 &raquo;</a>
		</div>
    </div>
</section>

</body>
</html>