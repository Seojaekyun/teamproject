<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>administrator</title>
<style>
	section {
		width: 100%;
	}
	h4 {
		height: 0px;
	}
	caption {
		height: 45px;
	}
	section div {
		background: white;
		display: flex;
		padding: 0px 20px 20px 20px;
	}
	section div table {
		border-spacing: 0px;
	}
	section div table tr:first-child {
		background: lightblue;
	}
	section div table td {
		border: 1px solid lightgray;
		padding: 0px 10px 0px 10px;
		height: 40px;
		text-align: center;
		border-spacing: 0px;
		border-radius: 5px;
	}
	#pagination {
		display: flex;
		justify-content: left;
		margin-top: 10px;
		clear: both;
		width: 600px;
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
	<h4>&nbsp;&nbsp;&nbsp; | 당일 예약 현황</h4>
	<div id="first">
    <div id="one">
        <!-- GMP로 시작하는 항공편 -->
        <div id="gmpFlights">
            <table>
                <caption><h5 align="left"> GMP 출발 항공편 </h5></caption>
                <tr>
                    <td>항공편명</td>
                    <td>출항시간</td>
                    <td>예약석</td>
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
                        <td colspan="3">GMP 출발 항공편 데이터가 없습니다.</td>
                    </tr>
                </c:if>
            </table>
        </div>

        <!-- ICN으로 시작하는 항공편 -->
        <div id="icnFlights">
            <table>
                <caption><h5 align="left"> ICN 출발 항공편 </h5></caption>
                <tr>
                    <td>항공편명</td>
                    <td>출항시간</td>
                    <td>예약석</td>
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
                        <td colspan="3">ICN 출발 항공편 데이터가 없습니다.</td>
                    </tr>
                </c:if>
            </table>
        </div>

        <!-- 기타 항공편 -->
        <div id="otherFlights">
            <table>
                <caption><h5 align="left"> 기타 출발 항공편 </h5></caption>
                <tr>
                    <td>항공편명</td>
                    <td>출항시간</td>
                    <td>예약석</td>
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
                        <td colspan="3">기타 출발 항공편 데이터가 없습니다.</td>
                    </tr>
                </c:if>
            </table>
        </div>
    </div>
</div>

	<hr>
	<h4>&nbsp;&nbsp;&nbsp; | 당일 항공 현황</h4>
	<br>
	<div id="second">
		<div id="one">
			<div id="flights">
				<table>
					<tr>
						<caption><h5 align="left"> 출항 </h5></caption>
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
		</div>
		<div id="one">
			<div id="flights">
				<table>
					<tr>
						<caption><h5 align="left"> 입항 </h5></caption>
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
	</div>
	<hr>
	<h4>&nbsp;&nbsp;&nbsp; | 주요문의 현황 </h4>
	<div id="third">
		<div id="one">
			<div id="topinq">
				<table>
					<caption><h5 align="left"> 주요문의 </h5></caption>
					<tr>
						<td id="num"> 순위 </td>
						<td id="title"> 문의 사항 </td>
						<td> 문의량 </td>
					</tr>

					<!-- countsList 디버깅 출력 -->
					<c:if test="${empty countsList}">
						<tr>
							<td colspan="3">데이터가 없습니다.</td>
						</tr>
					</c:if>
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
					<caption><h5 align="left"> 최근문의 </h5></caption>
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
										<span id="s1">예약취소 관련 문의</span>
									</c:if>
									<c:if test="${idto.state==3}">
										<span id="s2">웹사이트 관련 문의</span>
									</c:if>
									<c:if test="${idto.state==4}">
										<span id="s1">기타 문의</span>
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
	</div>
</section>

</body>
</html>