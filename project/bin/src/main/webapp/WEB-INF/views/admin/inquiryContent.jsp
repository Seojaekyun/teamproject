<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240910001147">
<style>
	body {
		font-family: 'Arial', sans-serif;
		background-color: #f9f9f9;
		text-align: center;
	}
	h3 {
		font-size: 24px;
		color: #333;
		border-bottom: 2px solid #4CAF50;
		padding-bottom: 10px;
		margin-bottom: 20px;
		text-align: left;
		width: 600px;
		margin: 50px auto;
	}
	table {
		width: 600px;
		margin: 0 auto;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	table th, table td {
		border: 1px solid #ddd;
		padding: 10px;
		text-align: left;
		vertical-align: top;
	}
	table th {
		width: 150px;
		background-color: #f4f4f4;
		font-weight: bold;
		text-align: center;
	}
	table td {
		width: 450px;
		word-wrap: break-word;
		white-space: pre-wrap;
		overflow: hidden;
	}
	#content {
		min-height: 200px;
		padding: 20px;
		background-color: #fff;
		border: 1px solid #e1e1e1;
		margin-bottom: 20px;
		line-height: 1.6;
		color: #333;
		word-wrap: break-word;
	}
	#btn {
		text-align: right;
		width: 600px;
		margin: 0 auto;
	}
	#btn a {
		display: inline-block;
		text-decoration: none;
		padding: 8px 16px;
		border: 1px solid #4CAF50;
		color: #4CAF50;
		margin-left: 10px;
		border-radius: 4px;
		transition: all 0.3s ease;
	}
	#btn a:hover {
		background-color: #4CAF50;
		color: white;
	}
	/* 답변 입력 폼 스타일 */
	#answerForm {
		width: 600px;
		margin: 20px auto;
		display: block; /* 폼이 항상 표시되게 */
	}
	#answerForm textarea {
		width: 100%;
		height: 150px;
		padding: 10px;
		font-size: 14px;
		border: 1px solid #ddd;
		border-radius: 4px;
		margin-bottom: 10px;
	}
	#answerForm input[type="submit"] {
		display: inline-block;
		padding: 8px 16px;
		background-color: #4CAF50;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	#answerForm input[type="submit"]:hover {
		background-color: #45a049;
	}
	#editAnswerBtn {
		display: inline-block;
		padding: 8px 16px;
		background-color: #f39c12;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		transition: background-color 0.3s ease;
		margin-top: 10px;
	}
	#editAnswerBtn:hover {
		background-color: #e67e22;
	}
</style>
</head>
<body>

	<h3>공지사항</h3>
	<table>
		<tr>
			<th>제목</th>
			<td>${idto.title}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${idto.readnum}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="content">${idto.content}</td>
		</tr>
	</table>

	<!-- 버튼 영역 -->
	<div id="btn">
		<a href="inquiryList">목록</a>
		<a href="delete?id=${idto.id}">삭제</a>
	</div>

	<!-- 답변 입력/보기 폼 -->
	<c:choose>
		<c:when test="${idto.answer == 0}">
			<!-- 답변 입력 폼 -->
			<form id="answerForm" action="answer" method="post">
				<input type="hidden" name="id" value="${idto.id}"> <!-- 문의사항 ID 전달 -->
				<textarea name="answer" placeholder="여기에 답변을 입력하세요..."></textarea>
				<input type="submit" value="답변 제출">
			</form>
		</c:when>
		<c:when test="${idto.answer == 1}">
			<!-- 답변 내용 표시 및 수정 -->
			<h3>답변 내용</h3>
			<div id="answerForm">
				<form action="updateAnswer" method="post">
					<input type="hidden" name="id" value="${idto.id}">
					<textarea name="answer">${idto.answertext}</textarea>
					<input type="submit" value="답변 수정">
				</form>
			</div>
		</c:when>
	</c:choose>

</body>
</html>