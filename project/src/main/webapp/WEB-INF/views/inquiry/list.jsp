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
							<c:if test="${idto.answer == 0}">
								<span id="badge1">답변대기</span>
							</c:if>
							<c:if test="${idto.answer == 1}">
								<span id="badge2">답변완료</span>
							</c:if>
							<a href="readnum?id=${idto.id}">
								${idto.title}
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
		</div>
	</div>

	<div>
		<p>© 2024 eLTA항공. 모든 권리 보유.</p>
	</div>
	
</section>

</body>
</html>