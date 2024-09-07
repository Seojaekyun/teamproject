<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	body {
		margin: auto;
		font-family: 'Hahmlet';
	}
	header {
		width: 100%;
		margin: auto;
	}
	#first {
		width: 100%;
		height: 50px;
		margin: auto;
		display: flex;
		background: lightgray;
		align-items: center;
		justify-content: space-between;
	}
	#first #one {
		width: 800px;
		display: flex;
		align-items: center;
		font-size: 20px;
		font-weight: 400;
		margin-right: 60px;
		background: skyblue;
		justify-content: flex-end;
	}
	#first #two {
		width: 400px;
		display: flex;
		text-align: right;
		font-size: 20px;
		font-weight: 400;
		margin-right: 60px;
		background: lightgreen;
		justify-content: flex-end;
	}
	#first > div a {
		text-decoration: none;
		cursor: pointer;	
	}
	#first > div a:hover {
		text-decoration: none;
		font-weight: 900;
		cursor: pointer;
		
	}
	
</style>

<script>

</script>

</head>
<body>
	<header>
	<div id="first">
		<div id="one">	
			<a href="">&nbsp;&nbsp;예약 관리&nbsp;&nbsp;</a>
			<a href="">&nbsp;&nbsp;문의 관리&nbsp;&nbsp;</a>
			<a href="">&nbsp;&nbsp;회원 관리&nbsp;&nbsp;</a>
			<a href="">&nbsp;&nbsp;??? 관리&nbsp;&nbsp;</a>
			<a href="">&nbsp;&nbsp;??? 관리&nbsp;&nbsp;</a>
			<a href="">&nbsp;&nbsp;??? 관리&nbsp;&nbsp;</a>
			<a href="">&nbsp;&nbsp;??? 관리&nbsp;&nbsp;</a>
		</div>
		<div id="two">
			<a href="../main/index">★</a>	
			###님&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="../login/logout">로그아웃</a>
		</div>
	</div>
	</header>
	

</body>
</html>