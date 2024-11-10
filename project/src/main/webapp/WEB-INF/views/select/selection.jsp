<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>예약 조회</title>
    <style>
    .direction{
	width: 100%;
    box-sizing: border-box;
    padding: 10px;
    padding-left: 20px;
    background-color: #f9f9f9;
    border-bottom: 1px solid #ddd;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;}
    
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }

        .reservation-container {
            max-width: 1000px;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .reservation-header {
            background-color: #0066cc;
            padding: 20px;
            color: white;
            text-align: center;
        }

        .reservation-header h2 {
            margin: 0;
            font-size: 22px;
        }

        .flight-info-container {
            padding: 20px;
        }

        .flight-section {
    background-color: #f9f9f9;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;

        }

        .flight-details {
            width: 60%;
        }

        .flight-details h3 {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
        }

        .flight-details p {
            margin: 5px 0;
            font-size: 14px;
        }

        .flight-summary {
            text-align: right;
            width: 35%;
        }

        .flight-summary p {
            margin: 5px 0;
            font-size: 16px;
            font-weight: bold;
        }

        .flight-time {
            font-size: 24px;
            font-weight: bold;
        }

        .services-box {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            background-color: #f0f5ff;
            padding: 10px;
            border-radius: 10px;
        }

        .service-item {
            text-align: center;
            flex: 1;
        }

        .service-item img {
            max-width: 40px;
        }

        .service-item p {
            margin-top: 10px;
            font-size: 14px;
        }

        .checkin-btn {
            background-color: #0066cc;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .checkin-btn:hover {
            background-color: #004da8;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .info-row label {
            font-weight: bold;
        }

        .info-row span {
            font-size: 14px;
        }
        
        #menu {
            background-color: #0066cc;
            color: white;
            padding: 5px 8px;
            margin: 2px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
        }

        #menu:hover {
            background-color: #004da8;
        }
    </style>
</head>
<body>

<div class="reservation-container">
<a href="../main/index"><input type="button" id="menu" value="홈으로"></a>
<a href="../reserve/list"><input type="button" id="menu" value="목록으로"></a>
    <!-- 예약 상단 정보 -->
    <div class="reservation-header">
        <h2>예약번호: <span>${reservationList[0].pnr}</span></h2>
        <p>${reservationList[0].departureCity} -> ${reservationList[0].arrivalCity}</p>
    </div>

    <!-- 항공편 동적 리스트 출력 -->
    <c:forEach var="reservationInfo" items="${reservationList}">
        <div class="flight-info-container">
 
                
                <div class="direction">
                    <span>${reservationInfo.departureAirport} -> ${reservationInfo.arrivalAirport}</span>
                    </div>
          			  <div class="flight-section">
                    <div class="flight-details">
                    <div class="info-row">
                        <label>${reservationInfo.departureTime.substring(0, 10)}</label>  
                    </div>
                    <div class="info-row">
                        <label>항공편명:</label> <span>${reservationInfo.flightName}</span>
                    </div>
                    <div class="info-row">
                        <label>좌석 등급:</label> <span>${reservationInfo.seatClass}</span>
                        <label>좌석 번호:</label> <span>${reservationInfo.seatNumber}</span>
                    </div>
                </div>
                
                <div class="info-row">
        <label>출발 시간:</label> <span>${reservationInfo.departureTime.substring(11, 16)}</span>
        <label>공항 이름:</label> <span>${reservationInfo.departureAirportName}</span>
        <label>출발 공항:</label> <span>${reservationInfo.departureAirport}</span>
    </div>
    
    <div class="info-row">
        <label>소요 시간:</label> <span>${reservationInfo.flightDuration.substring(0, 5)}</span>
    </div>
    
    <div class="info-row">
        <label>도착 시간:</label> <span>${reservationInfo.arrivalTime.substring(11, 16)}</span>
        <label>공항 이름:</label> <span>${reservationInfo.arrivalAirportName}</span>
        <label>도착 공항:</label> <span>${reservationInfo.arrivalAirport}</span>
    </div>

                <div class="flight-summary">
                    
                    <button class="checkin-btn">체크인</button>
                </div>
            </div>

            <!-- 부가 서비스 -->
            <div class="services-box">
                <div class="service-item">
        <img src="path/to/seat-icon.png" alt="좌석">
        <p>
            <c:choose>
                <c:when test="${reservationInfo.seatNumber != null}">
                    좌석 번호: ${reservationInfo.seatNumber}
                </c:when>
                <c:otherwise>
                    좌석 신청 전
                </c:otherwise>
            </c:choose>
        </p>
    </div>
                <div class="service-item">
                <button type="button" onclick="movePage()">  
                    <img src="path/to/passport-icon.png" alt="여권">
                     </button>
                </div> 
                <div class="service-item">  
                    <img src="path/to/service-icon.png" alt="서비스">
                    <p>기타 서비스</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
