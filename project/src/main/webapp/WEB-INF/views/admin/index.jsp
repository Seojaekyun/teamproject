<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>administrator</title>
<style>
	/* 전체적인 레이아웃 */
	body {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f0f4f8;
		margin: 0;
		padding: 0;
	}
	h4 {
		font-size: 18px;
		color: #333;
		font-weight: 600;
		margin: 10px 0px 10px 10px;
	}
	#h5{
		margin: 10px 0px 5px 10px;
		align: left;
		font-size: 12px;
	}
	section {
		width: 1400px;
		padding-bottom: 40px;
		margin: auto;
	}
	section div {
		padding-left: 20px;
		margin-right: 20px;
	}
	section #first div {
		background: #fff;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		border-radius: 8px;
		padding: 0px 10px 10px 10px;
	}
	section #second div {
		background: #fff;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		border-radius: 8px;
		padding: 0px 10px 10px 10px;
	}
	section #third div {
		background: #fff;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		border-radius: 8px;
		padding: 0px 10px 10px 10px;
	}
	section div table {
		width: 100%;
		border-collapse: collapse;
		margin: 0 auto;
		text-align: center;
		border-radius: 8px;
		overflow: hidden;
		display: inline-block;
	}
	section div table tr:first-child {
		background-color: #007BFF;
		color: white;
		font-weight: bold;
		text-transform: uppercase;
	}
	section div table td, section div table th {
		padding: 5px;
		border: 1px solid #e5e5e5;
		color: #555;
	}
	section div table td {
		background-color: #fafafa;
		font-size: 12px;
	}
	section div table caption {
		font-size: 20px;
		padding-bottom: 0;
		margin-bottom: 0!important;
		color: #333;
		text-align: left;
		font-weight: 600;
	}
	section a {
		text-decoration: none;
		font-size: 12px;
		color: #555;
	}
	a:hover {
		text-decoration: none;
		font-weight: 900;
		color: black;
	}
	section div {
		display: flex;
	}
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
</script>
</head>
<body>

<section>
	<h4>&nbsp;&nbsp;&nbsp; | 예약 현황</h4>
	<div id="first">
	    <div id="gmpFlights">
	        <table>
	            <caption><span id="h5"> GMP 출항 </span></caption>
	            <tr>
	                <td>항공편명</td>
	                <td>출항시간</td>
	                <td>예약</td>
	            </tr>
	            <c:forEach items="${gmpRsv}" var="grsv">
	                <tr>
	                    <td>${grsv.flightName}</td>
	                    <td>${grsv.departureTime}</td>
	                    <td>${grsv.reservationCount}</td>
	                </tr>
	            </c:forEach>
	            <c:if test="${empty gmpRsv}">
	                <tr>
	                    <td colspan="3">GMP 예약 데이터가 없습니다.</td>
	                </tr>
	            </c:if>
	        </table>
	    </div>
	    <div id="icnFlights">
	        <table>
	            <caption><span id="h5"> ICN 출항 </span></caption>
	            <tr>
	                <td>항공편명</td>
	                <td>출항시간</td>
	                <td>예약</td>
	            </tr>
	            <c:forEach items="${icnRsv}" var="irsv">
	                <tr>
	                    <td>${irsv.flightName}</td>
	                    <td>${irsv.departureTime}</td>
	                    <td>${irsv.reservationCount}</td>
	                </tr>
	            </c:forEach>
	            <c:if test="${empty icnRsv}">
	                <tr>
	                    <td colspan="3">ICN 예약 데이터가 없습니다.</td>
	                </tr>
	            </c:if>
	        </table>
	    </div>
	    <div id="otherFlights">
	        <table>
	            <caption><span id="h5"> 기타 항공편 </span></caption>
	            <tr>
	                <td>항공편명</td>
	                <td>출항시간</td>
	                <td>예약</td>
	            </tr>
	            <c:forEach items="${otherRsv}" var="orsv">
	                <tr>
	                    <td>${orsv.flightName}</td>
	                    <td>${orsv.departureTime}</td>
	                    <td>${orsv.reservationCount}</td>
	                </tr>
	            </c:forEach>
	            <c:if test="${empty otherRsv}">
	                <tr>
	                    <td colspan="3">기타 예약 데이터가 없습니다.</td>
	                </tr>
	            </c:if>
	        </table>
	    </div>
	</div>
	<hr>
	<h4>&nbsp;&nbsp;&nbsp; | 항공편 현황</h4>
	<div id="second">
		<div id="flights">
			<table>
				<caption><span id="h5"> 출항 </span></caption>
				<tr>
					<td>출발</td>
					<td>도착</td>
					<td>출발 시간</td>
					<td>현지도착 시간</td>
					<td>비행 시간</td>
				</tr>
				<c:forEach items="${departureList}" var="flight">
					<c:if test="${(flight.departureAirport eq 'GMP')||(flight.departureAirport eq 'ICN')}">
						<tr>
							<td>${flight.departureAirport}</td>
							<td>${flight.arrivalAirport}</td>
							<td>${flight.departureTime}</td>
							<td>${flight.arrivalTime}</td>
							<td>${flight.flightDuration}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<div id="flights">
			<table>
				<caption><span id="h5"> 입항 </span></caption>
				<tr>
					<td>출발</td>
					<td>도착</td>
					<td>현지출발 시간</td>
					<td>도착 시간</td>
					<td>비행 시간</td>
				</tr>
				<c:forEach items="${arrivalList}" var="flight">
					<c:if test="${(flight.arrivalAirport eq 'GMP')||(flight.arrivalAirport eq 'ICN')}">
						<tr>
							<td>${flight.departureAirport}</td>
							<td>${flight.arrivalAirport}</td>
							<td>${flight.departureTime}</td>
							<td>${flight.arrivalTime}</td>
							<td>${flight.flightDuration}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	<hr>
	<h4>&nbsp;&nbsp;&nbsp; | 주요문의 현황 </h4>
	<div id="third">
		<div id="topinq">
			<table>
				<caption><span id="h5"> 주요문의 </span></caption>
				<tr>
					<td id="num"> 순위 </td>
					<td id="title"> 문의 사항 </td>
					<td> 문의량 </td>
				</tr>
				<c:forEach items="${countsList}" var="entry" varStatus="status">
					<tr>
						<td id="num"> ${entry.rank} </td>
						<td>
							<c:choose>
								<c:when test="${entry.state eq 4}">
									<span id="s1">기타 문의</span>
								</c:when>
								<c:when test="${entry.state eq 3}">
									<span id="s2">웹사이트 관련 문의</span>
								</c:when>
								<c:when test="${entry.state eq 2}">
									<span id="s1">예약취소 관련 문의</span>
								</c:when>
								<c:when test="${entry.state eq 1}">
									<span id="s2">탑승수속 관련 문의</span>
								</c:when>
								<c:when test="${entry.state eq 0}">
									<span id="s1">예약접수 관련 문의</span>
								</c:when>
								<c:otherwise>
									<span id="s1">알 수 없는 문의</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td> ${entry.count} </td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="inq">
			<table>
				<caption><span id="h5"> 최근문의 </span></caption>
				<tr>
					<td> no. </td>
					<td> 문의사항 </td>
					<td> 문의고객 </td>
					<td> 작성일 </td>
					<td> 조회수 </td>
				</tr>
				<c:forEach items="${ilist}" var="idto">
					<tr>
						<td id="num"> ${idto.id } </td>
						<td id="title" align="center">
							<a href="inquiryContent?id=${idto.id}">
								<c:if test="${idto.state==0}">
									<span id="s1">예약접수 관련 문의</span>
								</c:if>
								<c:if test="${idto.state==1}">
									<span id="s2">탑승수속 관련 문의</span>
								</c:if>
								<c:if test="${idto.state==2}">
									<span id="s3">예약취소 관련 문의</span>
								</c:if>
								<c:if test="${idto.state==3}">
									<span id="s4">웹사이트 관련 문의</span>
								</c:if>
								<c:if test="${idto.state==4}">
									<span id="s5">기타 문의</span>
								</c:if>
							</a>
						</td>
						<td> ${idto.userid } </td>
						<td> ${idto.writeday } </td>
						<td> ${idto.readnum } </td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</section>

</body>
</html>