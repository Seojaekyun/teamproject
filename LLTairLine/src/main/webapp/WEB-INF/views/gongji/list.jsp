<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 1000px;
		height: 600px;
		margin: auto;
		font-family: 'hahmlet';
	}
	section table {
		width: 800px; /* 테이블 너비 설정 */
		margin: 0 auto; /* 테이블을 섹션의 가운데에 정렬 */
		border-spacing: 0px;
		margin-bottom: 200px;
	}
	section table td {
		border-bottom: 1px solid #E0F7FA;
		padding: 5px;
		height: 40px;
	}
	section table tr:first-child td {
		border-top: 2px solid green;
		border-bottom: 2px solid green;
	}
	section table tr:last-child td {
		border-bottom: 2px solid green;
	}
	section table a {
		text-decoration: none;
		color: black;
	}
	section #write {
		display: inline-block;
		width: 100px;
		/* height: 20px; */ /* 높이 제거 */
		background: #2100FF;
		color: white;
		text-align: center;
		text-decoration: none;
		padding: 3px 0; /* 위아래 패딩 추가로 버튼 높이 조정 */
		box-sizing: border-box; /* padding 포함 높이 계산 */
		border-radius: 5px;
	}
	section #s2, section #s1 {
		background: #65FF5E;
		padding: 3px;
		font-size: 11px;
	}
</style>
</head>
<body> <!-- gongji/list.jsp -->
<section>
	<table>
		<caption> <h2> 공 지 사 항 </h2> </caption>
		<tr align="center">
			<td> 제 목 </td>
			<td> 작성자 </td>
			<td> 조회수 </td>
			<td> 작성일 </td>
		</tr>
		<tr align="center">
			<td align="left">
				<span id="s2">필독</span>
				<span id="s1">공지</span>
				<a href=""> 제목 </a>
			</td>
			<td> 관리자 </td>
			<td> 조회수 </td>
			<td> 작성일 </td>
		</tr>
		<c:if test="${userid=='admin'}"> <!-- 관리자 일 경우에만 -->
		<tr align="right">
			<td colspan="4"> <a href="write" id="write"> 글쓰기 </a> </td>
		</tr>
		</c:if>
	</table>
</section>
</body>
</html>