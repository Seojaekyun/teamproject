<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		section {
			width:1000px;
			margin:auto;
			text-align:center;
		}
		section input[type=text] {
			width:700px;
			height:50px;
			border:1px solid green;
			outline:none;
			font-family: 'GmarketSansMedium';
			border-radius: 8px;
			font-size:16px;
		}
		section textarea {
			width:700px;
			height:300px;
			border:1px solid green;
			outline:none;
			font-family: 'GmarketSansMedium';
			font-size:16px;
			border-radius: 8px;
		}
		section input[type=submit] {
			width:120px;
			height:40px;
			border:1px solid green;
			outline:none;
			background:green;
			color:white;
			font-family: 'GmarketSansMedium';
			font-size:17px;
			border-radius: 8px;
		}
		section div {
			margin-top:8px;
		}
	</style>
</head>
<body>
	<section>
		<form method="post" action="../gongji/writeOk">
		<input type="hidden" name="writer" value="tester"><!-- 로그인 작업 후 관리자 아이디로 수정 -->
			<h3>공지사항작성</h3>
			<div><input type="text" name="title" placeholder="제 목"></div>
			<div><textarea name="content" placeholder="공지 내용"></textarea></div>
			<div>
				<input type="radio" name="state" value="0"> 일반
				<input type="radio" name="state" value="1"> 상시
				<input type="radio" name="state" value="2"> 필수
			</div>
			<div><input type="submit" value="공지사항 등록"></div>
		</form>
	</section>
</body>
</html>