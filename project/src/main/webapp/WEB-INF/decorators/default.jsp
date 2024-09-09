<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>title</title>
<!-- Flatpickr(달력 라이브러리) CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- Flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gugi&family=Hahmlet:wght@100..900&display=swap');
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	body {
		margin: auto;
		font-family: 'Hahmlet';
	}
	header {
		width: 100%;
		margin: auto;
	}
	#section1 {
		width: 100%;
		height: 80px;
		margin: auto;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	#section1 #logo {
		width: 200px;
		height: 75px;
		margin-left: 50px;
	}
	#section1 #loginMenu {
		display: flex;
		align-items: center;
		font-size: 20px;
		font-weight: 600;
		margin-right: 60px;
	}
	#section1 #loginMenu a {
		text-decoration: none;
		color: black;
	}
	#section1 #loginMenu a:hover {
		text-decoration: none;
		color: green;
		font-weight: 900;
	}
	#section1 #loginMenu ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
		display: flex;
		align-items: center;
	}
	#section1 #loginMenu ul li {
		position: relative;
		margin-right: 10px;
	}
	#section1 #loginMenu .cmenu, #section1 #loginMenu .mmenu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 30px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
	}
	#section1 #loginMenu .cmenu > li, #section1 #loginMenu .mmenu > li {
		list-style-type: none;
		width: 130px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		border-bottom: 1px solid #ddd;
	}
	#section1 #loginMenu .cmenu > li:hover, #section1 #loginMenu .mmenu > li:hover {
		text-decoration: underline;
		color: green;
	}
	#section1 #loginMenu #supMenu {
		position: relative;
	}
	#section1 #loginMenu #myInfo {
		position: relative;
	}
	#section1 #loginMenu #supMenu .menu {
		padding-left: 0;
		position: absolute;
		left: -10px;
		top: 30px;
		background: white;
		display: none;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		z-index: 10;
	}
	#section1 #loginMenu #supMenu .menu > li {
		list-style-type: none;
		width: 130px;
		height: 35px;
		line-height: 35px;
		text-align: center;
		cursor: pointer;
		border-bottom: 1px solid #ddd;
	}
	#section1 #loginMenu #supMenu .menu > li:hover {
		text-decoration: underline;
		color: green;
	}
	header > nav {
		width: 1200px;
		height: 70px;
		margin: auto;
		line-height: 50px;
		font-family: 'Gugi';
	}
	header > nav a {
		text-decoration: none;
		color: black;
	}
	header > nav a:hover {
		text-decoration: underline;
		color: green;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px  1px 0 #000, 1px  1px 0 #000;
	}
	header > nav #main {
      padding-left:0px;
      margin-left:100px;
   }
   
   header > nav #main > li { /* 주메뉴 */
      display:inline-block;
      list-style-type:none;
      width:340px;
      height:50px;
      line-height:30px;
      text-align:center;
      font-weight:900;
      position:relative;
      
      
      
      z-index: 5;
      
      
      /*border:1px solid black;*/
   }


	header > nav #main > li > .menu { /* 하위메뉴 ul태그 */
      padding-left:0px;
      position:absolute;
      left:0px;
      top:48px;
      background:white;
      visibility:hidden;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  
   }
   
   header > nav #main > li > .menu > li { /* 하위메뉴내의 메뉴 */
      list-style-type:none;
      width:340px;
      height:35px;
      line-height:35px;
      border-bottom:1px solid #ddd;
      
      
    					
    					
   }
   
   
   /*
   header > nav #main > li > .menu > li:last-child {
      border-bottom:1px solid green;
    }
    */


/* 푸터 스타일 */
footer {
    padding-top: 10px;
    padding-bottom: 5px;
    width: 100%;
    height: auto;
    margin: auto;
    font-family: 'Hahmlet';
    margin-top: 30px;
    font-size: 13px;
    background: #9AB973;
    color: white;
    text-align: center;
}

footer table {
    width: 100%;
    max-width: 1000px;
    margin: auto;
}

@media (max-width: 768px) {
    header, #outer #first, nav ul {
        flex-direction: column;
        text-align: center;
    }

    nav ul li {
        display: block;
        margin: 10px 0;
    }

    footer table, footer td {
        font-size: 11px;
    }
}


/*중앙 컨텐츠*/

@media (max-width: 768px) {
	header, #outer #first, nav ul {
		flex-direction: column;
		text-align: center;
	}
	nav ul li {
		display: block;
		margin: 10px 0;
	}
	footer table, footer td {
		font-size: 11px;
	}
}

.air_service{
	position: relative;
	background-image: url('../static/resources/background.jpg'); 
	background-size: cover; 
	width: 100%;  
	height: 450px;
	background-repeat: no-repeat;
	z-index:0;

}

.air_align{
margin-left: 73px;
margin-right: 73px;
display: flex; /* Flexbox 컨테이너로 설정 */
flex-direction: column; /* 수직 방향으로 정렬 */
align-items: center; /* 중앙 정렬 */


}


.air_contentbox{
	position: relative;
	 
    top: 5.3rm; /* 원하는 위치로 조정 */
    left: 0; /* 원하는 위치로 조정 */
   /* width: 1150px; 
    height: 284px; */
    width: 90%;
    height: 70%; 
    display: flex;
    flex-direction: column; /*수직 방향으로 콘텐츠 정렬 */
    justify-content: center; 
    align-items: center; 
    z-index:2;
}




.air_widget{
position: absolute;
    top: 7.4rem;
    display: block;
    width: 100%;
    height: 54px;
    content: "";
    z-index: 1;
    margin: auto;

}

.booking_widget_list{
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


/* .booking_widget_list:before{
position: absolute;
    top: 0;
    left: 1.3rem;
    display: block;
    width: calc(100% - 2.6rem);
    height: 100%;
    content: none;
    background-color: #65728a;
}
*/
.booking_widget_list li {
	flex: 1;
    text-align: center;
    border: 1px solid #65728a;
    padding-block: 15px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    margin: 0.5px;
    background-color: #65728a;
    z-index:2;
}

.booking_widget_list li.active {
    background-color: white;
    border: 3px solid white;

}


.booking_widget_list li.active span {
    color: #65728a; /* 활성화된 상태에서 span 태그의 글씨 색상 */
    font-weight: 900; /* 글씨를 두껍게 만듭니다 */
}

#booking_menu{
display: inline-block;
}

.booking_widget_list button {
    width: 100%; /* 버튼이 li 요소의 너비를 꽉 채우도록 설정 */
    height: 100%; /* 버튼이 li 요소의 높이를 꽉 채우도록 설정 */
    background: none;
    border: none;
    font-size: 16px;
    cursor: pointer;
    display: flex; /* 버튼 내의 텍스트 중앙 정렬을 위해 Flexbox 사용 */
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
}

.booking_widget_list button span {
    font-size: 16px;
        color: white;
        
    position: relative; /* 텍스트의 위치 조정을 위해 relative 설정 */
    top: -5px; /* 텍스트를 위로 이동시킬 값을 조정 */
    
}




.booking_contents {
	position: relative;
    width: 100%;
    height: 220px;
    z-index: 3;
    background-color: white;
    border: 2px solid white;
    border-radius: 15px;
    margin-top: -10px;
    
    display: block; /* 기본적으로 표시 */
    padding-left: 40px;
    padding-top:30px;
    padding-right: 40px;
    padding-bottom:10px;
}

.select_contents {
	position: relative;
    width: 100%;
    height: 220px;
    z-index: 3;
    background-color: white;
    border: 2px solid white;
    border-radius: 15px;
    margin-top: -10px;
    padding-left: 40px;
    padding-top:30px;
    padding-right: 40px;
    padding-bottom:10px;
}

.check-in_contents {
	position: relative;
    width: 100%;
    height: 220px;
    z-index: 3;
    background-color: white;
    border: 2px solid white;
    border-radius: 15px;
    margin-top: -10px;
    padding-left: 40px;
    padding-top:30px;
    padding-right: 40px;
    padding-bottom:10px;
}

.schedule_contents {
	position: relative;
    width: 100%;
    height: 220px;
    z-index: 3;
    background-color: white;
    border: 2px solid white;
    border-radius: 15px;
    margin-top: -10px;
    padding-left: 40px;
    padding-top:30px;
    padding-right: 40px;
    padding-bottom:10px;
}

.booking_contents, .select_contents, .check-in_contents, .schedule_contents {
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

.booking_types{
border: 1px solid black;
    border-radius: 25px;
}

.booking_types li{
	display: inline-block;
	list-style-list: none;
}

.booking_types li button{
    font-size: 17px;
    padding-left: 20px;
    padding-right:20px;
    padding-top:10px;
    padding-bottom:10px;
    border: none;
    border-radius: 23px;
    color: white;
    background-color: #65728a;
    cursor: pointer;
}

#quick_booking {
    display: flex;
    justify-content: space-between; /* 버튼들 사이에 균등한 간격을 배분 */
    align-items: center; /* 버튼들을 세로 방향으로 가운데 정렬 */
    align-self: flex-start; /* 버튼을 왼쪽으로 정렬 */
    width: 270px;
    height: 80px;
}

.quick_booking_button {
    flex: 1; /* 버튼들이 동일한 너비를 가지도록 설정 */
    text-align: center; /* 버튼 텍스트 중앙 정렬 */
    margin: 0 5px; /* 버튼들 사이에 좌우 마진 추가 */
    padding: 10px; /* 버튼 안쪽 여백 */
    border: none; /* 기본 테두리 제거 */
    background-color: white; /* 버튼 배경색 */
    cursor: pointer; /* 마우스 포인터를 손 모양으로 변경 */
    font-size: 16px; /* 텍스트 크기 설정 */
    color: #333; /* 텍스트 색상 */
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

.quick_booking_button:first-child { /* 첫 번째 칸 */
    flex-grow: 2; /* 첫 번째 칸 크기 비율을 2로 설정 */
}

.quick_booking_button:last-child { /* 세 번째 칸 */
    flex-grow: 2; /* 세 번째 칸 크기 비율을 2로 설정 */
}
.quick_booking_button:hover {
    background-color: #ddd; /* 버튼 호버 시 배경색 변경 */
}

#from-text, #departure-text {
    display: block; /* 각 스팬을 블록으로 설정하여 세로로 쌓이게 함 */
    margin: 0; /* 기본 마진 제거 */
}

/* From, To 글씨 키우기 */
#from-text, #to-text {
    font-size: 40px; /* 글씨 크기를 조정 (원하는 크기 선택) */
    font-weight: bold; /* 필요에 따라 굵게 만들기 */
}

/* 출발지, 도착지 글씨 작게 만들기 */
#departure-text, #arrival-text {
    font-size: 14px; /* 글씨 크기 작게 조정 */
    color: #666; /* 필요에 따라 색상 변경 */
}
    
/* 팝업창 기본 스타일 */
.popup {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    z-index: 1000; /* 다른 요소 위에 표시 */
}

/* 팝업창 내용 스타일 */
.popup-content {
    position: relative;
    margin: 15% auto; /* 수직 중앙 정렬 */
    padding: 20px;
    width: 80%;
    max-width: 600px;
    background-color: #fff;
    border-radius: 5px;
}

/* 닫기 버튼 스타일 */
.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    cursor: pointer;
}

.quick_booking_aligner {
            display: flex;
            justify-content: space-between; /* 각 요소 사이에 동일한 간격 배분 */
            align-items: center; /* 요소들을 수직으로 가운데 정렬 */
            gap: 10px; /* 요소들 간 간격 추가 */
            width: 1000px;
            margin-left: -10px; /* 왼쪽으로 이동 (값을 조정해서 원하는 위치로 이동) */
            margin-top:45px;
        }
        
p {
font-size: 13px;
color: #333;
}

        
#date_selection button {
   width: 300px;
    padding-top: 20px;
    padding-bottom: 5px;
    background-color: transparent; /* 배경색을 투명하게 설정 */
    border: none; /* 기본 테두리를 제거 */
    border-bottom: 1px solid #333; /* 하단에만 테두리 추가 */
    font-size: 14px; /* 글자 크기 조정 */
    color: #333; /* 텍스트 색상 */
    cursor: pointer; /* 마우스 포인터를 손 모양으로 변경 */
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
    outline: none; /* 클릭 시 기본 아웃라인 제거 */
}

#passenger_selection button {
   width: 130px;
    padding-top: 20px;
    padding-bottom: 5px;
    background-color: transparent; /* 배경색을 투명하게 설정 */
    border: none; /* 기본 테두리를 제거 */
    border-bottom: 1px solid #333; /* 하단에만 테두리 추가 */
    font-size: 14px; /* 글자 크기 조정 */
    color: #333; /* 텍스트 색상 */
    cursor: pointer; /* 마우스 포인터를 손 모양으로 변경 */
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
    outline: none; /* 클릭 시 기본 아웃라인 제거 */
}

#seats_selection button {
   width: 130px;
    padding-top: 20px;
    padding-bottom: 5px;
    background-color: transparent; /* 배경색을 투명하게 설정 */
    border: none; /* 기본 테두리를 제거 */
    border-bottom: 1px solid #333; /* 하단에만 테두리 추가 */
    font-size: 14px; /* 글자 크기 조정 */
    color: #333; /* 텍스트 색상 */
    cursor: pointer; /* 마우스 포인터를 손 모양으로 변경 */
    text-align: left; /* 텍스트를 왼쪽으로 정렬 */
    outline: none; /* 클릭 시 기본 아웃라인 제거 */
}
</style>

<script>
	function viewCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "block";
	}
	function hideCmenu(n) {
		document.getElementsByClassName("cmenu")[n].style.display = "none";
	}
	function viewMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "block";
	}
	function hideMmenu(n) {
		document.getElementsByClassName("mmenu")[n].style.display = "none";
	}
	function viewMenu(n) {
		document.getElementsByClassName("menu")[n].style.visibility = "visible";
	}
	function hideMenu(n) {
		document.getElementsByClassName("menu")[n].style.visibility = "hidden";
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

	    
	    window.onload = function() {
	        // 기본 출발지를 ICN 인천으로 설정
	        document.getElementById('from-text').textContent = 'ICN'; // From에 공항 코드 설정
	        document.getElementById('departure-text').textContent = '인천'; // 출발지 도시 설정

	        // 기본 콘텐츠를 '항공권예매'로 설정
	        showContent('booking');
	    };
	    
	    document.addEventListener('DOMContentLoaded', function() {
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
	    });
	    
	 
	    function openPopup(type) {
	        if (type === 'departure') {
	            document.getElementById('popup').style.display = 'block';  // 출발지 팝업
	        } else if (type === 'arrival') {
	            document.getElementById('arrival-popup').style.display = 'block';  // 도착지 팝업
	        }
	    }

	    function closePopup(type) {
	        if (type === 'departure') {
	            document.getElementById('popup').style.display = 'none';  // 출발지 팝업 닫기
	        } else if (type === 'arrival') {
	            document.getElementById('arrival-popup').style.display = 'none';  // 도착지 팝업 닫기
	        }
	    }
	    
	    
	 // 자동완성 기능을 통합하는 함수
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

	        // 입력이 없으면 목록 숨김
	        if (input.trim() === '') {
	            list.style.display = 'none';
	            return;
	        }

	        // 목록을 초기화
	        list.innerHTML = '';

	        // 입력값과 일치하는 항목을 필터링하여 표시
	        var matches = airports.filter(function(airport) {
	            return airport.city.toLowerCase().includes(input.toLowerCase()) || airport.code.toLowerCase().includes(input.toLowerCase());
	        });

	        // 일치하는 항목이 있을 경우 목록 표시
	        if (matches.length > 0) {
	            matches.forEach(function(match) {
	                var listItem = document.createElement('li');
	                listItem.textContent = match.city + ' ' + match.code;
	                listItem.onclick = function() {
	                    if (type === 'departure') {
	                        document.getElementById('from-text').textContent = match.code; // From에 공항 코드 업데이트
	                        document.getElementById('departure-text').textContent = match.city; // 출발지에 도시 이름 업데이트
	                    } else if (type === 'arrival') {
	                        document.getElementById('to-text').textContent = match.code; // To에 공항 코드 업데이트
	                        document.getElementById('arrival-text').textContent = match.city; // 도착지에 도시 이름 업데이트
	                    }
	                    list.style.display = 'none';
	                    closePopup(type); // 팝업 닫기
	                };
	                list.appendChild(listItem);
	            });
	            list.style.display = 'block';
	        } else {
	            list.style.display = 'none';
	        }
	    }


	    	// 출발지와 도착지 설정을 통합하는 함수
	    	function setLocation(type) {
	    	    var input, matchedAirport, textElement, codeElement, airports;

	    	    if (type === 'departure') {
	    	        input = document.getElementById('departure-input').value;
	    	        textElement = document.getElementById('departure-text'); // 출발지 텍스트
	    	        codeElement = document.getElementById('from-text'); // From 텍스트
	    	        airports = [
	    	            { city: "오사카", code: "KIX" },
	    	            { city: "인천", code: "ICN" },
	    	            { city: "도쿄", code: "NRT" },
	    	            { city: "부산", code: "PUS" }
	    	        ];
	    	    } else if (type === 'arrival') {
	    	        input = document.getElementById('arrival-input').value;
	    	        textElement = document.getElementById('arrival-text'); // 도착지 텍스트
	    	        codeElement = document.getElementById('to-text'); // To 텍스트
	    	        airports = [
	    	            { city: "도쿄", code: "NRT" },
	    	            { city: "부산", code: "PUS" },
	    	            { city: "인천", code: "ICN" },
	    	            { city: "오사카", code: "KIX" }
	    	        ];
	    	    }

	    	    // 입력값과 일치하는 공항 찾기
	    	    matchedAirport = airports.find(function(airport) {
	    	        return airport.city.toLowerCase() === input.toLowerCase() || airport.code.toLowerCase() === input.toLowerCase();
	    	    });

	    	    // 공항 코드와 도시 이름을 각각 업데이트
	    	    if (matchedAirport) {
	    	        codeElement.textContent = matchedAirport.code; // From/To에 공항 코드 업데이트
	    	        textElement.textContent = matchedAirport.city; // 출발지/도착지에 도시 이름 업데이트
	    	    } else {
	    	        alert("유효한 " + (type === 'departure' ? '출발지' : '도착지') + "를 선택해주세요.");
	    	    }

	    	    closePopup(type); // 팝업 닫기
	    	}

	        document.addEventListener('DOMContentLoaded', function () {
	            var tripMethod = "round"; // 기본값: 왕복
	            
	            // Flatpickr 설정
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
	                    } else if (this.value === "one-way") {
	                        tripMethod = "one-way";
	                        calendar.set("mode", "single"); // 편도일 때는 한 날짜 선택
	                    }
	                });
	            });
	        });
	
</script>
<sitemesh:write property="head"/>
</head>
<script>
	window.onload = function() {
		// 현재 URL을 가져옴
		var currentURL = window.location.pathname;

		// 만약 현재 페이지가 member 페이지라면
		if(currentURL.includes("/member/member")||currentURL.includes("/login/login")) {
			// main_content 요소를 숨김
			document.querySelector('.main_content').style.display = 'none';
		}
	};
</script>
<body>
	<header>
		<div id="section1">
			<div id="logo">
				<a href="../main/index">
					<img src="../static/resources/eltlogo.png" width="200px" height="75px">
				</a>
			</div>
			<div id="loginMenu">
				<c:if test="${userid!=null&&userid=='admin'}">
					<!-- 관리 홈 예시 -->
					<a href="../admin/index" style="color: orange;"> 관리자 홈 </a>&nbsp;|&nbsp;
				</c:if>
				<c:if test="${userid==null}">
					<a href="../member/member"> 회원가입 </a>&nbsp;|&nbsp;
					<a href="../login/login"> 로그인 </a>&nbsp;|&nbsp;
			
				</c:if>
										
				<c:if test="${userid!=null}">
					<span id="myInfo" onmouseover="viewMmenu(0)" onmouseout="hideMmenu(0)">  ${name}님 &nbsp;|&nbsp;
						<ul class="mmenu">
							<li> 회원정보 </li>
							<li> 예약정보 </li>
							<li> 나의문의 </li>
						</ul>
					</span>
					<a href="../login/logout"> 로그아웃 </a>&nbsp;|&nbsp;
				</c:if>
					<span id="supMenu" onmouseover="viewCmenu(0)" onmouseout="hideCmenu(0)"> 고객센터
						<ul class="cmenu">
							<li><a href="../gongji/list"> 공지사항 </a></li>
							<li><a href="../inquiry/list"> Q & A </a></li>
							<li> 이벤트 </li>
						</ul>
					</span>
				
			</div>
		</div>
		<nav>
			<ul id="main">
				<li onmouseover="viewMenu(0)" onmouseout="hideMenu(0)"> 예약
					<ul class="menu">
						<li><a href="../menu/index1">여행 준비</a></li>
						<li><a href="../menu/index2">여행</a></li>
						<li><a href="../menu/index3">예약 취소</a></li>
					</ul>
				</li>
				<li onmouseover="viewMenu(1)" onmouseout="hideMenu(1)"> 항공권
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(2)" onmouseout="hideMenu(2)"> 최저가
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(3)" onmouseout="hideMenu(3)"> 여행지
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
				<li onmouseover="viewMenu(4)" onmouseout="hideMenu(4)"> 호텔
					<ul class="menu">
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</li>
			</ul>
		</nav>

</header>

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

	 
	
	 
	 
<!-- 출발지 팝업 -->
<div id="popup" class="popup">
    <div class="popup-content">
        <span class="close-btn" onclick="closePopup('departure')">&times;</span>
        <h2>출발지 검색</h2>
        <input type="text" id="departure-input" placeholder="출발지 입력" onkeyup="autocomplete('departure')">
        <ul id="departure-list"></ul>
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
    <button type="button" id="passenger-btn"><span>인원수</span></button>
</div>

<!-- 좌석등급 선택 버튼 -->
<div id="seats_selection">
	<p>좌석등급&nbsp;</p>
    <button type="button" id="seats-btn"><span>선택하세요</span></button>
</div>

<!-- 항공편 선택 버튼 -->
<div id="search_airline">
    <button type="button" id="search-btn"><span>항공편 검색</span></button>
</div>

 </div>
</div>	 
	</div>	 
	 	<div class="select_contents">
		<div id="select methods">
		 <input type="radio" name="t_methods" value="0">
		 <label>왕복</label> 
		 <input type="radio" name="t_methods" value="1">
		 <label>편도</label>
		</div>
		<div id="quick_booking">
		<button type="button">
			<span>rom</span>
			<span>$nbsp;출발지</span></button>
		</div>
	 </div>
	 
	 	<div class="check-in_contents">
		<div id="check-in methods">
		 <input type="radio" name="t_methods" value="0">
		 <label>왕복</label> 
		 <input type="radio" name="t_methods" value="1">
		 <label>편도</label>
		</div>
		<div id="quick_booking">
		<button type="button">
			<span>om</span>
			<span>$nbsp;출발지</span></button>
		</div>
	 </div>
	 
	 	<div class="schedule_contents">
		<div id="schedule methods">
		 <input type="radio" name="t_methods" value="0">
		 <label>왕복</label> 
		 <input type="radio" name="t_methods" value="1">
		 <label>편도</label>
		</div>
		<div id="quick_booking">
		<button type="button">
			<span>From</span>
			<span>$nbsp;출발지</span></button>
		</div>
	 </div>
	 

	</div>
	</div> 
</div>
</div>
</div>
  <sitemesh:write property="body"/>
  
<!-- 푸터 -->
    <footer>
        <table>
            <tr>
                <td rowspan="5" width="200"></td>
                <td rowspan="5"><img alt="logo" src="../static/resources/123.png" width="80" align="middle"></td>
                <td> 상호명 : LLTA </td>
                <td> 365고객센터 </td>
            </tr>
            <tr>
                <td> 대표이사 : 주인장 </td>
                <td> 080-888-1234(무료) </td>
            </tr>
            <tr>
                <td> 본사 : 경기도 파주시 야당동 </td>
                <td> email : Tmaster@air.co.kr </td>
            </tr>
            <tr>
                <td> 사업자 등록번호 : 444-44-44444 </td>
                <td> 전화번호 : 010-1234-5678 </td>
            </tr>
            <tr>
                <td> 통신판매업신고 : 2023-경기비행-1233 </td>
                <td></td>
            </tr>
        </table>
    </footer>

</body>
</html>