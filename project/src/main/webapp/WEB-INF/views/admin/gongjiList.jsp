<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 1000px;
		margin: auto;
		font-family: 'hahmlet', sans-serif; /* 대체 폰트 추가 */
	}
	section table {
		width: 800px; /* 테이블 너비 */
		margin: auto; /* 테이블을 섹션 가운데 정렬 */
		border-spacing: 0; /* 테이블 셀 간격 제거 */
	}
	section table td {
		border-bottom: 1px solid #2DD1C5; /* 셀 하단 경계선 */
		padding: 5px; /* 셀 패딩 */
		height: 40px; /* 셀 높이 */
	}
	section table tr:first-child td {
		border-top: 2px solid #2DD1C5; /* 첫 번째 행 상단 경계선 */
		border-bottom: 2px solid #2DD1C5; /* 첫 번째 행 하단 경계선 */
	}
	section table tr:last-child td {
		border-bottom: 2px solid #2DD1C5; /* 마지막 행 하단 경계선 */
	}
	section table a {
		text-decoration: none; /* 링크 밑줄 제거 */
		color: black; /* 링크 색상 */
	}
	section #write {
		display: inline-block; /* 블록 수준 링크 */
		width: 100px; /* 버튼 너비 */
		background: #23297A; /* 버튼 배경색 */
		color: white; /* 버튼 글자색 */
		text-align: center; /* 버튼 내 글자 중앙 정렬 */
		text-decoration: none; /* 버튼 텍스트 밑줄 제거 */
		padding: 5px 0; /* 버튼 패딩 */
		box-sizing: border-box; /* 패딩을 너비 계산에 포함 */
		border-radius: 5px; /* 버튼의 둥근 모서리 */
	}
	section #badge1 {
		background: #DF251F; /* 배지 배경색 */
		padding: 3px; /* 배지 패딩 */
		font-size: 11px; /* 배지 글자 크기 */
		font-weight: 900;
		margin-right: 5px; /* 배지 사이 간격 */
		border-radius: 3px; /* 배지의 둥근 모서리 */
	}
	section #badge2 {
		background: #65FF5E; /* 배지 배경색 */
		padding: 3px; /* 배지 패딩 */
		font-size: 11px; /* 배지 글자 크기 */
		margin-right: 5px; /* 배지 사이 간격 */
		border-radius: 3px; /* 배지의 둥근 모서리 */
	}
</style>
</head>
<body>
<section>
	<table>
		<caption><h3> 공 지 사 항 </h3></caption> <!-- 테이블 제목 -->
		<tr align="center">
			<td> 제 목 </td>
			<td> 작성자 </td>
			<td> 조회수 </td>
			<td> 작성일 </td>
		</tr>
		<c:forEach items="${glist }" var="gdto">
		<tr align="center">
			<td align="center">
				<c:if test="${gdto.state==2 }">
				<span id="badge1">필독</span> <!-- '필독' 배지 -->
				</c:if>
				<c:if test="${gdto.state==1 }">
				<span id="badge2">공지</span> <!-- '공지' 배지 -->
				</c:if>
				<a href="gongjiContent?id=${gdto.id}"> ${gdto.title } </a> <!-- 제목 링크 -->
			</td>
			<td> ${gdto.writer } </td>
			<td> ${gdto.readnum } </td>
			<td> ${gdto.writeday } </td>
		</tr>
		</c:forEach>
		<tr align="right">
			<td colspan="4"> <!-- 글쓰기 버튼 -->
				<a href="gongjiWrite"><input id="write" type="button" value="작성하기"></a>
			</td>
		</tr>
	</table>
</section>
</body>
</html>