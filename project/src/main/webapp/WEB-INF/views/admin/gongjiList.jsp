<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
			<tr align="right">
				<td colspan="4"> <!-- 글쓰기 버튼 -->
					<a href="gongjiWrite" id="write">작성하기</a>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>