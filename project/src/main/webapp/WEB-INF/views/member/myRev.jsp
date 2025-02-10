<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	.container {
		width: 60%;
		max-width: 1200px;
		margin: auto;
		margin-bottom: 20px;
		padding: 20px 0;
		background-color: white;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		padding: 20px;
		height: 650px;
	}
	h4 {
		font-size: 24px;
		color: #333;
		padding-bottom: 10px;
		margin-bottom: 10px;
		text-align: center;
	}
	.container table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
		margin: auto;
	}
	.container table th, .container table td {
		border: 1px solid #ddd;
		padding: 10px;
		text-align: left;
		vertical-align: middle;
	}
	.container table th {
		background-color: #000A8E;
		color: white;
		text-align: center;
		text-transform: uppercase;
	}
	.container table td {
		text-align: left;
		background-color: #f9f9f9;
	}
	.container table td:last-child {
		text-align: center;
		padding: 0;
	}
	#content {
		line-height: 1.6;
		width: 550px;
	}
	.tr {
		display: none;
	}
	/* 반응형 디자인 */
	@media (max-width: 768px) {
		h4 {
			font-size: 16px;
		}
		.container table th, .container table td {
			padding: 8px;
			font-size: 12px;
		}
	}
	.cta-button {
        display: inline-block;
        padding: 6px 12px;
        background-color: #00467F;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
</style>
</head>
<body>

<div class="container">
	<h4>나의 후기</h4>
	<c:forEach items="${myRev}" var="redto" varStatus="sts">
		<table>
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th> </th>
			</tr>
			<tr>
				<td>${redto.title}</td>
				<td id="content">${redto.content}</td>
				<td style="text-align: center">${redto.writeday}</td>
				<td><a class="cta-button" href="../review/delete?id=${redto.id}">삭제</a></td>
			</tr>
		</table>
	</c:forEach>
</div>

</body>
</html>