<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A</title>
<style type="text/css">
	section {
		width: 1000px;
		margin: auto;
		font-family: 'hahmlet', sans-serif;
		position: relative; /* 자식 요소의 위치를 조정하기 위해 부모를 relative로 설정 */
	}
	section table {
		width: 800px;
		margin: 0 auto;
		border-spacing: 0;
		margin-bottom: 200px;
	}
	section table td {
		border-bottom: 1px solid #2DD1C5;
		padding: 5px;
		height: 40px;
	}
	section table tr:first-child td {
		border-top: 2px solid #2DD1C5;
		border-bottom: 2px solid #2DD1C5;
	}
	section table tr:last-child td {
		border-bottom: 2px solid #2DD1C5;
	}
	section table a {
		text-decoration: none;
		color: black;
	}
	section #write {
		display: inline-block;
		width: 100px;
		background: #23297A;
		color: white;
		text-align: center;
		text-decoration: none;
		padding: 5px 0;
		box-sizing: border-box;
		border-radius: 5px;
	}
</style>
</head>
<body>

<section>
	<!-- 게시판 섹션 -->
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