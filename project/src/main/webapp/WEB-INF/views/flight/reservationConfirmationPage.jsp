<!-- bookingComplete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 완료</title>
</head>
<body>
    <h2>예약이 완료되었습니다!</h2>
    <p>가는편 예약 번호 (PNR): ${goingPNR}</p>
    <p>오는편 예약 번호 (PNR): ${returnPNR}</p>
    <p>선택한 좌석: 가는편 (${goingSelectedSeats}), 오는편 (${returnSelectedSeats})</p>
</body>
</html>
