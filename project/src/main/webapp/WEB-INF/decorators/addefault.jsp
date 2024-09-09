<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	body {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		box-sizing: border-box;
	}

	header {
		width: 100%;
		background-color: gray;
		color: white;
	}
	header #first {
		display: flex;
		height: 30px;
		align-items: right;
		justify-content: flex-end;
		background-color: gray;
		padding: 10px 20px;
		box-sizing: border-box;
		color: white;
	}
	header #second {
		display: flex;
		height: 50px;
		align-items: center;
		justify-content: space-between;
		background-color: gray;
		padding: 10px 20px;
		box-sizing: border-box;
		color: white;
	}
	header #one {
		flex-shrink: 0;
		font-size: 17px;
	}
	header #one a {
		text-decoration: none;
		color: white;
	}
	header #one a:hover {
		font-weight: bold;
	}
	header #logo {
		width: 200px;
		flex-shrink: 0;
		valign: top;
	}
	header #two {
		display: flex;
		flex-grow: 1;
		justify-content: flex-start;
	}

	header #two button {
		background: none;
		border: none;
		margin: 0 10px;
		font-size: 17px;
		cursor: pointer;
	}
	header #two button a {
		text-decoration: none;
		color: white;
	}
	header #two button:hover a {
		font-weight: bold;
	}
	
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

</script>
<sitemesh:write property="head"/>
</head>
<body>

<header>
	<div id="first">
		<div id="one">
			<a href="../main/index">홈페이지</a>&nbsp;&nbsp;|&nbsp;&nbsp;    
			${name}&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="../login/logout">로그아웃</a>
		</div>
	</div>
	<div id="second">
		<div id="logo">
			<a href="../admin/index">
				<img src="../static/resources/eltlogo.png" height="60px" alt="로고">
			</a>
		</div>
		<div id="two">    
			<button><a href="adReserve">예약관리</a></button>
			<button><a href="">문의관리</a></button>
			<button><a href="">회원관리</a></button>
			<button><a href="">비행일정</a></button>
			<button><a href="">호텔예약</a></button>
			<button><a href="">예약통계</a></button>
			<button><a href="">게시판관리</a></button>
		</div>
	</div>
</header>
<section>
	
</section>
<sitemesh:write property="body"/>
</body>
</html>
