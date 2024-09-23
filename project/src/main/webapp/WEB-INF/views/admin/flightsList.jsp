<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title> 항공편 현황 </title>
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    section {
        display: flex;
        flex-direction: column; /* 수직 방향으로 정렬 */
        max-width: 1200px;
        margin: auto;
    }
    .table-container {
        width: 100%;
        background-color: white;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0;
        font-size: 12px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #000A8E;
        color: white;
        text-transform: uppercase;
    }
    td {
        background-color: #f9f9f9;
    }
    caption {
        font-size: 16px;
        font-weight: bold;
        padding: 10px;
        background-color: #000A8E;
        color: white;
        text-align: left;
    }
    .pagination {
        text-align: center;
        margin-top: 20px;
    }
    .pagination a {
        display: inline-block;
        padding: 5px 10px;
        margin: 0 3px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 12px;
    }
    .pagination a.active, .pagination span.active {
        background-color: #333;
        color: white;
        cursor: default;
        text-decoration: none;
    }
    .pagination span {
        display: inline-block;
        padding: 5px 10px;
        margin: 0 3px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 12px;
        cursor: default;
    }
    /* 추가된 스타일 */
    #datePickerContainer {
        width: 100%;
        margin-bottom: 20px;
        text-align: center;
    }
    #clsd {
        background: #000A8E;
        color: white;
        border-radius: 5px;
        padding: 10px 15px;
        border: none;
        cursor: pointer;
        margin-bottom: 10px;
        width: 150px;
        
    }
    #datepicker {
        display: inline-block;
        margin: 0 auto;
    }
    #selectedDate {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        margin-top: 10px;
    }
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- jQuery UI CSS 추가 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
<div width="100%" style="text-align: center"><h2>항공편 리스트</h2></div>

<section id="sec1">
    <!-- 날짜 선택 기능 추가 -->
    
    <div id="datePickerContainer">
    <button id="clsd" onclick="clearDate()">날짜 선택 해제</button><br>    
        <div id="datepicker"></div>
        <div id="selectedDate">
            <c:if test="${not empty selectedDate}">
                선택한 날짜: ${selectedDate}
            </c:if>
        </div>
    </div>

    <div class="table-container" id="flightTable">
        <table>
            <caption>항공편 리스트</caption>
            <tr>
                <th>항공편명</th>
                <th>출발 공항</th>
                <th>도착 공항</th>
                <th>출발 시간</th>
                <th>도착 시간</th>
                <th>좌석 수</th>
            </tr>
            <!-- Flights Data -->
            <c:forEach var="flight" items="${flightList}">
                <tr>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.departureAirport}</td>
                    <td>${flight.arrivalAirport}</td>
                    <td>${flight.departureTime}</td>
                    <td>${flight.arrivalTime}</td>
                    <td>${flight.availableSeats}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty flightList}">
                <tr>
                    <td colspan="6">항공편 데이터가 없습니다.</td>
                </tr>
            </c:if>
        </table>
        <!-- Pagination -->
        <div class="pagination">
            <c:if test="${totalPages > 1}">
                <!-- 이전 5페이지 -->
                <c:if test="${currentPage > 10}">
                    <a href="javascript:void(0);" onclick="loadPage(${currentPage - 10});">이전 10</a>
                </c:if>

                <!-- 이전 페이지 -->
                <c:if test="${currentPage > 1}">
                    <a href="javascript:void(0);" onclick="loadPage(${currentPage - 1});">이전</a>
                </c:if>

                <!-- 페이지 번호 (최대 10개 표시) -->
                <c:set var="startPage" value="${(currentPage - 5 > 1) ? currentPage - 5 : 1}" />
                <c:set var="endPage" value="${(currentPage + 4 > totalPages) ? totalPages : currentPage + 4}" />

                <c:forEach begin="${startPage}" end="${endPage}" var="i">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0);" onclick="loadPage(${i});">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 다음 페이지 -->
                <c:if test="${currentPage < totalPages}">
                    <a href="javascript:void(0);" onclick="loadPage(${currentPage + 1});">다음</a>
                </c:if>

                <!-- 다음 5페이지 -->
                <c:if test="${currentPage + 10 <= totalPages}">
                    <a href="javascript:void(0);" onclick="loadPage(${currentPage + 10});">다음 10</a>
                </c:if>
            </c:if>
        </div>
    </div>
</section>

<!-- jQuery 및 jQuery UI 스크립트 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
// 날짜 선택 기능 추가
$(function() {
    $("#datepicker").datepicker({
        inline: true,
        dateFormat: 'yy-mm-dd',
        defaultDate: null,
        onSelect: function(dateText) {
            $("#selectedDate").text('선택한 날짜: ' + dateText);
            sessionStorage.setItem("selectedDate", dateText);

            // 페이지 번호 초기화 및 데이터 로드
            loadPage(1, dateText);
        }
    });

    var savedDate = sessionStorage.getItem("selectedDate");
    if (savedDate) {
        $("#selectedDate").text('선택한 날짜: ' + savedDate);
        $("#datepicker").datepicker('setDate', savedDate);

        // 페이지 번호 초기화 및 데이터 로드
        loadPage(1, savedDate);
    } else {
        $("#selectedDate").text('');
        $("#datepicker").datepicker('setDate', null);

        // 페이지 번호 초기화 및 데이터 로드
        loadPage(1);
    }
});

function clearDate() {
    sessionStorage.removeItem("selectedDate");
    $("#selectedDate").text('');
    $("#datepicker").datepicker('setDate', null);

    // 페이지 번호 초기화 및 전체 데이터 로드
    loadPage(1);
}

function loadPage(page, selectedDate = null) {
    if (!selectedDate) {
        selectedDate = sessionStorage.getItem("selectedDate");
    } else {
        sessionStorage.setItem("selectedDate", selectedDate);
    }

    // 서버에 요청 보내서 페이지 로드
    $.ajax({
        url: "/admin/flightsList",
        type: "GET",
        data: {
            page: page,  // 페이지 번호 전달
            selectedDate: selectedDate  // 선택된 날짜 전달
        },
        success: function(data) {
            // 서버에서 받은 데이터를 테이블에 렌더링
            $("#flightTable").html($(data).find("#flightTable").html());
            // 페이지네이션 업데이트
            $(".pagination").html($(data).find(".pagination").html());
        },
        error: function(error) {
            console.log("데이터 가져오기 실패:", error);
        }
    });
}

</script>

</body>
</html>