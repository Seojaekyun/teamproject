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
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }
    section {
        width: 1000px;
        max-width: 90%;
        margin: auto;
        padding: 50px 0;
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.6s ease-out, transform 0.6s ease-out;
    }
    section.visible {
        opacity: 1;
        transform: translateY(0);
    }
    .home-banner {
        width: 100%;
        margin: auto;
        padding-bottom: 100px;
        padding-top: 100px;
        position: relative;
        background: url('banner-image.jpg') no-repeat center center;
        background-size: cover;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .search-box {
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background-color: rgba(255, 255, 255, 0.9);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .search-box h3 {
        text-align: center;
        margin-bottom: 20px;
    }
    .search-box div {
        margin-bottom: 10px;
    }
    .search-box label {
        display: block;
        margin-bottom: 5px;
        font-size: 14px;
    }
    .search-box input, .search-box select {
        width: 100%;
        padding: 8px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .search-box button {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }
    .search-box button:hover {
        background-color: #45a049;
        transform: translateY(-2px);
    }
    .sec2 {
        background: #E0F2F1;
        margin: auto;
    }
    .sec2 h2 {
        text-align: center;
        margin-bottom: 40px;
        color: #00796B;
    }
    .sec2 .features {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .sec2 .feature {
        width: 30%;
        background: white;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .sec2 .feature:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .sec2 .feature i {
        font-size: 40px;
        color: #00796B;
        margin-bottom: 15px;
    }
    .sec2 .feature h4 {
        margin-bottom: 10px;
        color: #004D40;
    }
    .sec2 .feature p {
        font-size: 14px;
        color: #555;
    }
    .sec3 {
        background: #EDE7F6;
        margin: auto;
        overflow: hidden; /* 오버플로우 숨김 추가 */
    }
    .sec3 h2 {
        text-align: center;
        margin-bottom: 40px;
        color: #5E35B1;
    }
    .sec3 .testimonials {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .sec3 .testimonial {
        width: 100%;
        background: white;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .sec3 .testimonial:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .sec3 .testimonial p {
        font-style: italic;
        margin-bottom: 10px;
        color: #333;
    }
    .sec3 .testimonial .author {
        text-align: right;
        font-weight: bold;
        color: #5E35B1;
    }
    .sec4 {
        background: #FFF3E0;
        margin: auto;
    }
    .sec4 h2 {
        text-align: center;
        margin-bottom: 40px;
        color: #F57C00;
    }
    .sec4 .promotions {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .sec4 .promotion {
        width: 100%;
        background: white;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .sec4 .promotion:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .sec4 .promotion img {
        width: 80px;
        height: 80px;
        margin-bottom: 15px;
    }
    .sec4 .promotion h4 {
        margin-bottom: 10px;
        color: #E65100;
    }
    .sec4 .promotion p {
        font-size: 14px;
        color: #555;
    }
    .footer {
        background: #333;
        color: white;
        text-align: center;
        padding: 20px 0;
    }
    .footer a {
        color: #4CAF50;
        text-decoration: none;
    }
    @media (max-width: 768px) {
        .sec2 .features, .sec3 .testimonials, .sec4 .promotions {
            flex-direction: column;
            align-items: center;
        }
        .sec2 .feature, .sec3 .testimonial, .sec4 .promotion {
            width: 100%;
        }
        section {
            width: 95%;
            padding: 30px 0;
        }
        .search-box {
            width: 90%;
        }
    }
    /* Swiper Custom Styles */
    .swiper-container {
        width: 100%;
        padding: 20px 0;
    }
    .swiper-slide {
        background: white;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .swiper-slide p {
        font-style: italic;
        color: #333;
    }
    .swiper-slide .author {
        text-align: right;
        font-weight: bold;
        color: #5E35B1;
    }
    .swiper-pagination-bullet-active {
        background: #5E35B1 !important;
    }
    .main_content {
        display: none;
    }
    .air_service {
        position: relative;
        background-image: url('../static/resources/background.jpg');
        background-size: cover;
        width: 100%;
        height: 450px;
        background-repeat: no-repeat;
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
    .booking_contents, .select_contents, .check-in_contents, .schedule_contents {
        position: relative;
        width: 100%;
        height: 220px;
        z-index: 3;
        background-color: white;
        border: 2px solid white;
        border-radius: 15px;
        margin-top: -10px;
        padding: 30px 40px 10px 40px;
        display: none;
    }
    .booking_contents {
        display: block;
    }
    .b_methodbox {
        float: left;
        width: auto;
        margin-top: 0;
        margin-right: 3.5rem;
        margin-bottom: 1rem;
        text-align: left;
    }
    .booking_types {
        border: 1px solid black;
        border-radius: 25px;
    }
    .booking_types li {
        display: inline-block;
        list-style-type: none;
    }
    .booking_types li button {
        font-size: 17px;
        padding: 10px 20px;
        border: none;
        border-radius: 23px;
        color: white;
        background-color: #65728a;
        cursor: pointer;
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
    .quick_booking_button:first-child, .quick_booking_button:last-child {
        flex-grow: 2;
    }
    .quick_booking_button:hover {
        background-color: #ddd;
    }
    #from-text, #departure-text, #to-text, #arrival-text {
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
        width: 1000px;
        margin-left: -10px;
        margin-top: 45px;
    }
    p {
        font-size: 13px;
        color: #333;
    }
    #date_selection button, #passenger_selection button, #seats_selection button {
        width: 130px;
        padding: 20px 0 5px;
        background-color: transparent;
        border: none;
        border-bottom: 1px solid #333;
        font-size: 14px;
        color: #333;
        cursor: pointer;
        text-align: left;
        outline: none;
    }
    #date_selection button {
        width: 300px;
    }
    /* 인원 선택 팝업 스타일 */
    #passenger-selection-popup .passenger-counter {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    .passenger-type {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .passenger-type p {
        margin: 0;
        width: 50px;
    }
    .passenger-type button {
        width: 30px;
        height: 30px;
        font-size: 20px;
        border: 1px solid #ccc;
        background-color: #fff;
        cursor: pointer;
    }
    .passenger-type span {
        width: 20px;
        text-align: center;
    }
    /* 슬라이드 애니메이션 추가 */
    @keyframes slideDown {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    @keyframes slideUp {
        from { opacity: 1; transform: translateY(0); }
        to { opacity: 0; transform: translateY(-20px); }
    }
</style>
<!-- Swiper.js JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- flatpickr JS (중복 제거) -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- jQuery CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 기존 함수들 유지
    function showContent(type) {
        document.querySelectorAll('.booking_contents, .select_contents, .check-in_contents, .schedule_contents').forEach(function(el) {
            el.style.display = 'none';
        });
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
    window.onload = function() {
        document.getElementById('from-text').textContent = 'ICN';
        document.getElementById('departure-text').textContent = '인천';
        showContent('booking');
    };
    document.addEventListener('DOMContentLoaded', function() {
        function activateMenu(event) {
            document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
                el.classList.remove('active');
            });
            event.currentTarget.parentNode.classList.add('active');
        }
        document.querySelectorAll('.booking_widget_list li button').forEach(function(button) {
            button.addEventListener('click', activateMenu);
        });

        // Swiper 초기화
        var testimonialsSwiper = new Swiper('.testimonials-swiper', {
            loop: true,
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.testimonials-swiper .swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.testimonials-swiper .swiper-button-next',
                prevEl: '.testimonials-swiper .swiper-button-prev',
            },
        });
        var promotionsSwiper = new Swiper('.promotions-swiper', {
            loop: true,
            autoplay: {
                delay: 7000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.promotions-swiper .swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.promotions-swiper .swiper-button-next',
                prevEl: '.promotions-swiper .swiper-button-prev',
            },
            slidesPerView: 1,
            spaceBetween: 20,
            breakpoints: {
                640: {
                    slidesPerView: 2,
                },
                1024: {
                    slidesPerView: 3,
                },
            },
        });

        // Intersection Observer for Fade-in Animation
        const sections = document.querySelectorAll('section');
        const options = {
            threshold: 0.1
        };
        const observer = new IntersectionObserver(function(entries, observer) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, options);
        sections.forEach(section => {
            observer.observe(section);
        });
    });
    function openPopup(type) {
        if (type === 'departure') {
            document.getElementById('popup').style.display = 'block';
        } else if (type === 'arrival') {
            document.getElementById('arrival-popup').style.display = 'block';
        }
    }
    function closePopup(type) {
        if (type === 'departure') {
            document.getElementById('popup').style.display = 'none';
        } else if (type === 'arrival') {
            document.getElementById('arrival-popup').style.display = 'none';
        }
    }
    function autocomplete(type) {
        var input, list, airports;
        if (type === 'departure') {
            input = document.getElementById('departure-input').value;
            list = document.getElementById('departure-list');
            airports = [
                { city: "오사카", code: "KIX" },
                { city: "인천", code: "ICN" },
                { city: "도쿄", code: "NRT" },
                { city: "부산", code: "PUS" }
            ];
        } else if (type === 'arrival') {
            input = document.getElementById('arrival-input').value;
            list = document.getElementById('arrival-list');
            airports = [
                { city: "도쿄", code: "NRT" },
                { city: "부산", code: "PUS" },
                { city: "인천", code: "ICN" },
                { city: "오사카", code: "KIX" }
            ];
        }
        if (input.trim() === '') {
            list.style.display = 'none';
            return;
        }
        list.innerHTML = '';
        var matches = airports.filter(function(airport) {
            return airport.city.toLowerCase().includes(input.toLowerCase()) || airport.code.toLowerCase().includes(input.toLowerCase());
        });
        if (matches.length > 0) {
            matches.forEach(function(match) {
                var listItem = document.createElement('li');
                listItem.textContent = match.city + ' ' + match.code;
                listItem.onclick = function() {
                    if (type === 'departure') {
                        document.getElementById('from-text').textContent = match.code;
                        document.getElementById('departure-text').textContent = match.city;
                    } else if (type === 'arrival') {
                        document.getElementById('to-text').textContent = match.code;
                        document.getElementById('arrival-text').textContent = match.city;
                    }
                    list.style.display = 'none';
                    closePopup(type);
                };
                list.appendChild(listItem);
            });
            list.style.display = 'block';
        } else {
            list.style.display = 'none';
        }
    }
    function setLocation(type) {
        var input, matchedAirport, textElement, codeElement, airports;
        if (type === 'departure') {
            input = document.getElementById('departure-input').value;
            textElement = document.getElementById('departure-text');
            codeElement = document.getElementById('from-text');
            airports = [
                { city: "오사카", code: "KIX" },
                { city: "인천", code: "ICN" },
                { city: "도쿄", code: "NRT" },
                { city: "부산", code: "PUS" }
            ];
        } else if (type === 'arrival') {
            input = document.getElementById('arrival-input').value;
            textElement = document.getElementById('arrival-text');
            codeElement = document.getElementById('to-text');
            airports = [
                { city: "도쿄", code: "NRT" },
                { city: "부산", code: "PUS" },
                { city: "인천", code: "ICN" },
                { city: "오사카", code: "KIX" }
            ];
        }
        matchedAirport = airports.find(function(airport) {
            return airport.city.toLowerCase() === input.toLowerCase() || airport.code.toLowerCase() === input.toLowerCase();
        });
        if (matchedAirport) {
            codeElement.textContent = matchedAirport.code;
            textElement.textContent = matchedAirport.city;
        } else {
            alert("유효한 " + (type === 'departure' ? '출발지' : '도착지') + "를 선택해주세요.");
        }
        closePopup(type);
    }
    document.addEventListener('DOMContentLoaded', function() {
        var tripMethod = "round";
        var calendar = flatpickr("#date-btn", {
            mode: "range",
            dateFormat: "Y-m-d",
            showMonths: 2,
            onChange: function(selectedDates) {
                if (tripMethod === "round" && selectedDates.length === 2) {
                    document.getElementById('date-btn').innerHTML = "가는 날: " + selectedDates[0].toLocaleDateString() + " - 오는 날: " + selectedDates[1].toLocaleDateString();
                } else if (tripMethod === "one-way" && selectedDates.length === 1) {
                    document.getElementById('date-btn').innerHTML = "가는 날: " + selectedDates[0].toLocaleDateString();
                }
            }
        });
        var tripMethods = document.querySelectorAll('input[name="t_methods"]');
        tripMethods.forEach(function(radio) {
            radio.addEventListener('change', function() {
                if (this.value === "round") {
                    tripMethod = "round";
                    calendar.set("mode", "range");
                    document.getElementById('date-btn').innerHTML = "가는날 ~ 오는날";
                } else if (this.value === "one-way") {
                    tripMethod = "one-way";
                    calendar.set("mode", "single");
                    document.getElementById('date-btn').innerHTML = "가는날";
                }
            });
        });
    });
    // 인원 선택 팝업 열기
    function openPassengerPopup() {
        document.getElementById('passenger-selection-popup').style.display = 'block';
    }
    // 인원 선택 팝업 닫기
    function closePassengerPopup() {
        document.getElementById('passenger-selection-popup').style.display = 'none';
    }
    // 인원 수 증가 함수
    function increase(type) {
        var countElement = document.getElementById(type + '-count');
        var count = parseInt(countElement.textContent);
        countElement.textContent = count + 1;
    }
    // 인원 수 감소 함수
    function decrease(type) {
        var countElement = document.getElementById(type + '-count');
        var count = parseInt(countElement.textContent);
        if (count > 0) {
            countElement.textContent = count - 1;
        }
    }
    // 인원 선택 완료 함수
    function confirmPassengers() {
        var adultCount = document.getElementById('adult-count').textContent;
        var childCount = document.getElementById('child-count').textContent;
        var infantCount = document.getElementById('infant-count').textContent;
        var totalPassengers = "성인 " + adultCount + "명, 소아 " + childCount + "명, 유아 " + infantCount + "명";
        document.getElementById('passenger-btn').innerHTML = totalPassengers;
        closePassengerPopup();
    }
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
                                <div id="trip-methods">
                                    <input type="radio" name="t_methods" value="round" id="round-trip" checked>
                                    <label for="round-trip">왕복</label>
                                    <input type="radio" name="t_methods" value="one-way" id="one-way">
                                    <label for="one-way">편도</label>
                                </div>
                                <div class="quick_booking_aligner">
                                    <div id="quick_booking">
                                        <button type="button" class="quick_booking_button" onclick="openPopup('departure')">
                                            <span id="from-text">From</span>
                                            <span id="departure-text">&nbsp;출발지</span>
                                        </button>
                                        <button type="button" class="quick_booking_button circle_button">
                                            <img src="../static/resources/booking_reverse.png" width="40px" height="40px" alt="Reverse">
                                        </button>
                                        <button type="button" class="quick_booking_button" onclick="openPopup('arrival')">
                                            <span id="to-text">To</span>
                                            <span id="arrival-text">&nbsp;도착지</span>
                                        </button>
                                    </div>
                                    <!-- 출발지 팝업 -->
                                    <div id="popup" class="popup">
                                        <div class="popup-content">
                                            <span class="close-btn" onclick="closePopup('departure')">&times;</span>
                                            <h2>출발지 검색</h2>
                                            <input type="text" id="departure-input" placeholder="출발지 입력" onkeyup="autocomplete('departure')">
                                            <ul id="departure-list" style="list-style: none; padding: 0;"></ul>
                                        </div>
                                    </div>
                                    <!-- 도착지 팝업 -->
                                    <div id="arrival-popup" class="popup">
                                        <div class="popup-content">
                                            <span class="close-btn" onclick="closePopup('arrival')">&times;</span>
                                            <h2>도착지 검색</h2>
                                            <input type="text" id="arrival-input" placeholder="도착지 입력" onkeyup="autocomplete('arrival')">
                                            <ul id="arrival-list" style="list-style: none; padding: 0;"></ul>
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
                                        <button type="button" id="passenger-btn" onclick="openPassengerPopup()"><span>인원수</span></button>
                                    </div>
                                    <!-- 승객 선택 팝업 -->
                                    <div id="passenger-selection-popup" class="popup">
                                        <div class="popup-content">
                                            <span class="close-btn" onclick="closePassengerPopup()">&times;</span>
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
                                    <!-- 항공편 검색 버튼 -->
                                    <div id="search_airline">
                                        <button type="button" id="search-btn"><span>항공편 검색</span></button>
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
    <!-- sec3: 고객 후기 -->
    <section id="sec3" class="sec3">
        <h2>고객 후기</h2>
        <!-- Swiper -->
        <div class="swiper-container testimonials-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide testimonial">
                    <p>"항상 만족스러운 서비스와 편안한 비행 경험을 제공합니다."</p>
                    <div class="author">- 김민수</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"친절한 직원들과 깨끗한 기내가 인상적이었습니다."</p>
                    <div class="author">- 이지은</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"온라인 예약이 정말 쉬웠고, 비행기 시간도 정확했습니다."</p>
                    <div class="author">- 박준영</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"특별한 프로모션 덕분에 저렴하게 항공권을 구매할 수 있었습니다."</p>
                    <div class="author">- 최은지</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"항공사 직원들의 세심한 배려가 인상적이었습니다. 다시 이용하고 싶어요."</p>
                    <div class="author">- 송지훈</div>
                </div>
                <div class="swiper-slide testimonial">
                    <p>"비행기 내 엔터테인먼트 시스템이 훌륭해서 긴 비행도 지루하지 않았습니다."</p>
                    <div class="author">- 한지민</div>
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Navigation -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </section>
    <!-- sec4: 특별 프로모션 -->
    <section id="sec4" class="sec4">
        <h2>특별 프로모션</h2>
        <!-- Swiper -->
        <div class="swiper-container promotions-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide promotion">
                    <img src="promo1.png" alt="봄맞이 할인">
                    <h4>봄맞이 할인</h4>
                    <p>봄철 여행을 위한 특별 할인 항공권을 만나보세요!</p>
                </div>
                <div class="swiper-slide promotion">
                    <img src="promo2.png" alt="가족 여행 패키지">
                    <h4>가족 여행 패키지</h4>
                    <p>가족과 함께하는 편안한 여행을 위한 패키지 상품.</p>
                </div>
                <div class="swiper-slide promotion">
                    <img src="promo3.png" alt="조기 예약 혜택">
                    <h4>조기 예약 혜택</h4>
                    <p>조기 예약 시 추가 할인 및 혜택을 제공합니다.</p>
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
            <!-- Add Navigation -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </section>
    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 항공사. 모든 권리 보유.</p>
        <p>
            <a href="#">개인정보 처리방침</a> |
            <a href="#">이용 약관</a> |
            <a href="#">고객 지원</a>
        </p>
    </footer>
</body>
</html>