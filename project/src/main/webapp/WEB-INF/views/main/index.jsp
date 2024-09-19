<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eLT항공</title>
<!-- Swiper.js CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- Font Awesome CDN for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Flatpickr CSS (날짜 선택용) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }
    /* 기존 스타일 유지 */
    .main_content {
        display: none;
    }
    .air_service {
        position: relative;
        background-image: url('../static/resources/background.jpg');
        background-size: cover;
        width: 100%;
        height: 350px;
        background-repeat: no-repeat;
        z-index: 0;
    }
    .air_align {
        margin-left: 73px;
        margin-right: 73px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .air_contentbox {
        position: relative;
        top: -5.3rem;
        left: 0;
        width: 90%;
        height: 70%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        z-index: 2;
    }
    .air_widget {
        position: absolute;
        top: 7.4rem;
        display: block;
        width: 100%;
        height: 54px;
        content: "";
        z-index: 1;
        margin: auto;
    }
    .booking_widget_list {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        height: 55px;
        position: relative;
    }
    .booking_widget_list li {
        flex: 1;
        text-align: center;
        border: 1px solid #65728a;
        padding-block: 15px;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        margin: 0.5px;
        background-color: #65728a;
        z-index: 2;
    }
    .booking_widget_list li.active {
        background-color: white;
        border: 3px solid white;
    }
    .booking_widget_list li.active span {
        color: #65728a;
        font-weight: 900;
    }
    #booking_menu {
        display: inline-block;
    }
    .booking_widget_list button {
        width: 100%;
        height: 100%;
        background: none;
        border: none;
        font-size: 16px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .booking_widget_list button span {
        font-size: 16px;
        color: white;
        position: relative;
        top: -5px;
    }
    /* booking_contents의 기본 스타일 */
    .booking_contents {
        display: flex;
        flex-direction: column; /* 자식 요소들을 세로로 배치 */
        align-items: center;
        background-color: white;
        border: 1px solid #ccc;
        border-radius: 15px;
        width: 100%;
        height: 220px;
        padding-left: 40px;
        padding-top: 30px;
        padding-right: 40px;
        padding-bottom: 10px;
    }
    /* 예약 방법과 왕복/편도 선택 버튼을 한 줄에 나열 */
    .booking_methods {
        display: absolute;
        align-items: center;
        width: 100%;
        height: 170px;
    }
    .select_contents, .check-in_contents, .schedule_contents {
        position: relative;
        width: 100%;
        height: 220px;
        z-index: 3;
        background-color: white;
        border: 2px solid white;
        border-radius: 15px;
        margin-top: -10px;
        padding-left: 40px;
        padding-top: 30px;
        padding-right: 40px;
        padding-bottom: 10px;
        display: none;
    }
    .b_methodbox {
        float: left;
        width: auto;
        margin-top: 0;
        margin-right: 3.5rem;
        margin-bottom: 1rem;
        text-align: left;
    }
    /* 예매와 마일리지 예매 버튼 스타일 */
    .booking_types {
        display: flex;
        list-style-type: none;
        padding: 0;
        border: 1px solid #ccc;
        border-radius: 25px;
    }
    .booking_types li {
        display: inline-block;
        list-style: none;
    }
    .booking_types li button {
        padding: 10px 20px;
        border: none;
        border-radius: 25px;
        color: white;
        background-color: #65728a; /* 기본 배경색 */
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .booking_types li button.active {
        font-size: 16px;
        font-weight: bold;
        border-radius: 25px;
        background-color: #1f0c59;
        color: white;
        width: 80px;
        height: 40px;
    }
    .booking_types li button.inactive {
        font-size: 16px;
        background-color: white;
        color: #65728a;
        border: 1px solid #65728a;
        width: 140px;
        border-radius: 25px;
        height: 40px;
        border: none;
    }
    #quick_booking {
        display: flex;
        justify-content: space-between;
        align-items: center;
        align-self: flex-start;
        width: 270px;
        height: 80px;
    }
    .quick_booking_button {
        flex: 1;
        text-align: center;
        margin: 0 5px;
        padding: 10px;
        border: none;
        background-color: white;
        cursor: pointer;
        font-size: 16px;
        color: #333;
        border-radius: 15px;
    }
    .circle_button {
        flex-grow: 1;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        padding: 0px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .quick_booking_button:first-child {
        flex-grow: 2;
    }
    .quick_booking_button:last-child {
        flex-grow: 2;
    }
    .quick_booking_button:hover {
        background-color: #ddd;
    }
    #from-text, #departure-text {
        display: block;
        margin: 0;
    }
    #from-text, #to-text {
        font-size: 40px;
        font-weight: bold;
    }
    #departure-text, #arrival-text {
        font-size: 14px;
        color: #666;
    }
    .popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1000;
    }
    .popup-content {
        position: relative;
        margin: 15% auto;
        padding: 20px;
        width: 80%;
        max-width: 600px;
        background-color: #fff;
        border-radius: 5px;
    }
    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 24px;
        cursor: pointer;
    }
    .quick_booking_aligner {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 10px;
        width: 100%; 
        max-width: 1150px; 
        margin-left: -10px;
        margin-top: 55px;
    }   
    p {
        font-size: 14px;
        color: #333;
    }
    #date_selection button, #passenger_selection button, #seats_selection button {
        padding-top: 20px;
        padding-bottom: 5px;
        background-color: transparent;
        border: none;
        border-bottom: 1px solid #333;
        font-size: 16px;
        color: #333;
        cursor: pointer;
        text-align: left;
        outline: none;
    }
    #date_selection button {
        width: 310px;
    }
    #passenger_selection button {
        width: 150px;
    }
    #seats_selection button {
        width: 150px;
        padding-top: 20px;
        padding-bottom: 5px;
        background-color: transparent;
        border: none;
        border-bottom: 1px solid #333;
        font-size: 14px;
        color: #333;
        cursor: pointer;
        text-align: left;
        outline: none;
    }
    /* 좌석 선택 팝업 스타일 */
    .seat-popup {
        position: absolute;
        top: 100px;
        left: 50px;
        width: 400px;
        padding: 20px;
        background-color: white;
        border: 1px solid #ccc;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        z-index: 1000;
    }
    .seat-options {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }
    .seat-options button {
        flex: 1;
        margin: 5px;
        padding: 15px;
        cursor: pointer;
        background-color: white;
        border: 1px solid #ccc;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    .seat-options button:hover {
        background-color: #f0f0f0;
    }
    /* 추가된 섹션 스타일 */
    .fade-in-section {
        width: 1000px;
        max-width: 90%;
        margin: auto;
        padding: 50px 0;
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.6s ease-out, transform 0.6s ease-out;
    }
    .fade-in-section.visible {
        opacity: 1;
        transform: translateY(0);
    }
    .promotion-section {
        background-color: #fff;
        padding: 50px 0;
    }
    .promotion-container {
        width: 1000px;
        max-width: 90%;
        margin: auto;
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }
    .promotion-item {
        flex: 1 1 calc(33.333% - 20px);
        background-color: #eaeaea;
        border-radius: 10px;
        overflow: hidden;
        text-align: center;
    }
    .promotion-item img {
        width: 100%;
        height: auto;
    }
    .promotion-item h3 {
        margin: 15px 0;
    }
    .promotion-item p {
        padding: 0 15px 15px;
        color: #555;
    }
    .customer-review-section {
        background-color: #f9f9f9;
        padding: 50px 0;
    }
    .review-container {
        width: 1000px;
        max-width: 90%;
        margin: auto;
    }
    .review {
        background-color: #fff;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
    }
    .review h4 {
        margin-bottom: 10px;
    }
    .review p {
        color: #555;
    }
    .promotion-item:hover {
    	transform: translateY(-5px);
    	transition: transform 0.3s ease;
    }
    
</style>
<!-- jQuery 및 Flatpickr JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    // 페이지가 로드되면 실행될 함수
    document.addEventListener('DOMContentLoaded', function () {
        // 공항 목록을 불러오는 함수 호출
        loadAirports();


        // 기본 콘텐츠를 '항공권예매'로 설정
        showContent('booking');


        // activateMenu 함수 정의
        function activateMenu(event) {
            // 모든 li 요소에서 active 클래스 제거
            document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
                el.classList.remove('active');
            });

            // 클릭된 li 요소에 active 클래스 추가
            event.currentTarget.parentNode.classList.add('active');
        }

        // 버튼 클릭 시 activateMenu 함수 호출
        document.querySelectorAll('.booking_widget_list li button').forEach(function(button) {
            button.addEventListener('click', activateMenu);
        });

        // 예매 버튼 기본 선택 설정
        const reserveButton = document.querySelector('.booking_types li:first-child button');
        const mileageButton = document.querySelector('.booking_types li:nth-child(2) button');
        
        // 초기 상태 설정 (예매 버튼은 기본 선택, 마일리지 버튼은 비활성화)
        reserveButton.classList.add('active');
        mileageButton.classList.add('inactive');

        // 버튼 클릭 시 상태 변경 함수
        function toggleBookingType(event) {
            if (event.target === reserveButton) {
                reserveButton.classList.add('active');
                reserveButton.classList.remove('inactive');
                mileageButton.classList.add('inactive');
                mileageButton.classList.remove('active');
            } else if (event.target === mileageButton) {
                mileageButton.classList.add('active');
                mileageButton.classList.remove('inactive');
                reserveButton.classList.add('inactive');
                reserveButton.classList.remove('active');
            }
        }

        // 각 버튼에 클릭 이벤트 추가
        reserveButton.addEventListener('click', toggleBookingType);
        mileageButton.addEventListener('click', toggleBookingType);

        // Flatpickr 설정
        var tripMethod = "round"; // 기본값: 왕복
        var calendar = flatpickr("#date-btn", {
            mode: "range", // 두 날짜 선택을 위한 range 모드 (왕복일 때)
            dateFormat: "Y-m-d", // 날짜 형식
            showMonths: 2, // 두 달치 달력 표시
            onChange: function(selectedDates, dateStr, instance) {
                if (tripMethod === "round" && selectedDates.length === 2) {
                    // 왕복일 경우: 두 날짜가 선택되면 버튼에 표시
                    document.getElementById('date-btn').innerHTML = 
                        "가는 날: " + selectedDates[0].toLocaleDateString() + 
                        " - 오는 날: " + selectedDates[1].toLocaleDateString();
                } else if (tripMethod === "one-way" && selectedDates.length === 1) {
                    // 편도일 경우: 하루만 선택되면 버튼에 표시
                    document.getElementById('date-btn').innerHTML = 
                        "가는 날: " + selectedDates[0].toLocaleDateString();
                }
            }
        });

        // 왕복 또는 편도 선택 시 달력 모드 변경
        var tripMethods = document.querySelectorAll('input[name="t_methods"]');
        tripMethods.forEach(function (radio) {
            radio.addEventListener('change', function () {
                if (this.value === "round") {
                    tripMethod = "round";
                    calendar.set("mode", "range"); // 왕복일 때는 두 날짜 선택
                    document.getElementById('date-btn').innerHTML = "가는날 ~ 오는날"; // 텍스트 변경
                } else if (this.value === "one-way") {
                    tripMethod = "one-way";
                    calendar.set("mode", "single"); // 편도일 때는 한 날짜 선택
                    document.getElementById('date-btn').innerHTML = "가는날"; // 텍스트 변경
                }
            });
        });
    });

    function loadAirports() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/flights/airports'); // 서버에 GET 요청

        xhr.onload = function() {
            if (xhr.status === 200) {
                var data = JSON.parse(xhr.responseText); // JSON 데이터 파싱
                console.log(data); // 데이터 구조 확인
                var airportList = document.getElementById('airport-list');
                airportList.innerHTML = ''; // 기존 목록 비우기

                // 공항 목록을 HTML에 추가하기
               data.forEach(function(airport) {
            		var li = document.createElement('li');
            			li.textContent = airport.iata_code + '   ' + airport.city + ',' + airport.country;
            			li.onclick = function() {
                // 'From' 텍스트를 클릭된 공항 코드로 업데이트
                	document.getElementById('from-text').textContent = airport.iata_code;
                	document.getElementById('departure-text').textContent = airport.city;
                        // 팝업 닫기
                        closePopup('departure');
                    };

                    airportList.appendChild(li); // 리스트에 항목 추가
                });
            } else {
                console.error('Failed to load airports. Status:', xhr.status);
            }
        };

        xhr.onerror = function() {
            console.error('Network error while trying to load airports.');
        };

        xhr.send(); // 요청 전송
    }



    function showContent(type) {
        // 모든 콘텐츠 숨기기
        document.querySelectorAll('.booking_contents, .select_contents, .check-in_contents, .schedule_contents').forEach(function(el) {
            el.style.display = 'none';
        });

        // 선택된 콘텐츠만 표시하기
        if (type === 'booking') {
            document.querySelector('.booking_contents').style.display = 'block';
        } else if (type === 'select') {
            document.querySelector('.select_contents').style.display = 'block';
        } else if (type === 'check-in') {
            document.querySelector('.check-in_contents').style.display = 'block';
        } else if (type === 'schedule') {
            document.querySelector('.schedule_contents').style.display = 'block';
        }
    }

    function openPopup(type) {
        if (type === 'departure') {
            document.getElementById('departure-popup').style.display = 'block';  // 출발지 팝업
        } else if (type === 'arrival') {
            document.getElementById('arrival-popup').style.display = 'block';  // 도착지 팝업
        }
        else if (type === 'passenger') {
            document.getElementById('passenger-selection-popup').style.display = 'block';  // 탑승객 팝업
        }
    }

    function closePopup(type) {
        if (type === 'departure') {
            document.getElementById('departure-popup').style.display = 'none';  // 출발지 팝업 닫기
        } else if (type === 'arrival') {
            document.getElementById('arrival-popup').style.display = 'none';  // 도착지 팝업 닫기
        } else if (type === 'passenger') {
            document.getElementById('passenger-selection-popup').style.display = 'none';  // 탑승객 팝업 닫기
        }
    }

    function setLocation(type) {
        const value = document.getElementById(type + '-input').value;
        if (type === 'departure') {
            document.getElementById('departure-text').textContent = value;
        } else if (type === 'arrival') {
            document.getElementById('arrival-text').textContent = value;
        }
        closePopup(type); // 선택 후 팝업 닫기
    }

    function increase(type) {
        var adultCount = parseInt(document.getElementById('adult-count').textContent);
        var childCount = parseInt(document.getElementById('child-count').textContent);
        var infantCount = parseInt(document.getElementById('infant-count').textContent);

        var totalPassengers = adultCount + childCount; // 성인과 소아 합산

        if (type === 'adult' && totalPassengers < 10) {
            document.getElementById('adult-count').textContent = adultCount + 1;
        } else if (type === 'child' && totalPassengers < 10) {
            document.getElementById('child-count').textContent = childCount + 1;
        } else if (type === 'infant') {
            // 유아는 성인 숫자만큼만 선택 가능
            if (infantCount < adultCount) {
                document.getElementById('infant-count').textContent = infantCount + 1;
            }
        }
    }

    function decrease(type) {
        var adultCount = parseInt(document.getElementById('adult-count').textContent);
        var childCount = parseInt(document.getElementById('child-count').textContent);
        var infantCount = parseInt(document.getElementById('infant-count').textContent);

        if (type === 'adult' && adultCount > 0) {
            document.getElementById('adult-count').textContent = adultCount - 1;
            if (infantCount > adultCount - 1) {
                document.getElementById('infant-count').textContent = adultCount - 1; // 성인이 줄면 유아도 함께 줄어야 함
            }
        } else if (type === 'child' && childCount > 0) {
            document.getElementById('child-count').textContent = childCount - 1;
        } else if (type === 'infant' && infantCount > 0) {
            // 성인 숫자가 0명일 때 유아는 0명으로 고정
            if (adultCount > 0) {
                document.getElementById('infant-count').textContent = infantCount - 1;
            }
        }
    }

    function confirmPassengers() {
        var adultCount = document.getElementById('adult-count').textContent;
        var childCount = document.getElementById('child-count').textContent;
        var infantCount = document.getElementById('infant-count').textContent;

        var passengerText = '';

        // 성인 정보 추가
        if (adultCount > 0) {
            passengerText = '성인 ' + adultCount + '명';
        }

        // 추가 승객 분류 (소아 및 유아)를 배열에 저장
        var additionalPassengers = [];

        if (childCount > 0) {
            additionalPassengers.push('소아');
        }
        if (infantCount > 0) {
            additionalPassengers.push('유아');
        }

        // 추가 승객이 있는 경우 처리
        if (additionalPassengers.length > 0) {
            if (additionalPassengers.length === 1) {
                // 추가 승객이 한 종류일 경우에도 말줄임표 붙이기
                passengerText += ', ' + additionalPassengers[0] + '···';
            } else {
                // 추가 승객이 두 종류일 경우, 첫 번째 분류만 이름만 표시하고 말줄임표 붙이기
                passengerText += ', ' + additionalPassengers[0] + '···';
            }
        }

        document.getElementById('passenger-btn').innerHTML = passengerText;

        closePopup('passenger'); // 팝업 닫기
    }

    document.addEventListener('DOMContentLoaded', function () {
        const seatSelectBtn = document.getElementById('seats-btn');
        const seatPopup = document.getElementById('seat-popup');

        // 좌석 등급 버튼을 클릭하면 팝업 표시/숨김
        seatSelectBtn.addEventListener('click', function(event) {
            event.stopPropagation(); // 이벤트 버블링 방지 (외부 클릭 이벤트에 영향 받지 않도록)
            seatPopup.style.display = seatPopup.style.display === 'block' ? 'none' : 'block';
        });

        // 좌석 선택 시 팝업을 닫음
        window.selectSeat = function(seatType) {
            document.querySelector('#seats-btn span').innerText = seatType;
            seatPopup.style.display = 'none';  // 좌석 선택 시 팝업 닫기
        }

        // 팝업 외부를 클릭하면 팝업 닫기
        document.addEventListener('click', function(event) {
            if (seatPopup.style.display === 'block' && !seatPopup.contains(event.target) && event.target !== seatSelectBtn) {
                seatPopup.style.display = 'none'; // 팝업 외부 클릭 시 팝업 닫기
            }
        });
    });

    // 섹션들이 뷰포트에 들어오면 'visible' 클래스를 추가하는 함수
    function revealSections() {
        const sections = document.querySelectorAll('.fade-in-section');
        const windowHeight = window.innerHeight;
        sections.forEach(section => {
            const sectionTop = section.getBoundingClientRect().top;
            if (sectionTop < windowHeight - 100) {
                section.classList.add('visible');
            }
        });
    }

    window.addEventListener('scroll', revealSections);
    window.addEventListener('load', revealSections);

    // jQuery 코드 유지
    $(function() {
        var currentURL = window.location.pathname;
        var referrerURL = document.referrer ? (new URL(document.referrer)).pathname : '';
        
        function isIndex(url) {
            // 확장자가 포함된 경우도 처리
            return url === '/' || url.endsWith('/index') || url.endsWith('/index.html') || url.endsWith('/index.php');
        }
        
        if (isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
            // 처음 인덱스가 열릴 때: 슬라이드 다운 실행
            $('.main_content').slideDown(1000);
        } else if (!isIndex(currentURL) && isIndex(referrerURL)) {
            // 인덱스에서 다른 페이지로 이동할 때: 슬라이드 업 실행
            $('.main_content').slideUp(500);
        } else if (!isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
            // 인덱스가 아닌 다른 페이지들 간 이동: 메인 컨텐츠 상태 변경 없음
            // 아무 작업도 하지 않음
        } else {
            // 그 외의 경우: 메인 컨텐츠 표시
            $('.main_content').show();
        }
    });
</script>
</head>
<body>
    <div class="main_content">
        <div class="air_service"> 
            <div class="air_align">
                <div class="air_contentbox"> 
                    <div id="air_alert"></div>
                    <div class="air_widget">
                        <ul class="booking_widget_list">
                            <li class="booking_menu"> 
                                <button type="button" onclick="showContent('booking')">
                                    <span> 항공권예매 </span> 
                                </button>
                            </li>
                            <li class="booking_menu"> 
                                <button type="button" onclick="showContent('select')">
                                    <span> 예약조회 </span>
                                </button>
                            </li>
                            <li class="booking_menu">
                                <button type="button" onclick="showContent('check-in')">
                                    <span> 체크인 </span>
                                </button>
                            </li>
                            <li class="booking_menu"> 
                                <button type="button" onclick="showContent('schedule')">
                                    <span> 출도착/스케쥴 </span>
                                </button>
                            </li>
                        </ul>
                        <div class="booking_contents">
                            <div class="booking_methods">
                                <div class="b_methodbox"> 
                                    <ul class="booking_types"> 
                                        <li>
                                            <button type="button">예매</button>
                                        </li>
                                        <li>
                                            <button type="button">마일리지 예매</button>
                                        </li>
                                    </ul>
                                </div>
                                <!-- 왕복/편도 선택 버튼 -->
                                <div id="trip-methods">
                                    <input type="radio" name="t_methods" value="round" id="round-trip" checked> 
                                    <label for="round-trip">왕복</label>
                                    <input type="radio" name="t_methods" value="one-way" id="one-way"> 
                                    <label for="one-way">편도</label>
                                </div>
                                <div class="quick_booking_aligner">     
                                    <div id="quick_booking">
                                        <!-- 출발지 버튼 -->
                                        <button type="button" class="quick_booking_button" onclick="openPopup('departure')">
                                            <span id="from-text">From</span>
                                            <span id="departure-text">&nbsp;출발지</span>
                                        </button>
                                        <button type="button" class="quick_booking_button circle_button">
                                            <img src="../static/resources/booking_reverse.png" width="40px" height="40px">
                                        </button>
                                        <!-- 도착지 버튼 -->
                                        <button type="button" class="quick_booking_button" onclick="openPopup('arrival')">
                                            <span id="to-text">To</span>
                                            <span id="arrival-text">&nbsp;도착지</span>
                                        </button>
                                    </div>
                                    <!-- 출발지 div 팝업 -->
                                    <div id="departure-popup" class="popup">
                                        <div class="popup-content">
                                        	<span class="close-btn" onclick="closePopup('departure')">&times;</span>
                                            <h2>출발지 검색</h2>
                                            <input type="text" id="departure-input" placeholder="출발지 입력" onkeyup="autocomplete('departure')">
                                            <ul id="airport-list"></ul> <!-- 공항 목록이 표시될 리스트 -->
                                            <button onclick="setLocation('departure')">선택</button> <!-- 선택 버튼 -->
                                        </div>
                                    </div>
                                    <!-- 도착지 팝업 -->
                                    <div id="arrival-popup" class="popup">
                                        <div class="popup-content">
                                            <span class="close-btn" onclick="closePopup('arrival')">&times;</span>
                                            <h2>도착지 검색</h2>
                                            <input type="text" id="arrival-input" placeholder="도착지 입력" onkeyup="autocomplete('arrival')">
                                            <ul id="arrival-list"></ul>
                                            <button onclick="setLocation('arrival')">선택</button> <!-- 선택 버튼 -->
                                        </div>
                                    </div>
                                    <!-- 날짜 선택 버튼 -->
                                    <div id="date_selection">
                                        <p>출발일&nbsp;</p>
                                        <button type="button" id="date-btn"><span>가는날 ~ 오는날</span></button>
                                    </div>
                                    <!-- 탑승객 선택 버튼 -->
                                    <div id="passenger_selection">
                                        <p>탑승객&nbsp;</p>
                                        <button type="button" id="passenger-btn" onclick="openPopup('passenger')"><span>인원수</span></button>
                                    </div>
                                    <!-- 승객 선택 팝업 -->
                                    <div id="passenger-selection-popup" class="popup">
                                        <div class="popup-content">
                                            <span class="close-btn" onclick="closePopup('passenger')">&times;</span>
                                            <h2>승객 선택</h2>
                                            <div class="passenger-counter">
                                                <div class="passenger-type">
                                                    <p>성인</p>
                                                    <button class="decrease-btn" onclick="decrease('adult')">-</button>
                                                    <span id="adult-count">1</span>
                                                    <button class="increase-btn" onclick="increase('adult')">+</button>
                                                </div>
                                                <div class="passenger-type">
                                                    <p>소아</p>
                                                    <button class="decrease-btn" onclick="decrease('child')">-</button>
                                                    <span id="child-count">0</span>
                                                    <button class="increase-btn" onclick="increase('child')">+</button>
                                                </div>
                                                <div class="passenger-type">
                                                    <p>유아</p>
                                                    <button class="decrease-btn" onclick="decrease('infant')">-</button>
                                                    <span id="infant-count">0</span>
                                                    <button class="increase-btn" onclick="increase('infant')">+</button>
                                                </div>
                                            </div>
                                            <button type="button" onclick="confirmPassengers()">선택 완료</button>
                                        </div>
                                    </div>
                                    <!-- 좌석등급 선택 버튼 -->
                                    <div id="seats_selection">
                                        <p>좌석등급&nbsp;</p>
                                        <button type="button" id="seats-btn"><span>선택하세요</span></button>
                                    </div>
                                    <!-- 좌석 등급 DIV -->
                                    <div id="seat-popup" class="seat-popup" style="display: none;">
                                        <h2>좌석 등급 선택</h2>
                                        <div class="seat-options">
                                            <button onclick="selectSeat('일반석')">일반석</button>
                                            <button onclick="selectSeat('프레스티지석')">프레스티지석</button>
                                            <button onclick="selectSeat('일등석')">일등석</button>
                                        </div>
                                    </div>
                                    <!-- 항공편 선택 버튼 -->
                                    <div id="search_airline">
                                        <a href="/flight/flightSearchResults">
                                            <button type="button" id="search_button"><span>항공편 검색</span></button>
                                        </a>
                                    </div>
                                </div>
                            </div>     
                        </div>     
                        <div class="select_contents">
                            <!-- 예약조회 콘텐츠 -->
                        </div>
                        <div class="check-in_contents">
                            <!-- 체크인 콘텐츠 -->
                        </div>
                        <div class="schedule_contents">
                            <!-- 출도착/스케줄 콘텐츠 -->
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
    <!-- sec2: 프로모션 -->
    <section id="sec2" class="sec2 promotion-section fade-in-section">
        <h2 style="text-align: center;">특가 프로모션</h2>
        <div class="promotion-container">
            <div class="promotion-item">
                <img src="../static/resources/promotion1.jpeg" alt="프로모션 1">
                <h3>여름 휴가 특가</h3>
                <p>올여름 휴가를 위한 특별한 할인 항공권을 만나보세요!</p>
            </div>
            <div class="promotion-item">
                <img src="../static/resources/promotion2.jpeg" alt="프로모션 2">
                <h3>가족 여행 패키지</h3>
                <p>가족과 함께하는 여행을 위한 최적의 패키지를 제공합니다.</p>
            </div>
            <div class="promotion-item">
                <img src="../static/resources/promotion3_1.jpeg" alt="프로모션 3">
                <h3>얼리버드 할인</h3>
                <p>미리 예약하고 더 큰 혜택을 누리세요!</p>
            </div>
        </div>
    </section>
    <!-- sec3: 후기 -->
    <section id="sec3" class="sec3 customer-review-section fade-in-section">
        <h2 style="text-align: center;">고객 후기</h2>
        <div class="review-container">
            <div class="review">
                <h4>김철수 님</h4>
                <p>eLT항공과 함께한 여행은 정말 편안하고 즐거웠습니다. 서비스가 훌륭해요!</p>
            </div>
            <div class="review">
                <h4>이영희 님</h4>
                <p>합리적인 가격에 최고의 서비스를 제공하는 항공사입니다. 다음에도 이용할 예정입니다.</p>
            </div>
            <div class="review">
                <h4>박민수 님</h4>
                <p>직원들이 친절하고 기내식도 맛있었어요. 가족 모두 만족했습니다.</p>
            </div>
        </div>
    </section>
</body>
</html>
