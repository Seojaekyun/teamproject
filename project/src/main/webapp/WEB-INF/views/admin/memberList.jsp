<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f0f4f8;
		margin: 0;
		padding: 0;
	}
	section {
		width: 1400px;
		padding-bottom: 40px;
		margin: auto;
	}
	section div {
		padding-left: 20px;
		margin-right: 20px;
	}
	section table {
		width: 70%;
		border-collapse: collapse;
		margin-bottom: 20px;
		text-align: center;
		margin: auto;
		
	}
	section table, th, td {
		border: 1px solid #ddd;
	}
	th, td {
		padding: 8px;
		text-align: center;
	}
	th {
		background-color: #007BFF;
		color: white;
	}
	caption {
		font-size: 1.5em;
		margin-bottom: 10px;
	}
	td {
		background-color: #fafafa;
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
</head>
<body>
<section>
	<table>
		<caption><h3> 회원 관리 </h3></caption> <!-- 테이블 제목 -->
		<tr align="center">
			<th> 고객명 </th>
			<th> ID </th>
			<th> 회원등급 </thd>
			<th> 최근예약현황 </th>
			<th> 요청사항 </th>
		</tr>
			<c:forEach items="${mlist}" var="mdto">
				<tr align="center">
				<td align="center"> ${mdto.name} </td>
				<td align="center"><a href="oneMeminfo?userid=${mdto.userid}"> ${mdto.userid} </a></td>
				<td align="center">
					<c:if test="${mdto.level == 0}">
						일반회원
					</c:if>
					<c:if test="${mdto.level == 1}">
						우수회원
					</c:if>
					<c:if test="${mdto.level == 2}">
						VIP
					</c:if>
					<c:if test="${mdto.level == 3}">
						탈퇴신청
					</c:if>
					<c:if test="${mdto.level == 4}">
						탈퇴회원
					</c:if>
					<c:if test="${mdto.level == 5}">
						복구신청
					</c:if>
				</td>
				<td align="center">
					<c:forEach items="${mdto.reservations}" var="rsv">
						${rsv.reservationDate}
					</c:forEach>
				</td>
				<td align="center">
					<c:if test="${mdto.level == 3}">
						탈퇴신청
					</c:if>
					<c:if test="${mdto.level == 5}">
						복구신청
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이지네이션 -->
	<div class="pagination" align="center">
		<c:if test="${currentPage > 1}">
			<a href="?page=${currentPage - 1}">이전</a>
		</c:if>
		<c:forEach begin="1" end="${totalPages}" var="i">
			<c:if test="${i == currentPage}">
				<span>${i}</span>
			</c:if>
			<c:if test="${i != currentPage}">
				<a href="?page=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${currentPage < totalPages}">
			<a href="?page=${currentPage + 1}">다음</a>
		</c:if>
	</div>
</section>
	
</body>
</html>