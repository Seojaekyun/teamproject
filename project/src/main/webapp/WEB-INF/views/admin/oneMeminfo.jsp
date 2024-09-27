<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
			background-color: #f0f4f8;
			margin: 0;
			padding: 0;
		}
		section {
			width: 90%;
			max-width: 1200px;
			margin: 40px auto;
			background-color: #fff;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin-bottom: 20px;
			text-align: center;
		}
		th, td {
			border: 1px solid #ddd;
			padding: 12px;
		}
		th {
			background-color: #007BFF;
			color: white;
			text-transform: uppercase;
		}
		td {
			background-color: #fafafa;
			color: #333;
		}
		h4 {
			font-size: 20px;
			color: #333;
			margin-bottom: 15px;
			text-align: left;
		}
		button, input[type="button"] {
			background-color: #007BFF;
			color: white;
			border: none;
			padding: 10px 20px;
			border-radius: 5px;
			cursor: pointer;
			font-size: 1em;
			margin-top: 20px;
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
		/* 반응형 디자인 */
		@media (max-width: 768px) {
			section {
				width: 95%;
				padding: 10px;
			}
			th, td {
				font-size: 14px;
				padding: 10px;
			}
			h4 {
				font-size: 18px;
			}
			button, input[type="button"] {
				padding: 8px 15px;
				font-size: 14px;
			}
		}
	</style>
</head>
<body>
	<section>
		<!-- 이전으로 버튼 -->
		<div style="text-align: left; margin-bottom: 20px;">
			<a href="memberList"><input type="button" value="이전으로"></a>
		</div>

		<!-- 회원 정보 테이블 -->
		<table>
			<caption><h4>회원 정보</h4></caption> <!-- 테이블 제목 -->
			<tr>
				<th>고객명</th>
				<th>ID</th>
				<th>회원등급</th>
				<th>요청사항</th>
			</tr>
			<tr>
				<td>${member.name}</td>
				<td>${member.userid}</td>
				<td>
					<c:choose>
						<c:when test="${member.level == 0}">일반회원</c:when>
						<c:when test="${member.level == 1}">우수회원</c:when>
						<c:when test="${member.level == 2}">VIP</c:when>
						<c:when test="${member.level == 3}">탈퇴신청</c:when>
						<c:when test="${member.level == 4}">탈퇴회원</c:when>
						<c:when test="${member.level == 5}">복구신청</c:when>
					</c:choose>
				</td>
				<td>-</td>
			</tr>
		</table>

		<!-- 예약 내역 테이블 -->
		<table>
			<caption><h4>예약 내역</h4></caption> <!-- 테이블 제목 -->
			<tr>
				<th>최근예약현황</th>
				<th>요청사항</th>
			</tr>
			<c:forEach items="${member.reservations}" var="rsv">
				<tr>
					<td>${rsv.reservationDate}</td>
					<td>-</td>
				</tr>
			</c:forEach>
		</table>

		<!-- 페이지네이션 -->
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="?page=${currentPage - 1}">이전</a>
			</c:if>
			<c:forEach begin="1" end="${totalPages}" var="i">
				<c:choose>
					<c:when test="${i == currentPage}">
						<span>${i}</span>
					</c:when>
					<c:otherwise>
						<a href="?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${currentPage < totalPages}">
				<a href="?page=${currentPage + 1}">다음</a>
			</c:if>
		</div>
	</section>
</body>
</html>
