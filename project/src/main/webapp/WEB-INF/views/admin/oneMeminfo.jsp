<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
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
		height: 25px; /* 셀 높이 */
		font-size: 12px;
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
		<caption><h3> 회원 정보 </h3></caption> <!-- 테이블 제목 -->
		<tr align="center">
			<td> 고객명 </td>
			<td> ID </td>
			<td> 회원등급 </td>
			<td> 요청사항 </td>
		</tr>
		<tr align="center">
		    <td align="center"> ${member.name} </td>
		    <td align="center"> ${member.userid} </td>
		    <td align="center"> VIP </td>
		    <td align="center"> - </td>
		</tr>
	</table>
	<table>
		<caption><h3> 예약 내역 </h3></caption> <!-- 테이블 제목 -->
		<tr align="center">
			<td> 최근예약현황 </td>
			<td> 요청사항 </td>
		</tr>
		<c:forEach items="${member.reservations}" var="rsv">
		<tr align="center">
			
    	    <td align="center">
				${rsv.reservationDate}
        	</td>
        	<td align="center"> - </td>
		</tr>
		</c:forEach>
	</table>

	<!-- 페이지네이션 -->
	<div align="center">
		<c:if test="${currentPage > 1}">
			<a href="?page=${currentPage - 1}">이전</a>
		</c:if>
		<c:forEach begin="1" end="${totalPages}" var="i">
			<c:if test="${i == currentPage}">
				<span>${i}</span>
			</c:if>
			<c:if test="${i != currentPage}">
				<a href="?page=${i}">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${currentPage < totalPages}">
			<a href="?page=${currentPage + 1}">다음</a>
		</c:if>
	</div>
</section>

</body>
</html>