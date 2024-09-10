<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
</style>
</head>
<body>

	<h3>공지사항</h3>
	<table>
		<tr>
			<th>제목</th>
			<td>${gdto.title}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${gdto.readnum}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="content">${gdto.content}</td>
		</tr>
	</table>
	<div id="btn">
		<a href="gongjiList">목록</a>
		<a href="update?id=${gdto.id}">수정</a>
		<a href="delete?id=${gdto.id}">삭제</a>
	</div>

</body>
</html>