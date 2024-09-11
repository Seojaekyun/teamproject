<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

body
{
	margin:0px;
}

section
{
	
	width: 1000px;
	height: 400px;
	border: 1px solid black;
	
	
}

.home-banner
{
	width:100%;
	background:#E0F7FA;
	margin:auto;
	padding-bottom:100px;
	padding-top:100px;
	
	position: relative;
	
}

		.search-box {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
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
        }

        .search-box button:hover {
            background-color: #45a049;
        }
	
	

.sec2
{
	background:#E0F2F1;
	margin:auto;
}

.sec3
{
	background:#EDE7F6;
	margin:auto;
}

.sec4
{
	bacrground:#FFF9E7;
	margin:auto;
}

</style>

<script>

</script>

</head>
<body>

	<section id=container class="home-banner">
	
	
	<form method="post" action="flightSearch">
		<div class="search-box">
		
    		<h3>항공기 검색</h3>
    		
    		<div>
        		<label for="departure">출발지</label>
        		<input type="text" id="departure" name="departure" placeholder="출발지 입력">
    		</div>
    		
    		<div>
        		<label for="arrival">도착지</label>
        		<input type="text" id="arrival" name="arrival" placeholder="도착지 입력">
    		</div>
    		
    		<div>
        		<label for="departure-date">출발일</label>
        		<input type="date" id="departure-date" name="departure-date">
    		</div>
    		
    		<div>
        		<label for="arrival-date">도착일</label>
        		<input type="date" id="arrival-date" name="arrival-date">
    		</div>
    		
    		
    		<button type="submit">항공기 검색</button>
    		
		</div>
		
	</form>
		
	</section>
	
	<section id=container class=sec2>
	2
	</section>
	
	<section id=container class=sec3>
	3
	</section>
	
	<section id=container class=sec4>
	4
	</section>

</body>
</html>