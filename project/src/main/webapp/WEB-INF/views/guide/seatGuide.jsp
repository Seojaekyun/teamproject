<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>얼리버드 좌석 배정 안내</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    section header {
        background-color: #00467F;
        padding: 20px;
        text-align: center;
        color: white;
    }
    section header h1 {
        margin: 0;
        font-size: 24px;
    }
    section nav {
        background-color: #0059A3;
        padding: 10px;
        text-align: center;
    }
    section nav a {
        color: white;
        margin: 0 15px;
        text-decoration: none;
        font-size: 16px;
    }
    section nav a:hover {
        text-decoration: underline;
    }
    section .container {
        max-width: 1200px;
        margin: 20px auto;
        background-color: white;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    section .content h2 {
        font-size: 22px;
        color: #00467F;
        margin-bottom: 10px;
    }
    section .content p {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
    }
    section .content ul, section .content ol {
        list-style-type: disc;
        margin-left: 20px;
    }
    section .content ul li, section .content ol li {
        margin-bottom: 10px;
    }
    section .cta-button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #00467F;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 20px;
    }
    section .cta-button:hover {
        background-color: #003A66;
    }
</style>
</head>
<body>

<section>
    <header>
        <h1>얼리버드 좌석 배정 안내</h1>
    </header>

    <nav>
        <a href="chedkinGuide">체크인 안내</a>
        <a href="seatGuide">좌석배정 안내</a>
        <a href="#">수하물</a>
    </nav>

    <div class="container">
        <div class="content">
            <h2>얼리버드 좌석 배정 서비스란?</h2>
            <p>얼리버드 좌석 배정 서비스는 항공편 출발 전에 원하는 좌석을 미리 선택할 수 있는 유료 서비스입니다. 창가 자리, 복도 자리 등 선호하는 좌석을 사전에 예약하여 더욱 편안한 여행을 즐기세요.</p>

            <h2>서비스 이용 방법</h2>
            <ol>
                <li>항공권 예약 및 구매 완료</li>
                <li>홈페이지 또는 모바일 앱에서 '얼리버드 좌석 배정' 메뉴 선택</li>
                <li>예약 번호와 성명을 입력하여 로그인</li>
                <li>원하는 좌석 선택 후 결제 진행</li>
                <li>좌석 배정 완료 확인</li>
            </ol>

            <h2>주의 사항</h2>
            <p>좌석 배정 후 변경이나 환불은 제한될 수 있으며, 안전 상의 이유로 일부 좌석은 제공되지 않을 수 있습니다. 이용 약관을 반드시 확인해 주세요.</p>

            <a class="cta-button" href="#">좌석 배정하기</a>
        </div>
    </div>
</section>

</body>
</html>