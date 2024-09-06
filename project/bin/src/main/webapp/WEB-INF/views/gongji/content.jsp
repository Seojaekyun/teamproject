<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1000px;
		height:600px;
		margin:auto;
		text-align:center;
	}
	section div {
		width:700px;
		height:50px;
		line-height:50px;
		border:1px solid green;
		margin:auto;
		margin-top:8px;
	}
	section #content {
		height:300px;
		overflow:auto;
		line-height:30px;
	}
	section #rnum {
		font-size:11px;
		color:green;
	}
	section #btn a {
		display:inline-block;
		text-decoration:none;
		width:100px;
		height:28px;
		line-height:30px;
		border:1px solid green;
		color:green;
	}
</style>
</head>
<body> <!-- gongji/content.jsp -->
<section>
	<h3> 공지사항 </h3>
	<div> 제목 </div>
	<div> 조회수 <span id="rnum">(조회수)</span></div>
	<div id="content"> 내용 </div>
	<div id="btn">
		<a href=""> 목록 </a>
		<a href=""> 수정 </a>
		<a href=""> 삭제 </a>
	</div>
</section>
</body>
</html>