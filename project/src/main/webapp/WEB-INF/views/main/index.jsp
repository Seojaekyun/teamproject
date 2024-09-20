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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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
	height: 500px;
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
	top: 5.3rm;
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
position: relative;
    top: 7.4rem;
    display: block;
    width: 100%;
    height: 54px;
    content: "";
    z-index: 1;
    margin: auto;
    left: 9%;
}
.booking_widget_list {
	list-style-type: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 80%;
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
	width: 80%;
	height: 235px;
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
	width: 80%;
	height: 235px;
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
.booking_types {
    list-style-type: none; /* 리스트 스타일 제거 */
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: space-between;
    border: 1px solid #ccc; /* 경계선 추가 */
    border-radius: 25px;
}
.booking_types li {
    flex: 1;
    text-align: center;
}
/* 기본 스타일 */
#general, #mileage {
	padding: 10px 20px;
    background-color: white;
    color: #1f0c59;
    border: 1px solid #ccc;
    cursor: pointer;
    border-radius: 25px;
    list-style-type: none;
    transition: background-color 0.3s, color 0.3s;
    font-size:16px;
    border:none;
}
#general{
 width: 75px;
}
#mileage{
width: 145px;}

 
#general:hover, #mileage:hover {
    text-decoration: underline; /* hover 시 밑줄 추가 */
    text-decoration-color: #1f0c59; /* 밑줄 색을 글씨색과 동일하게 설정 */
}
.active-button  {
	background-color: #1f0c59 !important; /* 파란색 배경 */
    color: white !important; /* 하얀색 글씨 */
    padding: 10px 20px !important; /* 좌우 패딩 */
    border-radius: 25px !important; /* 모서리 둥글게 */
    border: 1px solid #1f0c59 !important; /* 기본 테두리 제거 */
    font-size: 16px !important;
    font-weight: bold !important;
    cursor: pointer !important;
}
.active-button:hover {
    text-decoration: underline !important; /* 기본적으로 밑줄 없음 */
    text-decoration-color: white !important;}
    
.inner {
    position: absolute;
    transform: translateY(40%); /* 수직 중앙 정렬 보정 */ 
    left: 9px;
    top: -5px;
    opacity: 0.6;
    background:#fff;
    z-index:1;
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
/* 출/도착지 팝업 스타일 */
.popup {
	position: absolute;
	top: 300px;
	left: 0%; /* 원하는 위치로 변경 가능 */
	width: 740px;
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	z-index:1000;
	list-style:none;
}
.airport-list {height:270px; overflow-y:auto;}

.close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 24px;
	cursor: pointer;
}
.quick_booking_aligner {
	/*display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 5px;
	width: 1200px;
	max-width: 1300px;
	margin-left: -10px;
	margin-top: 45px;*/
	
	display: flex;
    justify-content: space-around;
    align-items: center;
    gap: 0px;
    width: 1200px;
    max-width: 1300px;
    margin-left: -25px;
    margin-top: 50px;
}
}
.flatpickr-calendar {
	position: absolute !important;
	left: 10% !important; top : 590px !important;
	width: 80% !important; /* 달력 전체 너비 */
	max-width: 100% !important;
	border-radius: 10px !important;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1) !important;
	font-size: 16px !important;
}
p {
	font-size: 14px;
	color: #333;
}
#date_selection button, #passenger_selection button, #seats_selection button
	{
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
.passenger-popup {
	position: absolute;
	top: 300px;
	left: 40%; /* 원하는 위치로 변경 가능 */
	width: 740px;
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	z-index: 1000;
	border-radius: 15px;
}
.passenger-counter {
	display: flex; /* 가로로 정렬 */
	justify-content: space-around; /* 여유 공간을 균등하게 배치 */
	align-items: center; /* 세로 정렬 */
}
.passenger-type {
	display: flex;
	align-items: center; /* 세로 정렬 */
	margin-top: 20px;
	font-size: 20px;
}
.decrease-btn, .increase-btn {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	border: 1px solid #ccc;
	background-color: #fff;
	font-size: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	margin: 0 10px; /* 버튼 간의 여유 공간 */
}

/* 좌석 선택 팝업 스타일 */
.seats-popup {
	position: absolute;
	top: 300px;
	left: 40%; /* 원하는 위치로 변경 가능 */
	width: 740px;
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	z-index: 1000;
	border-radius: 15px;
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
/* 라디오 버튼 숨기기 */
input[name="t_methods"] {
    display: none;
}
/* 기본 버튼 스타일 */
#trip-methods label {
    cursor: pointer;
    padding: 5px 10px;
    font-size: 16px;
    border: none;
    display: inline-block;
    margin-right: 10px;
    position: relative;
    color: black;
}
/* 선택된 버튼 아래 빨간 줄 */
input[name="t_methods"]:checked + label {
    font-weight: bold;
    color: black;
}
/* 선택된 버튼 아래에 빨간 줄 */
input[name="t_methods"]:checked + label::after {
    content: "";
    display: block;
    width: 80%;
    height: 3px;
    background-color: red;
    position: absolute;
    bottom: -2px; /* 밑으로 약간의 공간을 주기 */
    left: 10%;
}

#search_button {
padding: 10px 20px;
border-radius: 15px;
color: white;
font-size:16px;
cursor:pointer;
background-color:#1f0c59;

}

/* 출발지 리스트의 기본 스타일 */

#airport-list li {
	list-style-type: none;
    padding: 10px;
    background-color: white;
    border-bottom: 1px solid #ddd;
    cursor: pointer;
    font-size: 16px;
    color: #333;
    transition: background-color 0.3s ease;
}

/* 리스트 항목에 마우스를 올렸을 때 */
#airport-list li:hover {
    background-color: #e0e0e0; /* 호버 시 배경색 */
    color: #000; /* 호버 시 텍스트 색상 */
}

/* 선택된 항목에 대한 스타일 */
#airport-list li.selected {
    background-color: #1f0c59; /* 선택된 항목 배경색 */
    color: white; /* 선택된 항목의 텍스트 색상 */
}

/* 리스트 항목에 아이콘 추가 */
#airport-list li::before {
    content: "\f072"; /* Font Awesome 아이콘 */
    font-family: "Font Awesome 5 Free";
    margin-right: 10px; /* 텍스트와 아이콘 사이의 여백 */
    font-weight: 900;
}

/* 도착지 리스트의 기본 스타일 */
#arrival-list li {
	list-style-type: none;
    padding: 10px;
    background-color: white;
    border-bottom: 1px solid #ddd;
    cursor: pointer;
    font-size: 16px;
    color: #333;
    transition: background-color 0.3s ease;
}

/* 리스트 항목에 마우스를 올렸을 때 */
#arrival-list li:hover {
    background-color: #e0e0e0; /* 호버 시 배경색 */
    color: #000; /* 호버 시 텍스트 색상 */
}

/* 선택된 항목에 대한 스타일 */
#arrival-list li.selected {
    background-color: #1f0c59; /* 선택된 항목 배경색 */
    color: white; /* 선택된 항목의 텍스트 색상 */
}

/* 리스트 항목에 아이콘 추가 */
#arrival-list li::before {
    content: "\f072"; /* Font Awesome 아이콘 */
    font-family: "Font Awesome 5 Free";
    margin-right: 10px; /* 텍스트와 아이콘 사이의 여백 */
    font-weight: 900;
}

#login-popup{
width:500px;
height:500px;
background-color:white;
z-index:white;

}
/* 팝업 배경을 덮는 오버레이 */
.popup-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7); /* 배경을 어둡게 처리 */
    z-index: 999; /* 팝업 바로 아래에 위치 */
}

/* 팝업 창 스타일 */
.login-popup {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1000; /* 오버레이보다 위에 위치 */
    width: 400px;
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.login-popup-content {
    position: relative;
}

/* 팝업 닫기 버튼 */
.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    cursor: pointer;
    color: #333;
}

/* 로그인 폼 스타일 */
.input-group {
    margin-bottom: 15px;
}

.input-group label {
    display: block;
    margin-bottom: 5px;
    font-size: 14px;
    color: #555;
}

.input-group input {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border 0.3s ease;
}

.input-group input:focus {
    border-color: #1f0c59;
}

/* 로그인 버튼 스타일 */
.login-btn {
    width: 100%;
    padding: 12px;
    background-color: #1f0c59;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.login-btn:hover {
    background-color: #4b319c;
}

/* 로그인 옵션 */
.login-options {
    text-align: center;
    margin-top: 15px;
    font-size: 14px;
}

.login-options a {
    color: #1f0c59;
    text-decoration: none;
    margin: 0 5px;
}

.login-options a:hover {
    text-decoration: underline;
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
        position: relative;
        z-index: -1;
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
	position: relative;
    z-index: -1;
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
    
    /* 공항 코드에만 글씨 굵게 스타일 적용 */
.airport-code {
    font-weight: bold;
}
    

</style>
<!-- jQuery 및 Flatpickr JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const generalButton = document.getElementById('general');
    const mileageButton = document.getElementById('mileage');
    // 예매 버튼을 기본으로 활성화 상태로 설정
    generalButton.classList.add('active-button');
 // 버튼 클릭 시 활성화 스타일 적용
    generalButton.addEventListener('click', function() {
        generalButton.classList.add('active-button');
        generalButton.classList.add('active-button:hover');
        mileageButton.classList.remove('active-button');
        mileageButton.classList.remove('active-button:hover');
    });
    mileageButton.addEventListener('click', function() {
        mileageButton.classList.add('active-button');
        mileageButton.classList.add('active-button:hover');
        generalButton.classList.remove('active-button');
        generalButton.classList.remove('active-button:hover');
    });
});
//팝업 열기 함수
function openPopup(type) {
    if (type === 'passenger') {
        document.getElementById('passenger-selection-popup').style.display = 'block';  // 탑승객 선택 팝업 표시
    } else if (type === 'departure') {
    	document.getElementById('popup').style.display = 'list-item';  // 출발지 팝업
    } else if (type === 'arrival') {
        document.getElementById('arrival-popup').style.display = 'list-item';  // 도착지 팝업
    }
}

//팝업 x 버튼 함수
function closePopup(type) {
	if (type === 'passenger') {
		document.getElementById('passenger-selection-popup').style.display = 'none';
	} else if (type === 'departure') {
        document.getElementById('popup').style.display = 'none';  // 출발지 팝업
    } else if (type === 'arrival') {
        document.getElementById('arrival-popup').style.display = 'none';  // 도착지 팝업
    } else if (type === 'seats') {
    	document.getElementById('seats-popup').style.display = 'none';
    }
}
// 팝업 닫기 공통 함수
document.addEventListener('click', function(event) {
    const passengerPopup = document.getElementById('passenger-selection-popup');
    const departurePopup = document.getElementById('popup');
    const arrivalPopup = document.getElementById('arrival-popup');
    const seatPopup = document.getElementById('seats-popup');
    const seatSelectBtn = document.getElementById('seats-btn');
    const passengerBtn = document.getElementById('passenger-btn');
    // 팝업 외부를 클릭하면 모든 팝업 닫기
    if (passengerPopup.style.display === 'block' && !passengerPopup.contains(event.target) && event.target !== passengerBtn) {
        passengerPopup.style.display = 'none';
    }
    
    if (departurePopup.style.display === 'block' && !departurePopup.contains(event.target)) {
        departurePopup.style.display = 'none';
    }
    if (arrivalPopup.style.display === 'block' && !arrivalPopup.contains(event.target)) {
        arrivalPopup.style.display = 'none';
    }
    if (seatPopup.style.display === 'block' && !seatPopup.contains(event.target) && event.target !== seatSelectBtn) {
        seatPopup.style.display = 'none';
    }
});
// 좌석 선택 팝업 토글
document.addEventListener('DOMContentLoaded', function () {
    const seatSelectBtn = document.getElementById('seats-btn');
    const seatPopup = document.getElementById('seats-popup');
    seatSelectBtn.addEventListener('click', function(event) {
        event.stopPropagation(); // 이벤트 버블링 방지
        seatPopup.style.display = seatPopup.style.display === 'block' ? 'none' : 'block';
    });
    window.selectSeat = function(seatType) {
        document.querySelector('#seats-btn span').innerText = seatType;
        seatPopup.style.display = 'none';
    }
});
//출발지 리스트
document.addEventListener('DOMContentLoaded', function () {

    // 공항 목록을 불러오는 함수 호출
    loadDeparture();
});
//출발지 리스트 로드 함수 수정
function loadDeparture() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/flights/airports'); // 서버에 GET 요청
    xhr.onload = function() {
        var data = JSON.parse(xhr.responseText); // JSON 데이터 파싱
        var airportList = document.getElementById('airport-list');      
        airportList.innerHTML = ''; // 기존 목록 비우기

        // 공항 목록을 HTML에 추가하기
        data.forEach(function(airport) {
            var li = document.createElement('li');

            // 공항코드와 나머지 텍스트를 분리하여 각각 따로 표시
            var airportCode = document.createElement('span');
            airportCode.classList.add('airport-code'); // 스타일 적용을 위한 클래스 추가
            airportCode.textContent = airport.airportCode;

            var airportInfo = document.createElement('span');
            if (airport.detailedCity == 'null' || airport.detailedCity == null) {
                airportInfo.textContent = ' ' + airport.city + ', ' + airport.country;
            } else {
                airportInfo.textContent = ' ' + airport.city + '/' + airport.detailedCity + ', ' + airport.country;
            }

            // li 요소에 공항코드와 나머지 정보를 추가
            li.appendChild(airportCode);
            li.appendChild(airportInfo);

            // 클릭 시 동작
            li.onclick = function() {
                document.getElementById('from-text').textContent = airport.airportCode;
                if (airport.detailedCity == 'null' || airport.detailedCity == null) {
                    document.getElementById('departure-text').textContent = airport.city;
                } else {
                    document.getElementById('departure-text').textContent = airport.city + '/' + airport.detailedCity;
                }
                closePopup('departure');
            };

            // 리스트에 항목 추가
            airportList.appendChild(li);
        });
    };
    xhr.send();
}
//도착지 리스트
document.addEventListener('DOMContentLoaded', function () {
    // 공항 목록을 불러오는 함수 호출
    loadArrival();
});
function loadArrival() {
    var xhr = new XMLHttpRequest();   
    xhr.open('GET', '/flights/airports'); 
    xhr.onload = function() {
        var data = JSON.parse(xhr.responseText);         
        var airportList = document.getElementById('arrival-list');
        airportList.innerHTML = ''; 

        // 공항 목록을 HTML에 추가하기
        data.forEach(function(airport) {
            var li = document.createElement('li');

            // 공항코드와 나머지 텍스트를 분리하여 각각 따로 표시
            var airportCode = document.createElement('span');
            airportCode.classList.add('airport-code'); // 스타일 적용을 위한 클래스 추가
            airportCode.textContent = airport.airportCode;

            var airportInfo = document.createElement('span');
            if (airport.detailedCity == 'null' || airport.detailedCity == null) {
                airportInfo.textContent = ' ' + airport.city + ', ' + airport.country;
            } else {
                airportInfo.textContent = ' ' + airport.city + '/' + airport.detailedCity + ', ' + airport.country;
            }

            // li 요소에 공항코드와 나머지 정보를 추가
            li.appendChild(airportCode);
            li.appendChild(airportInfo);

            // 클릭 시 동작
            li.onclick = function() {
                document.getElementById('to-text').textContent = airport.airportCode;
                if (airport.detailedCity == 'null' || airport.detailedCity == null) {
                    document.getElementById('arrival-text').textContent = airport.city;
                } else {
                    document.getElementById('arrival-text').textContent = airport.city + '/' + airport.detailedCity;
                }
                closePopup('arrival');
            };

            // 리스트에 항목 추가
            airportList.appendChild(li);
        });
    };
    xhr.send();
}
document.addEventListener('DOMContentLoaded', function () {
	
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
    
    <!-- 달력 함수 관련-->
    // Flatpickr 설정
    var tripMethod = "round"; // 기본값: 왕복
    var calendar = flatpickr("#date-btn", {
    	locale: "ko", // 한국어 설정
    	mode: "range", // 두 날짜 선택을 위한 range 모드 (왕복일 때)
        dateFormat: "Y-m-d", // 날짜 형식
        showMonths: 2, // 두 달치 달력 표시
        onChange: function(selectedDates, dateStr, instance) {
            if (tripMethod === "round" && selectedDates.length === 2) {
                // 왕복일 경우: 두 날짜가 선택되면 버튼에 표시
                document.getElementById('date-btn').innerHTML = 
                    selectedDates[0].toLocaleDateString() + 
                    " ~ " + selectedDates[1].toLocaleDateString();
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
<!-- 탑승객 관련 함수 -->
function updatePassengerButton() {
    var adultCount = document.getElementById('adult-count').textContent;
    var childCount = document.getElementById('child-count').textContent;
    var infantCount = document.getElementById('infant-count').textContent;
    var passengerText = '성인 ' + adultCount + '명';
    var additionalPassengers = [];
    // 추가 승객 정보를 배열에 저장
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
}
document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로드 시 기본값 설정
    updatePassengerButton();
});
function increase(type) {
    var adultCount = parseInt(document.getElementById('adult-count').textContent);
    var childCount = parseInt(document.getElementById('child-count').textContent);
    var infantCount = parseInt(document.getElementById('infant-count').textContent);
    var totalPassengers = adultCount + childCount;
    if (type === 'adult' && totalPassengers < 10) {
        document.getElementById('adult-count').textContent = adultCount + 1;
    } else if (type === 'child' && totalPassengers < 10) {
        document.getElementById('child-count').textContent = childCount + 1;
    } else if (type === 'infant' && infantCount < adultCount) {
        document.getElementById('infant-count').textContent = infantCount + 1;
    }
    updatePassengerButton(); // 승객 수가 변경될 때마다 바로 반영
}
function decrease(type) {
    var adultCount = parseInt(document.getElementById('adult-count').textContent);
    var childCount = parseInt(document.getElementById('child-count').textContent);
    var infantCount = parseInt(document.getElementById('infant-count').textContent);
    if (type === 'adult' && adultCount > 0) {
        document.getElementById('adult-count').textContent = adultCount - 1;
        if (infantCount > adultCount - 1) {
            document.getElementById('infant-count').textContent = adultCount - 1;
        }
    } else if (type === 'child' && childCount > 0) {
        document.getElementById('child-count').textContent = childCount - 1;
    } else if (type === 'infant' && infantCount > 0) {
        document.getElementById('infant-count').textContent = infantCount - 1;
    }
    updatePassengerButton(); // 승객 수가 변경될 때마다 바로 반영
}
    
    
    
    

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
    
 
 // 팝업 열기
    function openLoginPopup() {
        document.getElementById('login-popup').style.display = 'block';
        document.getElementById('popup-overlay').style.display = 'block'; // 오버레이도 표시
    }

    // 팝업 닫기
    function closeLoginPopup() {
        document.getElementById('login-popup').style.display = 'none';
        document.getElementById('popup-overlay').style.display = 'none'; // 오버레이 숨기기
    }
    
    function check(my) // my=document.form
    {
        if(my.userid.value.trim().length==0)
        {
        	alert("아이디를 입력하세요");
        	return false;
        }	
        else if(my.pwd.value.trim().length==0)
        	 {
        	     alert("비밀번호를 입력하세요");
        	     return false;
        	 }
             else
            	 return true;
        	
    }
    
    var fs1=22;
    var fs2=22;
 
    function sizedown(n)
    {
    	var num;
        if(n==0)
           num=fs1;
        else
           num=fs2;
        	
        if(num!=11)
        {
        	s1=setInterval(function()
   	    	{   
   	    		num--;
   	    		document.getElementsByClassName("inner")[n].style.fontSize=num+"px";
   	    		document.getElementsByClassName("inner")[n].style.top="-15px";
   	    		document.getElementsByClassName("inner")[n].style.opacity=1;
   	    		
   	    		if(num==11)
   	    		{	
   	    			clearInterval(s1);
   	    			if(n==0)
   	    		       fs1=11;
         		    else
   	    		       fs2=11;
        		}
        	},10);
        }
    	 
    }
    
    function init(my,n)
    {
       if(my.value.trim().length==0)
       {
    	    if(n==0)
               num=fs1;
            else
               num=fs2;
    	 
    	    s2=setInterval(function()
    	   	{   
    	   		num++;
    	   		document.getElementsByClassName("inner")[n].style.fontSize=num+"px";
    	   		document.getElementsByClassName("inner")[n].style.top="-5px";
   	    		document.getElementsByClassName("inner")[n].style.opacity=0.6;
    	   		
    	   		if(num>=18)
    	   		{	
    	   			console.log(num);
    	   			clearInterval(s2);
    	   			if(n==0)
    	    		   fs1=18;
    	    		else
    	    		   fs2=18;
    	   		}
    	   	},20);
       }	   
    }
    window.onload=function()
    {
    	document.getElementById("txt").focus();
    }
    function useridSearch()
    {
    	son=open("usForm","","width=400,height=300");
    	son.moveTo(200,200);
    }
    function pwdSearch()
    {
    	son=open("psForm","","width=400,height=370");
    	son.moveTo(200,200);
    }

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
											<button type="button" id="general">예매</button>
										</li>
										<li>
											<button type="button" id="mileage" onclick="openLoginPopup()">마일리지 예매</button>
									</ul>
								</div>
								
<!-- 팝업 오버레이 추가 -->
<div id="popup-overlay" class="popup-overlay" style="display: none;"></div>

<!-- 마일리지 예매 팝업 -->
<div id="login-popup" class="login-popup" style="display: none;">
    <div class="login-popup-content">
        <span class="close-btn" onclick="closeLoginPopup()">&times;</span>
        <h2>로그인</h2>
        
        <!-- 로그인 폼 -->
        <form method="post" action="loginOk" onsubmit="return check(this);">
            <div class="input-group">
    <div> 
       <div class="inner">아이디</div>
       <input type="text" name="userid" id="txt"  onfocus="sizedown(0)" onblur="init(this,0)" required>
     </div>
     </div>
     <div> 
            </div>
            <div class="input-group">
     <div> 
       <div class="inner">비밀번호</div>
       <input type="password" name="pwd" id="pwd"  onfocus="sizedown(1)" onblur="init(this,1)" required> 
     </div>
            </div>
            <div class="input-group">
                <input type="checkbox" id="save-id">
                <label for="save-id">아이디 저장</label>
            </div>
            <button type="submit" class="login-btn">로그인</button>
        </form>

        <div class="login-options">
            <a href="#">아이디 찾기</a> | 
            <a href="#">비밀번호 찾기</a>
        </div>    
    </div>
</div>


								<!-- 왕복/편도 선택 버튼 -->
								<div id="trip-methods" class="trip-methods">
									<input type="radio" name="t_methods" value="round"
										id="round-trip" checked> <label for="round-trip">왕복</label>
									<input type="radio" name="t_methods" value="one-way"
										id="one-way"> <label for="one-way">편도</label>
								</div>

								<div class="quick_booking_aligner">
									<div id="quick_booking">
										<!-- 출발지 버튼 -->
										<button type="button" class="quick_booking_button"
											onclick="openPopup('departure')">
											
											<span id="from-text">From</span> <span id="departure-text">&nbsp;출발지</span>
										</button>

										<button type="button"
											class="quick_booking_button circle_button">
											<img src="../static/resources/booking_reverse.png"
												width="40px" height="40px">
										</button>

										<!-- 도착지 버튼 -->
										<button type="button" class="quick_booking_button"
											onclick="openPopup('arrival')">
											<span id="to-text">To</span> <span id="arrival-text">&nbsp;도착지</span>
										</button>
									</div>



									<!-- 출발지 div 팝업 -->
									<div id="popup" class="popup" style="display: none;">

											<span class="close-btn" onclick="closePopup('departure')">&times;</span>
											<h2>출발지 선택</h2>
											<ul id="airport-list" class="airport-list"></ul>
											<!-- 공항 목록이 표시될 리스트 -->

									</div>



									<!-- 도착지 팝업 -->
									<div id="arrival-popup" class="popup" style="display: none;">

											<span class="close-btn" onclick="closePopup('arrival')">&times;</span>
											<h2>도착지 선택</h2>
											<ul id="arrival-list" class="airport-list"></ul>

									</div>

									<!-- 날짜 선택 버튼 -->
									<div id="date_selection">
										<p>출발일&nbsp;</p>
										<button type="button" id="date-btn">
											<span>가는날 ~ 오는날</span>
										</button>
									</div>

									<!-- 탑승객 선택 버튼 -->
									<div id="passenger_selection">
										<p>탑승객&nbsp;</p>
										<button type="button" id="passenger-btn"
											onclick="openPopup('passenger')">
											<span>인원수</span>
										</button>
									</div>

									<!-- 승객 선택 팝업 -->
									<div id="passenger-selection-popup" class="passenger-popup"
										style="display: none;">
										<span class="close-btn" onclick="closePopup('passenger')">&times;</span>
										<h2>승객 선택</h2>
										<div class="passenger-counter">
											<div class="passenger-type">
												<h4>성인</h4>
												<button class="decrease-btn" onclick="decrease('adult')">-</button>
												<span id="adult-count">1</span>
												<button class="increase-btn" onclick="increase('adult')">+</button>
											</div>
											<div class="passenger-type">
												<h4>소아</h4>
												<button class="decrease-btn" onclick="decrease('child')">-</button>
												<span id="child-count">0</span>
												<button class="increase-btn" onclick="increase('child')">+</button>
											</div>
											<div class="passenger-type">
												<h4>유아</h4>
												<button class="decrease-btn" onclick="decrease('infant')">-</button>
												<span id="infant-count">0</span>
												<button class="increase-btn" onclick="increase('infant')">+</button>
											</div>
										</div>
									</div>



									<!-- 좌석등급 선택 버튼 -->
									<div id="seats_selection">
										<p>좌석등급&nbsp;</p>
										<button type="button" id="seats-btn">
											<span>선택하세요</span>
										</button>
									</div>

									<!-- 좌석 등급 DIV -->
									<div id="seats-popup" class="seats-popup"
										style="display: none;">
										<span class="close-btn" onclick="closePopup('seats')">&times;</span>
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
											<button type="button" id="search_button">
												<span>항공편 검색</span>
											</button>
										</a>
									</div>


								</div>
							</div>
						</div>
						<div class="select_contents">
							<div id="select methods">
								<input type="radio" name="t_methods" value="0"> <label>왕복</label>
								<input type="radio" name="t_methods" value="1"> <label>편도</label>
							</div>
							<div id="quick_booking">
								<button type="button">
									<span>rom</span> <span>$nbsp;출발지</span>
								</button>
							</div>
						</div>

						<div class="check-in_contents">
							<div id="check-in methods">
								<input type="radio" name="t_methods" value="0"> <label>왕복</label>
								<input type="radio" name="t_methods" value="1"> <label>편도</label>
							</div>
							<div id="quick_booking">
								<button type="button">
									<span>om</span> <span>$nbsp;출발지</span>
								</button>
							</div>
						</div>

						<div class="schedule_contents">
							<div id="schedule methods">
								<input type="radio" name="t_methods" value="0"> <label>왕복</label>
								<input type="radio" name="t_methods" value="1"> <label>편도</label>
							</div>
							<div id="quick_booking">
								<button type="button">
									<span>From</span> <span>$nbsp;출발지</span>
								</button>
							</div>
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