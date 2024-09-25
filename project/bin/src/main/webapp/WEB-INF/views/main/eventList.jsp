<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 안내</title>
<style>
    /* 스타일 정의 */
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
        margin-bottom: 20px;
    }
    section .content p {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 20px;
    }
    section .content ul {
        list-style-type: disc;
        margin-left: 20px;
    }
    section .content ul li {
        margin-bottom: 10px;
    }
    section .event-list {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }
    section .event-item {
        flex: 1 1 calc(50% - 20px);
        background-color: #f9f9f9;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: none; /* 초기에는 숨김 처리 */
    }
    section .event-item img {
        width: 100%;
        height: auto;
    }
    section .event-item .event-content {
        padding: 15px;
    }
    section .event-item h3 {
        font-size: 20px;
        color: #00467F;
        margin-bottom: 10px;
    }
    section .event-item p {
        font-size: 14px;
        color: #555;
        margin-bottom: 15px;
    }
    section .event-item a {
        display: inline-block;
        padding: 8px 12px;
        background-color: #00467F;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }
    section .event-item a:hover {
        background-color: #003A66;
    }
    section .more-button {
        text-align: center;
        margin-top: 30px;
    }
    section .more-button button {
        padding: 10px 20px;
        background-color: #00467F;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    section .more-button button:hover {
        background-color: #003A66;
    }
    .event-item:hover {
	    transform: translateY(-5px);
	    transition: transform 0.3s ease;
	}

    /* 반응형 디자인 */
    @media screen and (max-width: 768px) {
        section .event-item {
            flex: 1 1 calc(50% - 20px);
        }
    }
    @media screen and (max-width: 480px) {
        section .event-item {
            flex: 1 1 100%;
        }
    }
</style>
<script>
    // 페이지 로드 시 첫 4개의 이벤트만 표시
    document.addEventListener('DOMContentLoaded', function() {
        let eventItems = document.querySelectorAll('.event-item');
        let itemsToShow = 4; // 처음에 보여줄 이벤트 개수
        let currentItems = 0;

        // 처음에 4개 이벤트 보여주기
        for (let i = 0; i < itemsToShow && i < eventItems.length; i++) {
            eventItems[i].style.display = 'block';
            currentItems++;
        }

        // 더보기 버튼 클릭 시 추가로 4개의 이벤트 보여주기
        document.getElementById('moreBtn').addEventListener('click', function() {
            let itemsToLoad = 4;
            let itemsLoaded = 0;

            for (let i = currentItems; i < eventItems.length && itemsLoaded < itemsToLoad; i++) {
                eventItems[i].style.display = 'block';
                currentItems++;
                itemsLoaded++;
            }

            // 모든 이벤트를 다 보여주면 더보기 버튼 숨기기
            if (currentItems >= eventItems.length) {
                document.getElementById('moreBtn').style.display = 'none';
            }
        });
    });
    
    
</script>
</head>
<body>

<section>
    <header>
        <h1>이벤트 안내</h1>
    </header>

    <nav>
        <a href="eventList">전체 이벤트</a>
        <a href="ongoingEvents">진행 중인 이벤트</a>
        <a href="pastEvents">지난 이벤트</a>
        <a href="faq">FAQ</a>
    </nav>
    
    <div class="container">
        <div class="content">
            <h2>진행 중인 이벤트</h2>
            <div class="event-list">
                <!-- 이벤트 아이템 1 -->
                <div class="event-item">
                    <img src="../static/resources/promotion1.jpeg" alt="이벤트 1 이미지">
                    <div class="event-content">
                        <h3>여름 휴가 프로모션</h3>
                        <p>올여름 특별한 할인 혜택을 받아보세요!</p>
                        <a href="eventDetail1">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 2 -->
                <div class="event-item">
                    <img src="../static/resources/promotion2.jpeg" alt="이벤트 2 이미지">
                    <div class="event-content">
                        <h3>가족 여행 특별 이벤트</h3>
                        <p>가족과 함께하는 여행을 위한 특별 혜택을 제공합니다.</p>
                        <a href="eventDetail2">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 3 -->
                <div class="event-item">
                    <img src="event3.jpg" alt="이벤트 3 이미지">
                    <div class="event-content">
                        <h3>마일리지 더블 적립</h3>
                        <p>이벤트 기간 동안 마일리지가 두 배로 적립됩니다.</p>
                        <a href="eventDetail3">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 4 -->
                <div class="event-item">
                    <img src="event4.jpg" alt="이벤트 4 이미지">
                    <div class="event-content">
                        <h3>신규 회원 가입 이벤트</h3>
                        <p>지금 가입하고 웰컴 포인트를 받아보세요!</p>
                        <a href="eventDetail4">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 5 -->
                <div class="event-item">
                    <img src="../static/resources/promotion3.jpeg" alt="이벤트 5 이미지">
                    <div class="event-content">
                        <h3>해외 여행 할인 이벤트</h3>
                        <p>특정 노선에 한해 최대 30% 할인 혜택을 제공합니다.</p>
                        <a href="eventDetail5">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 6 -->
                <div class="event-item">
                    <img src="event6.jpg" alt="이벤트 6 이미지">
                    <div class="event-content">
                        <h3>제휴 카드 특별 혜택</h3>
                        <p>제휴 카드를 사용하여 결제 시 추가 할인!</p>
                        <a href="eventDetail6">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 7 -->
                <div class="event-item">
                    <img src="event7.jpg" alt="이벤트 7 이미지">
                    <div class="event-content">
                        <h3>SNS 공유 이벤트</h3>
                        <p>이벤트를 공유하고 추첨을 통해 경품을 받아가세요.</p>
                        <a href="eventDetail7">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 8 -->
                <div class="event-item">
                    <img src="../static/resources/promotion3_1.jpeg" alt="이벤트 8 이미지">
                    <div class="event-content">
                        <h3>얼리버드 특가전</h3>
                        <p>미리 예약하고 특별한 가격으로 여행을 떠나세요.</p>
                        <a href="eventDetail8">자세히 보기</a>
                    </div>
                </div>
                <!-- 이벤트 아이템 9 -->
                <div class="event-item">
                    <img src="event9.jpg" alt="이벤트 9 이미지">
                    <div class="event-content">
                        <h3>인기 노선 추가 할인</h3>
                        <p>인기 노선 항공권을 특별한 가격에 제공합니다.</p>
                        <a href="eventDetail9">자세히 보기</a>
                    </div>
                </div>
                <!-- 더 많은 이벤트를 추가할 수 있습니다. -->
            </div>
            <!-- 더보기 버튼 -->
            <div class="more-button">
                <button id="moreBtn">더 보기</button>
            </div>
        </div>
    </div>

    <div>
        <p>© 2024 eLT항공. 모든 권리 보유.</p>
    </div>
</section>

</body>
</html>
