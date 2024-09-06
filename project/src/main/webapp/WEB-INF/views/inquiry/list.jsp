<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	section {
		width: 1000px;
		height: 600px;
		margin: auto;
		font-family: 'hahmlet', sans-serif; /* 대체 폰트 추가 */
	}
	section table {
		width: 800px; /* 테이블 너비 */
		margin: 0 auto; /* 테이블을 섹션 가운데 정렬 */
		border-spacing: 0; /* 테이블 셀 간격 제거 */
		margin-bottom: 200px; /* 테이블 아래 여백 */
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
	
</style>

</head>
<body>

<section>
	<table>
		<caption><h3> Q & A </h3></caption>
		<tr align="center">
			<td> 문의사항 </td>
			<td> 작성자 </td>
			<td> 조회수 </td>
			<td> 작성일 </td>
		</tr>
		<c:forEach items="${ilist}" var="idto">
		<tr align="center">
			<td align="center">
				<a href="readnum?id=${idto.id}">
					<c:if test="${idto.title==0}">
					<span id="s1">예약접수 관련 문의</span>
					</c:if>
					<c:if test="${idto.title==1}">
					<span id="s2">탑승수속 관련 문의</span>
					</c:if>
					<c:if test="${idto.title==2}">
					<span id="s1">예약취소 관련 문의</span>
					</c:if>
					<c:if test="${idto.title==3}">
					<span id="s2">웹사이트 관련 문의</span>
					</c:if>
					<c:if test="${idto.title==4}">
					<span id="s1">기타 문의</span>
					</c:if>
				</a>
			</td>
			<td> writer </td>
			<td> ${idto.readnum} </td>
			<td> ${idto.writeday} </td>
		</tr>
		</c:forEach>
		<tr align="right">
			<td colspan="4">
				<a href="write"><input id="write" type="button" value="문의하기"></a>
			</td>
		</tr>
	</table>
	
</section>

</body>
</html>