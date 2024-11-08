<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eLT항공</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
	body {
		margin: 0;
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
	}
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
		width: 1500px;
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
				width: 85%;
				height: 40px;
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
				height: 65px;
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
			.booking_contents {
				position:relative;
				display: flex;
				flex-direction: column;
				align-items: center;
				background-color: white;
				border: 1px solid white;
				border-radius: 15px;
				width: 85%;
				height: 235px;
				padding-left: 40px;
				padding-top: 30px;
				padding-right: 40px;
				padding-bottom: 10px;
				z-index: 3;
			}
			.booking_methods {
				display: absolute;
				align-items: center;
				width: 100%;
				height: 170px;
			}
			.select_contents, .check-in_contents, .schedule_contents {
				position: relative;
				width: 85%;
				height: 235px;
				z-index: 3;
				background-color: white;
				border: 2px solid white;
				border-radius: 15px;
				padding-left: 40px;
				padding-top: 30px;
				padding-right: 40px;
				padding-bottom: 10px;
				display: none;
			}
			.b_methodbox {
				float: left;
				width: auto;
				margin-left: 10px;
				margin-top: 0;
				margin-right: 3.5rem;
				margin-bottom: 1rem;
				text-align: left;
			}
			.booking_types {
				list-style-type: none;
				padding: 0;
				margin: 0;
				display: flex;
				justify-content: space-between;
				border: 1px solid #ccc;
				border-radius: 25px;
			}
			.booking_types li {
				flex: 1;
				text-align: center;
			}
			#general, #mileage{
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
				width: 145px;
			}
			#general:hover, #mileage:hover {
				text-decoration: underline;
				text-decoration-color: #1f0c59;
			}
			.active-button  {
				background-color: #1f0c59 !important;
				color: white !important;
				padding: 10px 20px !important;
				border-radius: 25px !important;
				border: 1px solid #1f0c59 !important;
				font-size: 16px !important;
				font-weight: bold !important;
				cursor: pointer !important;
			}
			.active-button:hover {
				text-decoration: underline !important;
				text-decoration-color: white !important;
			}
			.inner {
				position: absolute;
				transform: translateY(40%);
				left: 9px;
				top: 1px;
				opacity: 0.6;
				background:#fff;
				z-index:1;
			}
			#quick_booking {
				margin-left:20px;
				margin-right:40px;
				display: flex;
				justify-content: space-between;
				align-items: center;
				align-self: flex-start;
				width: 280px;
				height: 80px;
				padding:0px;
			}
			.quick_booking_button {
				flex: 1;
				text-align: center;
				margin: 0 5px;
				padding: 0px;
				border: none;
				background-color: white;
				cursor: pointer;
				font-size: 16px;
				color: #333;
				border-radius: 15px;
			}
			.quick_booking_button span {
				display:block;
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
				font-size: 42px;
				font-weight: bold;
			}
			#departure-text, #arrival-text {
				font-size: 15px;
				color: #666;
			}
			.popup {
				position: absolute;
				top: 250px;
				left: 0%;
				width: 740px;
				padding: 20px;
				background-color: white;
				border: 1px solid #ccc;
				box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
				border-radius: 15px;
				z-index:1000;
				list-style:none;
			}
			.airport-list {
				height:270px;
				overflow-y:auto;
			}
			.quick_booking_aligner {	
				display: flex;
				align-items: center;
				gap: 0px;
				width: 100%;
				max-width: 1300px;
				margin-left: -15px;
				margin-top: 35px;
			}
			.flatpickr-calendar {
				position: absolute !important;
				left: 35% !important;
				top : 560px !important;
				border-radius: 10px !important;
				box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1) !important;
				font-size: 16px !important;
			}
			p {
				font-size: 15px;
				color: #333;
			}
			#date_selection, #passenger_selection, #seats_selection{
				margin-right:40px;
			}
			#date_selection input, #passenger_selection button, #seats_selection button {
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
			#date_selection .date_wrap {
				position:relative;
				width: 310px;
			}
			#date_selection .date_wrap i {
				position:absolute;
				top:18px;
				left:0;
				font-size:18px;
				color:#333;
			}
			#date_selection .date_wrap input {
				width:100%;
				padding-left:30px;
			}
			#date-btn {
				display: flex;
				align-items: center;
				padding-right: 10px;
			}
			#date-btn i {
				font-size: 18px;
				margin-right: 10px;
				color: #333;
			}
			#passenger_selection button {
				width: 160px;
			}
			#passenger-btn {
				display: flex;
				align-items: center;
				justify-content: space-between;
			}
			#passenger-btn i {
				position: absolute;
				top: 169px;
				right: 470px;
				font-size: 18px;
				color: #333;
			}
			#seats_selection button {
				width: 160px;
			}
			#seats-btn {
				display: flex;
				align-items: center;
				justify-content: space-between;
			}
			#seats-btn i {
				font-size: 18px;
				color: #333;
			}
			.passenger-popup {
				position: absolute;
				top: 250px;
				left: 40%;
				width: 740px;
				padding: 20px;
				background-color: white;
				border: 1px solid #ccc;
				box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
				z-index: 1000;
				border-radius: 15px;
			}
			.passenger-counter {
				display: flex;
				justify-content: space-around;
				align-items: center;
			}
			.passenger-type {
				display: flex;
				align-items: center;
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
				margin: 0 10px;
			}
			.seats-popup {
				position: absolute;
				top: 250px;
				left: 40%;
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
			input[name="t_methods"] {
				display: none;
			}
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
			input[name="t_methods"]:checked + label {
				font-weight: bold;
				color: black;
			}
			input[name="t_methods"]:checked + label::after {
				content: "";
				display: block;
				width: 80%;
				height: 3px;
				background-color: red;
				position: absolute;
				bottom: -2px;
				left: 10%;
			}
			#search_button {
				width: 150px;
				background-color: #1f0c59;
				color: white;
				padding: 10px 30px;
				border: none;
				border-radius: 15px;
				cursor: pointer;
				height: 50px;
				font-size: 16px;
				margin-left: 10px;
				margin-bottom:5px;
			}
			#search_airline {
				display: flex;
				justify-content: flex-start;
				align-self: flex-end;
				align-items: center;
			}
			#airport-list li, #arrival-list li {
				list-style-type: none;
				padding: 10px;
				background-color: white;
				border-bottom: 1px solid #ddd;
				cursor: pointer;
				font-size: 16px;
				color: #333;
				transition: background-color 0.3s ease;
			}
			#airport-list li:hover, #arrival-list li:hover {
				background-color: #e0e0e0;
				color: #000;
			}
			#airport-list li.selected, #arrival-list li.selected {
				background-color: #1f0c59;
				color: white;
			}
			#airport-list li::before, #arrival-list li::before {
				content: "\f072";
				font-family: "Font Awesome 5 Free";
				margin-right: 10px;
				font-weight: 900;
			}
			#login-popup{
				width:500px;
				height:500px;
				background-color:white;
				z-index:white;
			}
			.popup-overlay {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.7);
				z-index: 999;
			}
			.login-popup {
				position: fixed;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				z-index: 1000;
				width: 400px;
				background-color: white;
				padding: 20px;
				border-radius: 10px;
				box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
			}
			.login-popup-content {
				position: relative;
			}
			.close-btn {
				position: absolute;
				top: 10px;
				right: 10px;
				font-size: 24px;
				cursor: pointer;
				color: #333;
			}
			.login-close-btn{
				position: absolute;
				top: -5px;
				right: -5px;
				font-size: 24px;
				cursor: pointer;
				color: #333;
			}
			.input-group {
				position: relative;
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
			form {
				margin-top:20px;
			}
			h3 {
				margin-bottom: 20px;
				font-size: 22px;
				font-weight: 800;
			}
			.fade-in-section {
				width: 100%;
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
				background-color: #D0E7F6;
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
			.airport-code {
				font-weight: bold;
			}
		</style>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
		<script src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/l10n/ko.js"></script>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				const generalButton = document.getElementById('general');
				const mileageButton = document.getElementById('mileage');
				generalButton.classList.add('active-button');
				generalButton.addEventListener('click', function() {
					generalButton.classList.add('active-button');
					generalButton.classList.add('active-button:hover');
					mileageButton.classList.remove('active-button');
					mileageButton.classList.remove('active-button:hover');
				});
			});
			function openPopup(type) {
				closeAllPopups();
				if (type === 'passenger') {
					document.getElementById('passenger-selection-popup').style.display = 'block';
				} else if (type === 'departure') {
					document.getElementById('popup').style.display = 'block';
					loadDeparture();
				} else if (type === 'arrival') {
					document.getElementById('arrival-popup').style.display = 'block';
					loadArrival();
				}
			}
			function closeAllPopups() {
				document.getElementById('passenger-selection-popup').style.display = 'none';
				document.getElementById('popup').style.display = 'none';  
				document.getElementById('arrival-popup').style.display = 'none';  
				document.getElementById('seats-popup').style.display = 'none';
			}
			function closePopup(type) {
				if (type === 'passenger') {
					document.getElementById('passenger-selection-popup').style.display = 'none';
				} else if (type === 'departure') {
					document.getElementById('popup').style.display = 'none';
				} else if (type === 'arrival') {
					document.getElementById('arrival-popup').style.display = 'none';
				} else if (type === 'seats') {
					document.getElementById('seats-popup').style.display = 'none';
				}
			}
			document.addEventListener('click', function(event) {
				const passengerPopup = document.getElementById('passenger-selection-popup');
				const seatPopup = document.getElementById('seats-popup');
				const seatSelectBtn = document.getElementById('seats-btn');
				const passengerBtn = document.getElementById('passenger-btn');
				if (passengerPopup.style.display === 'block' && !passengerPopup.contains(event.target) && event.target !== passengerBtn) {
					passengerPopup.style.display = 'none';
				}
				if (seatPopup.style.display === 'block' && !seatPopup.contains(event.target) && event.target !== seatSelectBtn) {
					seatPopup.style.display = 'none';
				}
			});
			document.addEventListener('DOMContentLoaded', function () {
				const seatSelectBtn = document.getElementById('seats-btn');
				const seatPopup = document.getElementById('seats-popup');
				seatSelectBtn.addEventListener('click', function(event) {
					event.stopPropagation();
					seatPopup.style.display = seatPopup.style.display === 'block' ? 'none' : 'block';
				});
				window.selectSeat = function(seatType) {
					document.querySelector('#seats-btn span').innerText = seatType;
					document.getElementById('seatClass-hidden').value = seatType;
					seatPopup.style.display = 'none';
				}
			});
			document.addEventListener('DOMContentLoaded', function () {
				loadDeparture();
			});
			function loadDeparture() {
				var xhr = new XMLHttpRequest();
				xhr.open('GET', '/api/flights/airports');
				xhr.onreadystatechange = function() {
					if (xhr.readyState === 4 && xhr.status === 200) {
						var data = JSON.parse(xhr.responseText);
						var airportList = document.getElementById('airport-list');
						if (airportList) {
							airportList.innerHTML = '';
							var defaultAirport = data.find(airport => airport.airportCode === 'SEL');
							if (defaultAirport) {
								document.getElementById('from-text').textContent = defaultAirport.airportCode;
								document.getElementById('departure-text').textContent = defaultAirport.city + '/' + defaultAirport.detailedCity;
							} else {
								document.getElementById('from-text').textContent = 'SEL';
								document.getElementById('departure-text').textContent = '서울';
							}
							data.forEach(function(airport) {
								var li = document.createElement('li');
								var airportCode = document.createElement('span');
								airportCode.classList.add('airport-code');
								airportCode.textContent = airport.airportCode;
								var airportInfo = document.createElement('span');
								if (airport.detailedCity == 'null' || airport.detailedCity == null) {
									airportInfo.textContent = ' ' + airport.city + ', ' + airport.country;
								} else {
									airportInfo.textContent = ' ' + airport.city + '/' + airport.detailedCity + ', ' + airport.country;
								}
								li.appendChild(airportCode);
								li.appendChild(airportInfo);
								li.onclick = function() {
									document.getElementById('from-text').textContent = airport.airportCode;
									if (airport.detailedCity == 'null' || airport.detailedCity == null) {
										document.getElementById('departure-text').textContent = airport.city;
									} else {
										document.getElementById('departure-text').textContent = airport.city + '/' + airport.detailedCity;
									}
									document.getElementById('from-hidden').value = airport.airportCode;
									closePopup('departure');
								};
								airportList.appendChild(li);
							});
						} else {
							console.error('The element with id "airport-list" is not found.');
						}
					} else if (xhr.readyState === 4 && xhr.status !== 200) {
						console.error('Failed to load airports data. Status: ' + xhr.status);
						document.getElementById('from-text').textContent = 'SEL';
						document.getElementById('departure-text').textContent = '서울';
					}
				};
				xhr.onerror = function() {
					console.error('Request failed');
					document.getElementById('from-text').textContent = 'SEL';
					document.getElementById('departure-text').textContent = '서울';
				};
				xhr.send();
			}
			document.addEventListener('DOMContentLoaded', function () {
				loadArrival();
			});
			function loadArrival() {
				var xhr = new XMLHttpRequest();
				xhr.open('GET', '/api/flights/airports');
				xhr.onload = function() {
					var data = JSON.parse(xhr.responseText);
					var airportList = document.getElementById('arrival-list');
					airportList.innerHTML = '';
					data.forEach(function(airport) {
						var li = document.createElement('li');
						var airportCode = document.createElement('span');
						airportCode.classList.add('airport-code');
						airportCode.textContent = airport.airportCode;
						var airportInfo = document.createElement('span');
						if (airport.detailedCity == 'null' || airport.detailedCity == null) {
							airportInfo.textContent = ' ' + airport.city + ', ' + airport.country;
						} else {
							airportInfo.textContent = ' ' + airport.city + '/' + airport.detailedCity + ', ' + airport.country;
						}
						li.appendChild(airportCode);
						li.appendChild(airportInfo);
						li.onclick = function() {
							document.getElementById('to-text').textContent = airport.airportCode;
							if (airport.detailedCity == 'null' || airport.detailedCity == null) {
								document.getElementById('arrival-text').textContent = airport.city;
							} else {
								document.getElementById('arrival-text').textContent = airport.city + '/' + airport.detailedCity;
							}
							document.getElementById('to-hidden').value = airport.airportCode;
							console.log("도착지 설정됨: " + airport.airportCode);
							closePopup('arrival');
						};
						airportList.appendChild(li);
					});
				};
				xhr.send();
			}
			document.addEventListener('DOMContentLoaded', function () {
				const bookingButton = document.getElementById('booking');
				showContent('booking');
				document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
					el.classList.remove('active');
				});
				bookingButton.parentNode.classList.add('active');
				function activateMenu(event) {
					document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
						el.classList.remove('active');
					});
					event.currentTarget.parentNode.classList.add('active');
				}
				document.querySelectorAll('.booking_widget_list li button').forEach(function(button) {
					button.addEventListener('click', activateMenu);
				});
				var tripMethod = "round";
				var calendar = flatpickr("#date-btn", {
					locale: "ko",
					mode: "range",
					dateFormat: "Y-m-d",
					showMonths: 2,
					onChange: function(selectedDates, dateStr, instance) {
						if (tripMethod === "round" && selectedDates.length === 2) {
							document.getElementById('date-btn').value = 
								selectedDates[0].toLocaleDateString() + 
								" ~ " + selectedDates[1].toLocaleDateString();
							document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
							document.getElementById('arrivalDate-hidden').value = instance.formatDate(selectedDates[1], "Y-m-d");
						} else if (tripMethod === "one-way" && selectedDates.length === 1) {
							document.getElementById('date-btn').value = 
								"가는 날: " + selectedDates[0].toLocaleDateString();
							document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
							document.getElementById('arrivalDate-hidden').value = "";
						}
					}
				});
				var tripMethods = document.querySelectorAll('input[name="t_methods"]');
				tripMethods.forEach(function (radio) {
					radio.addEventListener('change', function () {
						var dateInput = document.getElementById('date-btn');
						if (this.value === "round") {
							tripMethod = "round";
							calendar = flatpickr("#date-btn", {
								locale: "ko",
								mode: "range",
								dateFormat: "Y-m-d",
								showMonths: 2,
								defaultDate: "today",
								onChange: function (selectedDates, dateStr, instance) {
									if (selectedDates.length === 2) {
										dateInput.value = selectedDates[0].toLocaleDateString() + " ~ " + selectedDates[1].toLocaleDateString();
										document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
										document.getElementById('arrivalDate-hidden').value = instance.formatDate(selectedDates[1], "Y-m-d");
									}
								}
							});
							dateInput.placeholder = "가는 날 ~ 오는 날";
						} else if (this.value === "one-way") {
							tripMethod = "one-way";
							calendar = flatpickr("#date-btn", {
								locale: "ko",
								mode: "single",
								dateFormat: "Y-m-d",
								showMonths: 2,
								defaultDate: "today",
								onChange: function (selectedDates, dateStr, instance) {
									if (selectedDates.length === 1) {
										dateInput.value = "가는 날: " + selectedDates[0].toLocaleDateString();
										document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
										document.getElementById('arrivalDate-hidden').value = "";
									}
								}
							});
							dateInput.placeholder = "가는 날";
						}
					});
				});
			});
			document.addEventListener('DOMContentLoaded', function() {
				flatpickr("#date", {
					locale: "ko",
					dateFormat: "Y-m-d",
					allowInput: true,
					showMonths: 2,
					maxDate: new Date().fp_incr(365)
				});
			});
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
			function updateButtonTextWithIcon(buttonId, newText) {
				var button = document.getElementById(buttonId);
				var icon = button.querySelector('i');
				var span = button.querySelector('span');
				if (span) {
					span.textContent = newText;
				}
				if (icon) {
					button.appendChild(icon);
				}
			}
			function updatePassengerButton() {
				var adultCount = parseInt(document.getElementById('adult-count').textContent, 10) || 0;
				var childCount = parseInt(document.getElementById('child-count').textContent, 10) || 0;
				var infantCount = parseInt(document.getElementById('infant-count').textContent, 10) || 0;
				var passengerText = '성인 ' + adultCount + '명';
				var additionalPassengers = [];
				if (childCount > 0) {
					additionalPassengers.push('소아');
				}
				if (infantCount > 0) {
					additionalPassengers.push('유아');
				}
				if (additionalPassengers.length > 0) {
					if (additionalPassengers.length === 1) {
						passengerText += ', ' + additionalPassengers[0] + '···';
					} else {
						passengerText += ', ' + additionalPassengers[0] + '···';
					}
				}
				document.getElementById('passenger-btn').innerHTML = passengerText;
				var passengerBtn = document.getElementById('passenger-btn');
				passengerBtn.innerHTML = '';
				var icon = document.createElement('i');
				icon.className = 'fa-regular fa-user';
				passengerBtn.appendChild(icon);
				passengerBtn.append(' ' + passengerText);
				var passengersValue = adultCount + childCount;
				document.getElementById('passenger-hidden').value = passengersValue;
				document.getElementById('adult-hidden').value = adultCount;
				document.getElementById('child-hidden').value = childCount;
				document.getElementById('infant-hidden').value = infantCount;
			}
			document.addEventListener('DOMContentLoaded', function() {
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
				updatePassengerButton();
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
				updatePassengerButton();
			}
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
			$(function() {
				var currentURL = window.location.pathname;
				var referrerURL = document.referrer ? (new URL(document.referrer)).pathname : '';
				function isIndex(url) {
					return url === '/' || url.endsWith('/index') || url.endsWith('/index.html') || url.endsWith('/index.php');
				}
				if (isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
					$('.main_content').slideDown(1000);
				} else if (!isIndex(currentURL) && isIndex(referrerURL)) {
					$('.main_content').slideUp(500);
				} else if (!isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
				} else {
					$('.main_content').show();
				}
			});
			function checkLoginStatus(event) {
				fetch('/checkLoginStatus')
					.then(response => response.json())
					.then(isLoggedIn => {
						if (isLoggedIn) {
							activateMileageButton();
						} else {
							event.preventDefault();
							openLoginPopup();
						}
					});
			}
			function activateMileageButton() {
				const generalButton = document.getElementById('general');
				const mileageButton = document.getElementById('mileage');
				mileageButton.classList.add('active-button');
				mileageButton.classList.add('active-button:hover');
				generalButton.classList.remove('active-button');
				generalButton.classList.remove('active-button:hover');
			}
			function login() {
				closeLoginPopup();
				activateMileageButton();
				console.log('로그인 성공');
			}
			function openLoginPopup() {
				document.getElementById('login-popup').style.display = 'block';
				document.getElementById('popup-overlay').style.display = 'block';
			}
			function closeLoginPopup() {
				document.getElementById('login-popup').style.display = 'none';
				document.getElementById('popup-overlay').style.display = 'none';
			}
			function check(my)
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
						document.getElementsByClassName("inner")[n].style.style="#1f0c59";
						document.getElementsByClassName("inner")[n].style.fontWeight="bold";
						document.getElementsByClassName("inner")[n].style.paddingLeft="2px";
						document.getElementsByClassName("inner")[n].style.paddingRight="2px";
						if(n== 0)
						{document.getElementsByClassName("inner")[n].textContent = "아이디 *";}
						else
						{document.getElementsByClassName("inner")[n].textContent = "비밀번호 *";}
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
						document.getElementsByClassName("inner")[n].style.style="#333";
						if(n== 0)
						{document.getElementsByClassName("inner")[n].textContent = "아이디";}
						else
						{document.getElementsByClassName("inner")[n].textContent = "비밀번호";}
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
			function selectDeparture(airportCode, city) {
				document.getElementById('from-text').textContent = airport.airportCode;
				document.getElementById('departure-text').textContent = city;
				document.getElementById('from-hidden').value = airport.airportCode;
				console.log("출발지 설정: " + airport.airportCode);
				closePopup('departure');
			}
			function selectArrival(airportCode, city) {
				document.getElementById('to-text').textContent = airportCode;
				document.getElementById('arrival-text').textContent = city;
				document.getElementById('to-hidden').value = airportCode;
				console.log("도착지 설정: " + airportCode);
				closePopup('arrival');
			}
			function getDayOfWeek(day) {
				const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
				return weekdays[day];
			}
			function getDateOptions() {
				const select = document.getElementById('cdate');
				const today = new Date();
				for (var i = -1; i <= 2; i++) {
					var optionDate = new Date();
					optionDate.setDate(today.getDate() + i);
					var year = optionDate.getFullYear();
					var month = ('0' + (optionDate.getMonth() + 1)).slice(-2);
					var day = ('0' + optionDate.getDate()).slice(-2);
					var dayOfWeek = getDayOfWeek(optionDate.getDay());
					var dateString = year+"-"+month+"-"+day+" ("+dayOfWeek+")";
					var dateValue = year+"-"+month+"-"+day;
					var option = document.createElement('option');
					option.value = dateValue;
					option.textContent = dateString;
					select.appendChild(option);
				}
			}
			document.addEventListener('DOMContentLoaded', function() {
				getDateOptions();
			});
			function enforceUppercase(element) {
				element.value = element.value.toUpperCase();
				element.value = element.value.replace(/[^A-Z]/g, '');
			}
			function validateCheckbox() {
			    var checkbox = document.getElementById('agree-contents');
			    var agreeErrorMessage = document.getElementById('agreeContentsErrorMessage');
			    var inputErrorMessages = document.getElementsByClassName('inputContentsErrorMessage');

			    // 체크박스 검증
			    if (!checkbox.checked) {
			        agreeErrorMessage.style.visibility = 'visible';
			    } else {
			        agreeErrorMessage.style.visibility = 'hidden';
			    }

			    // 필수 입력 필드가 비어 있을 경우 경고 문구 표시
			    var isValid = true;
			    var requiredFields = document.querySelectorAll('#form1 input[required]');
			    requiredFields.forEach(function(input, index) {
			        if (input.value.trim() === '') {
			            inputErrorMessages[index].style.visibility = 'visible';
			            isValid = false;
			        } else {
			            inputErrorMessages[index].style.visibility = 'hidden';
			        }
			    });

			    // 체크박스와 모든 필드가 유효한 경우 폼 제출
			    if (isValid && checkbox.checked) {
			        document.getElementById('form1').submit();
			    }
			}
			
			function checkSelectionDetails() {
			    var pnr = document.getElementById("pnr").value;
			    var sung = document.getElementById("sung").value;
			    var name = document.getElementById("name").value;
			    var date = document.getElementById("date").value;
			    
			 // 각 변수 값 출력
			    console.log("PNR:", pnr);
			    console.log("성:", sung);
			    console.log("이름:", name);
			    console.log("날짜:", date);


			 // URL 생성 후 확인
				const requestUrl = "/api/check-reservation?pnr=" + pnr + "&sung=" + sung + "&name=" + name + "&date=" + date;
				console.log("Direct Request URL:", requestUrl);

			    // XMLHttpRequest 객체 생성
			    const xhr = new XMLHttpRequest();
			    xhr.open("GET", requestUrl, true);

			    xhr.onreadystatechange = function () {
			        if (xhr.readyState === 4) {
			            if (xhr.status === 200) {
			                const data = JSON.parse(xhr.responseText);
			                console.log("Response Data:", data);
			                if (data.exists) {
			                    document.getElementById("form1").submit();
			                } else {
			                    alert("조회 가능한 예약 정보가 없습니다.");
			                }
			            } else {
			                console.error("Error:", xhr.statusText);
			                alert("조회 중 오류가 발생했습니다.");
			            }
			        }
			    };

			    // 요청 전송
			    xhr.send();

			    return false; // 기본 폼 제출 막기
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
									<button type="button" onclick="showContent('booking')" id="booking">
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
												<button type="button" id="mileage" onclick="checkLoginStatus(event)">마일리지 예매</button>
										</ul>
									</div>
									<div id="popup-overlay" class="popup-overlay" style="display: none;"></div>
									<div id="login-popup" class="login-popup" style="display: none;">
										<div class="login-popup-content">
											<span class="login-close-btn" onclick="closeLoginPopup()">&times;</span>
											<h2>로그인</h2>
											<form method="post" action="/login" onsubmit="return check(this);">
												<div class="input-group">
													<div>
														<div class="inner">아이디</div>
														<input type="text" name="userid" id="txt"  onfocus="sizedown(0)" onblur="init(this,0)" required>
													</div>
												</div>
												<div> </div>
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
												<a href="../member/usForm">아이디 찾기</a> | 
												<a href="../member/psForm">비밀번호 찾기</a>
											</div>    
										</div>
									</div>
									<form action="${pageContext.request.contextPath}/flights/search" method="get">
										<div id="trip-methods" class="trip-methods">
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
													<img src="../static/resources/booking_reverse.png" width="40px" height="40px">
												</button>
												<button type="button" class="quick_booking_button" onclick="openPopup('arrival')">
													<span id="to-text">To</span> 
													<span id="arrival-text">&nbsp;도착지</span>
												</button>
											</div>
											<div id="popup" class="popup" style="display: none;">
												<span class="close-btn" onclick="closePopup('departure')">&times;</span>
												<h2>출발지 선택</h2>
												<ul id="airport-list" class="airport-list"></ul>
											</div>
											<div id="arrival-popup" class="popup" style="display: none;">
												<span class="close-btn" onclick="closePopup('arrival')">&times;</span>
												<h2>도착지 선택</h2>
												<ul id="arrival-list" class="airport-list"></ul>
											</div>
											<input type="hidden" name="departure" id="from-hidden">
											<input type="hidden" name="arrival" id="to-hidden">
											<div id="date_selection">
												<p>출발일&nbsp;</p>
												<div class="date_wrap">
													<i class="fa-regular fa-calendar"></i>
													<input type="text" id="date-btn" placeholder="가는 날 ~ 오는 날">
												</div>
											</div>
											<input type="hidden" name="departureDate" id="departureDate-hidden">
											<input type="hidden" name="arrivalDate" id="arrivalDate-hidden">
											<div id="passenger_selection">
												<p>탑승객&nbsp;</p>
												<button type="button" id="passenger-btn" onclick="openPopup('passenger')">
													<span>인원수</span>
													<i class="fa-regular fa-user"></i>
												</button>
											</div>
											<input type="hidden" name="passengers" id="passenger-hidden">
											<input type="hidden" name="adultCount" id="adult-hidden" value="1">
											<input type="hidden" name="childCount" id="child-hidden" value="0">
											<input type="hidden" name="infantCount" id="infant-hidden" value="0">
											<div id="passenger-selection-popup" class="passenger-popup" style="display: none;">
												<span class="close-btn" onclick="closePopup('passenger')">&times;</span>
												<h2>승객 선택</h2>
												<div class="passenger-counter">
													<div class="passenger-type">
														<h4>성인</h4>
														<button type="button" class="decrease-btn" onclick="decrease('adult')">-</button>
														<span id="adult-count">1</span>
														<button type="button"class="increase-btn" onclick="increase('adult')">+</button>
													</div>
													<div class="passenger-type">
														<h4>소아</h4>
														<button type="button" class="decrease-btn" onclick="decrease('child')">-</button>
														<span id="child-count">0</span>
														<button type="button" class="increase-btn" onclick="increase('child')">+</button>
													</div>
													<div class="passenger-type">
														<h4>유아</h4>
														<button type="button" class="decrease-btn" onclick="decrease('infant')">-</button>
														<span id="infant-count">0</span>
														<button type="button" class="increase-btn" onclick="increase('infant')">+</button>
													</div>
												</div>
											</div>
											<div id="seats_selection">
												<p>좌석등급&nbsp;</p>
												<button type="button" id="seats-btn">
													<span>선택하세요</span>
													<i class="fas fa-ellipsis-v"></i>
												</button>
											</div>
											<input type="hidden" name="seatClass" id="seatClass-hidden">
											<div id="seats-popup" class="seats-popup" style="display: none;">
												<span class="close-btn" onclick="closePopup('seats')">&times;</span>
												<h2>좌석 등급 선택</h2>
												<div class="seat-options">
													<button type="button" onclick="selectSeat('일반석')">일반석</button>
													<button type="button" onclick="selectSeat('프레스티지석')">프레스티지석</button>
													<button type="button" onclick="selectSeat('일등석')">일등석</button>
												</div>
											</div>
											<div id="search_airline">
												<button type="submit" id="search_button">
													<span>항공편 검색</span>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="select_contents">
								<form id="form1" action="${pageContext.request.contextPath}/select/selection" method="get" onsubmit="return checkSelectionDetails();">
									<div id="select methods">
										<div class="select_info_aligner">
											<div id="select_number">
												<p>예약번호 또는 항공권번호&nbsp;</p>
												<input type="text" id="pnr" name="pnr" placeholder="예) A1B2C3 또는 1801234567890" required>
												<div class="inputContentsErrorMessage" style="color: red; font-size: 14px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div>
											</div>
											<div id="select_date">
												<p>출발일&nbsp;</p>
												<input type="text" id="date" name="date" required>
												<div class="inputContentsErrorMessage" style="color: red; font-size: 14px; margin-top:5px; visibility: hidden;">
											필수 입력 항목입니다.
										</div>
											</div>
											<div id="select_sung">
												<p>승객 성&nbsp;</p>
												<input type="text" id="sung" name="sung" required oninput="enforceUppercase(this)">
												<div class="inputContentsErrorMessage" style="color: red; font-size: 14px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div>
											</div>
											<div id="select_name">
												<p>승객 이름&nbsp;</p>
												<input type="text" id="name" name="name" required oninput="enforceUppercase(this)">
												<div class="inputContentsErrorMessage" style="color: red; font-size: 14px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div>
											</div>
											<div id="select_selection">
												<button type="submit" id="select_button" onclick="validateCheckbox()">
													<span>조회</span>
												</button>
											</div>
										</div>
										<div id="select_agree_contents">
											<input type="checkbox" id="agree-contents" required> 
											<label for="agree-contents">[필수] 본인의 예약 정보이거나 승객으로부터 조회를 위임 받은 예약 정보 입니다.</label>
										</div>
										<div id="agreeContentsErrorMessage" style="color: red; font-size: 14px; margin-left:25px; margin-top:5px; visibility: hidden; ">
											필수 동의 항목입니다.
										</div>
									</div>
								</form>
							</div>
							<style>
								.select_contents, .check-in_contents {
									display: flex;
									justify-content: center;
									align-items: center;
								}
								#select_methods, #check-in_methods {
									display: flex;
									flex-direction: column;
									justify-content: center;
									align-items: center;
									width: 80%;
								}
								.select_info_aligner, .check-in_info_aligner{
									display: grid;
									grid-template-columns: repeat(5, 1fr);
									gap: 5px;
									width: 110%;   
									align-items: center;
									margin-left: 0px;
									margin-top: 36px;
								}
								#select_number, #select_date, #select_sung, #select_name, #check-in_number, #check-in_date. #check-in_sung, #check-int_name {
									display: flex;
									flex-direction: column;
									align-items: flex-start;
								}
								#select_number, #check-in_number {
									width:85%;
								}
								#select_date, #check-in_date {
									margin-left: 55px;
									width:95%;
								}
								#select_sung, #check-in_sung {
									margin-left: 75px;
									width:85%
								}
								#select_name, #check-in_name {
									margin-left: 50px;
									width:85%
								}
								#select_number input, #check-in_number input {
									width: 130%;
									border: none;
									border-bottom: 1px solid black;
									margin-top:20px;
									padding-bottom: 10px;
									padding-top:10px;
									padding-right:10px;
								}
								#select_number input::placeholder, #check-in_number input::placeholder {
									font-size: 16px;
									padding-left: -10px;
								}
								#select_sung input, #select_name input, #check-in_sung input, #check-in_name input {
									width: 90%;
									border: none;
									border-bottom: 1px solid black;
									padding: 10px;
									margin-top:15px;
								}
								#date, #cdate{
									width: 100%;
									border: none;
									border-bottom: 1px solid black;
									padding: 10px;
									margin-top:15px;
									background-color: white;
									cursor: pointer;
									margin-right:30px;
								}
								#select_selection, #check-in_selection {
									display: flex;
									justify-content: flex-start;
									align-self: flex-end;
									align-items: center;
								}
								#select_button, #cselect_button {
									width: 115px;
									background-color: #1f0c59;
									color: white;
									padding: 10px 20px;
									border: none;
									border-radius: 15px;
									cursor: pointer;
									height: 45px;
									font-size: 16px;
									margin-left:25px;
								}
								#select_button:hover, #check-in_button:hover {
									background-color: #0055a5;
								}
								#select_agree_contents, #check-in_agree_contents {
									margin-top: 10px;
									text-align: left;
									font-size: 14px;
								}
								#select_agree_contents input, #check-in_agree_contents input {
									margin-right: 10px;
									width: 13px;
									height: 13px;
									transform: scale(1.5);
									cursor: pointer;
								}
								#daselect, #week_schedule {
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
								.s_methodbox {
									float: left;
									width: 240px;
									margin-left: 10px;
									margin-top: 0;
									margin-right: 3.5rem;
									margin-bottom: 1rem;
									text-align: left;
								}
							</style>
							<div class="check-in_contents">
								<form action="${pageContext.request.contextPath}/checkin/check-in" method="get" >
									<div id="check-in methods">
										<div class="check-in_info_aligner">
											<div id="check-in_number">
												<p>예약번호 또는 항공권번호&nbsp;</p>
												<input type="text" id="cselect_num" placeholder="예) A1B2C3 또는 1801234567890" required>
											</div>
											<div id="check-in_date">
												<p>출발일&nbsp;</p>
												<select id="cdate" required></select>
											</div>
											<div id="check-in_sung">
												<p>승객 성&nbsp;</p>
												<input type="text" id="csung" required>
											</div>
											<div id="check-in_name">
												<p>승객 이름&nbsp;</p>
												<input type="text" id="cname" required>
												
											</div>
											<div id="check-in_selection">
												<button type="submit" id="cselect_button">
													<span>조회</span>
												</button>
											</div>
										</div>
										<div id="check-in_agree_contents">
											<input type="checkbox" id="cagree-contents" required> 
											<label for="cagree-contents">[필수] 본인의 예약 정보이거나 승객으로부터 조회를 위임 받은 예약 정보 입니다.</label>
											<div class="agreeContentsErrorMessage" style="color: red;">
												필수 동의 항목입니다.
											</div>
										
										</div>
									</div>
								</form>
							</div>
							<div class="schedule_contents">
								<div class="schedule_methods">
									<div class="s_methodbox">
										<ul class="booking_types">
											<li>
												<button type="button" id="daselect">출도착<br>조회</button>
											</li>
											<li>
												<button type="button" id="week_schedule" >주간<br>스케줄</button>
										</ul>
									</div>
									<form action="${pageContext.request.contextPath}/select/schedule" method="get">
										<div id="trip-methods" class="trip-methods">
											<input type="radio" name="s_methods" id="round-trip" checked> 
											<label for="round-trip">출/도착지</label>
											<input type="radio" name="s_methods" id="one-way"> 
											<label for="one-way">편명</label>
										</div>
										<div class="quick_booking_aligner">
											<div id="quick_booking">
												<button type="button" class="quick_booking_button" onclick="openPopup('departure')">
													<span id="from-text">From</span> 
													<span id="departure-text">&nbsp;출발지</span>
												</button>
												<button type="button" class="quick_booking_button circle_button">
													<img src="../static/resources/booking_reverse.png" width="40px" height="40px">
												</button>
												<button type="button" class="quick_booking_button" onclick="openPopup('arrival')">
													<span id="to-text">To</span> 
													<span id="arrival-text">&nbsp;도착지</span>
												</button>
											</div>
											<div id="popup" class="popup" style="display: none;">
												<span class="close-btn" onclick="closePopup('departure')">&times;</span>
												<h2>출발지 선택</h2>
												<ul id="airport-list" class="airport-list"></ul>
											</div>
											<div id="arrival-popup" class="popup" style="display: none;">
												<span class="close-btn" onclick="closePopup('arrival')">&times;</span>
												<h2>도착지 선택</h2>
												<ul id="arrival-list" class="airport-list"></ul>
											</div>
											<div id="date_selection">
												<p>출발일&nbsp;</p>
												<div class="date_wrap">
													<i class="fa-regular fa-calendar"></i>
													<input type="text" id="date-btn">
												</div>
											</div>
											<input type="hidden" name="departureDate" id="departureDate-hidden">
											<input type="hidden" name="arrivalDate" id="arrivalDate-hidden">
											<div id="search_airline">
												<button type="submit" id="search_button">
													<span>조회</span>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
		<section id="sec2" class="sec2 promotion-section fade-in-section">
			<h3 style="text-align: center;">특가 프로모션</h3>
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
		<section id="sec3" class="sec3 customer-review-section fade-in-section">
			<h3 style="text-align: center;">고객 후기</h3>
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