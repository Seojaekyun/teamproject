<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 내용</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f9f9f9;
		margin: 0;
		padding: 0;
	}
	.container {
		width: 60%;
		max-width: 1200px;
		margin: auto;
		margin-bottom: 20px;
		padding: 20px 0;
		background-color: white;
		box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		padding: 20px;
		height: 650px;
	}
	h4 {
		font-size: 24px;
		color: #333;
		padding-bottom: 10px;
		margin-bottom: 10px;
		text-align: center;
	}
	.container table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
		margin: auto;
	}
	.container table th, .container table td {
		border: 1px solid #ddd;
		padding: 10px;
		text-align: left;
		vertical-align: middle;
	}
	.container table th {
		background-color: #000A8E;
		color: white;
		text-align: center;
		text-transform: uppercase;
	}
	.container table td {
		text-align: left;
		background-color: #f9f9f9;
	}
	/* 상태 컬럼 크기 조정 */
	.status-col {
		width: 80px;
	}
	#content {
		line-height: 1.6;
	}
	.tr {
		display: none;
	}
	/* 답변 상태에 따른 색상 구분 */
	.status-completed {
		color: blue;
		font-size: 14px;
		cursor: pointer;
	}
	.status-pending {
		color: red;
		font-size: 12px;
	}
	/* 반응형 디자인 */
	@media (max-width: 768px) {
		h4 {
			font-size: 16px;
		}
		.container table th, .container table td {
			padding: 8px;
			font-size: 12px;
		}
		.status-col {
			width: 60px;
		}
	}
</style>
</head>
<body>

<div class="container">
	<h4>문의 내용</h4>
	<c:forEach items="${ilist}" var="idto" varStatus="sts">
		<table>
			<tr>
				<th class="status-col">상태</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td class="status-col">
					<c:if test="${idto.answer == 1}">
						<span class="status-completed" onclick="view(${sts.index})">답변 완료</span>
					</c:if>
					<c:if test="${idto.answer == 0}">
						<span class="status-pending">답변 대기중</span>
					</c:if>
				</td>
				<td>${idto.title}</td>
				<td id="content">${idto.content}</td>
				<td style="text-align: center">${idto.writeday}</td>
			</tr>
			<tr class="tr">
				<th colspan="4">답변 내용</th>
			</tr>
			<tr class="tr">
				<td colspan="4" id="content">${idto.answertext}</td>
			</tr>
		</table>
	</c:forEach>
</div>

<script>
	function view(n) {
		var tr = document.getElementsByClassName("tr");
		for (var i = 0; i < tr.length; i++) {
			tr[i].style.display = "none"; // 모든 답변 숨김
		}
		// 클릭된 답변만 보이기
		tr[2 * n].style.display = "table-row";
		tr[2 * n + 1].style.display = "table-row";
	}
</script>

</body>
</html>
