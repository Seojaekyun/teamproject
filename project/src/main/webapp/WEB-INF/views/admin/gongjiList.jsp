<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    section {
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 1200px;
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
        text-align: center;
    }
    th {
        background-color: #f8f8f8;
    }
    caption {
        font-size: 1.5em;
        margin-bottom: 10px;
    }
    button, input[type="button"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
    }
    button:hover, input[type="button"]:hover {
        background-color: #0056b3;
    }
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a, .pagination span {
        margin: 0 5px;
        padding: 10px 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        text-decoration: none;
        color: #007BFF;
    }
    .pagination a:hover {
        background-color: #f4f4f4;
    }
    .pagination span {
        background-color: #007BFF;
        color: white;
    }
</style>

<meta charset="UTF-8">
<title>공지사항 관리</title>
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	section {
		width: 1000px;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		margin: 20px 0;
	}
	th, td {
		border: 1px solid #ddd;
		padding: 10px;
		text-align: center;
	}
	th {
		background-color: #000A8E;
		color: white;
		text-transform: uppercase;
	}
	td {
		background-color: #f9f9f9;
		font-size:12px;
	}
	a {
		text-decoration: none;
		color: black;
	}
	#write {
		display: inline-block;
		width: 100px;
		background: #23297A;
		color: white;
		text-align: center;
		padding: 5px 0;
		box-sizing: border-box;
		border-radius: 5px;
		text-decoration: none;
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
	#badge1 {
		background: #DF251F;
		padding: 3px;
		font-size: 11px;
		font-weight: 900;
		margin-right: 5px;
		border-radius: 3px;
		color: white;
	}
	#badge2 {
		background: #65FF5E;
		padding: 3px;
		font-size: 11px;
		margin-right: 5px;
		border-radius: 3px;
		color: white;
	}
</style>
</head>
<body>
	<div width="100%" style="text-align: center">
		<h2>공지사항 관리</h2>
	</div>
	<section>
		<div align="right"><a href="gongjiWrite" id="write">작성하기</a></div>
		<table>
			<tr align="center">
				<th>제 목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${glist}" var="gdto">
				<tr align="center">
					<td align="center">
						<c:if test="${gdto.state == 2}">
							<span id="badge1">필독</span> <!-- '필독' 배지 -->
						</c:if>
						<c:if test="${gdto.state == 1}">
							<span id="badge2">공지</span> <!-- '공지' 배지 -->
						</c:if>
						<a href="gongjiContent?id=${gdto.id}">${gdto.title}</a> <!-- 제목 링크 -->
					</td>
					<td>${gdto.writer}</td>
					<td>${gdto.readnum}</td>
					<td>${gdto.writeday}</td>
				</tr>
			</c:forEach>
		</table>
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
	</section>
</body>
</html>