<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q & A 리스트</title>
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
		text-decoration: none;
		padding: 5px 0;
		box-sizing: border-box;
		border-radius: 5px;
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
	<div style="text-align: center;">
		<h2>Q & A 관리</h2>
	</div>
	<section>
		<table>
			<tr>
				<th>문의사항</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${ilist}" var="idto">
				<tr>
					<td>
						<c:if test="${idto.answer == 0}">
							<span id="badge1">답변대기</span> <!-- '필독' 배지 -->
						</c:if>
						<c:if test="${idto.answer == 1}">
							<span id="badge2">답변완료</span> <!-- '공지' 배지 -->
						</c:if>
						<a href="inquiryContent?id=${idto.id}">
							<c:choose>
								<c:when test="${idto.state == 0}">예약접수 관련 문의</c:when>
								<c:when test="${idto.state == 1}">탑승수속 관련 문의</c:when>
								<c:when test="${idto.state == 2}">예약취소 관련 문의</c:when>
								<c:when test="${idto.state == 3}">웹사이트 관련 문의</c:when>
								<c:otherwise>기타 문의</c:otherwise>
							</c:choose>
						</a>
					</td>
					<td>${idto.userid}</td>
					<td>${idto.readnum}</td>
					<td>${idto.writeday}</td>
				</tr>
			</c:forEach>
		</table>

		<!-- 페이징 처리 -->
		<div class="pagination">
			<c:if test="${currentPage > 3}">
				<a href="?page=${currentPage - 3}">&laquo; 이전 3페이지</a>
			</c:if>
			
			<c:set var="startPage" value="${currentPage - 1}" />
			<c:set var="endPage" value="${currentPage + 1}" />
			<c:if test="${startPage < 1}">
				<c:set var="startPage" value="1" />
			</c:if>
			<c:if test="${endPage > totalPages}">
				<c:set var="endPage" value="${totalPages}" />
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
			
			<c:if test="${currentPage + 3 <= totalPages}">
				<a href="?page=${currentPage + 3}">다음 3페이지 &raquo;</a>
			</c:if>
		</div>
	</section>
</body>
</html>