<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>administrator</title>
<style>
	section {
		width: 100%;
		height: 100%;
	}
	h4 {
		height: 0px;
	}
	caption {
		height: 45px;
	}
	section div{
		width: 1200px;
		background: white;
		display: flex;
		margin: auto;
		padding: 0px 0px 10px 0px;
	}
	section div table {
		border-spacing:0px;
		width: 350px;
		border-spacing:0px;		
	}
	section div table tr:first-child {
		background: lightblue;
	}
	section div table td{
		border: 1px solid lightgray;
		width: 100px;
		height: 40px;
		text-align: center;
		border-spacing:0px;
		border-radius: 5px;
	}
	section #second{
		background: white;
		display: block;
		margin: auto;
	}
	section #second table {
		width: 600px;
		border-spacing:0px;
		border-spacing:0px;
	}
	section #second table tr:first-child {
		background: lightblue;
	}
	section #second table td{
		border: 1px solid lightgray;
		height: 40px;
		text-align: center;
		border-spacing:0px;
		border-radius: 5px;
	}
	section #third table {
		border-spacing:0px;
		width: 500px;
		height: 224px;
		border-spacing:0px;
		margin-right: 30px;
		overflow: hidden;
		display: inline-block;
	}
	section #third #topinq {
		border-spacing:0px;
		width: 300px;
		border-spacing:0px;
	}
	section #third #inq td{
		border: 1px solid lightgray;
		width: 130px;
		height: 40px;
		text-align: center;
		border-spacing:0px;
		border-radius: 5px;
	}
	section #third #topinq #num {
		width: 50px;
	}
	section #third #topinq #title {
		width: 250px;
	}
	section #third #inq #num {
		width: 50px;
	}
	section #third #inq #title {
		width: 250px;
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
			<div id="ap1">
				<table>
					<caption><h5 align="left"> 대한항공 </h5></caption>
					<tr>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>잔여석</td>
					</tr>
					<tr>
						<td>kal708</td>
						<td>09:20</td>
						<td>28ea</td>
					</tr>
				</table>
			</div>
			<div id="ap2">
				<table>
					<caption><h5 align="left"> 아시아나 </h5></caption>
					<tr>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>잔여석</td>
					</tr>
					<tr>
						<td>asn458</td>
						<td>10:00</td>
						<td>3ea</td>
					</tr>
				</table>
			</div>
			<div id="ap3">
				<table>
					<tr>
						<caption><h5 align="left"> 제주항공 </h5></caption>
						<td>항공편명</td>
						<td>출항시간</td>
						<td>잔여석</td>
					</tr>
					<tr>
						<td>jja172</td>
						<td>11:20</td>
						<td>54ea</td>
					</tr>
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
	                    <td>출발 공항</td>
	                    <td>도착 공항</td>
	                    <td style="width: 200px;">출발 시간</td>
	                    <td style="width: 200px;">현지도착 시간</td>
	                    <td>비행 시간</td>
	                </tr>
	                <c:forEach items="${flightList}" var="flight">
	                    <tr>
	                        <td>${flight.departureAirport}</td>
	                        <td>${flight.arrivalAirport}</td>
	                        <td>${flight.departureTime}</td>
	                        <td>${flight.arrivalTime}</td>
	                        <td>${flight.flightDuration}</td>
	                    </tr>
	                </c:forEach>
	            </table>
	        </div>
	    </div>
	    <div id="pagination">
	       	<c:forEach begin="1" end="${totalPages}" var="i">
	       	<a href="?page=${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>&nbsp;&nbsp;&nbsp;
	       	</c:forEach>
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
						<td>  </td>
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
