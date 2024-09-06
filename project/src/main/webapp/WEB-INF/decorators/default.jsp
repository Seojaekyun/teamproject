<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

*
{
	margin:0px;
}

body
{
	margin:0;
}




/*1층과 2층 header 메인메뉴 */
header{

	width:100%;
	margin:auto;
	
	
	/*border: 1px solid black;*/
	

}

	
	/*header 내 1층 첫번째 메뉴 (로고와 회원메뉴 )*/
	#section1	
	{
		width:100%;
		/*border: 1px solid black;*/
		height:80px;
		margin:auto;
		margin-button:0px;
		
		
		justify-content: space-between; /* 먼가 가운데 블럭을 준다  */
		
        align-items: center; /* 위아래에서 똑같은 가운데에서 구현*/
		
		display:flex; /* 디바이스를 가로 정렬할때 좋다*/
		
		/*background:#F3E5F5;*/
	}
	
			/* 로고 디자인 */
			#section1 #logo
			{
				width:200px;
				height:75px;
				margin-left:50px;
				 /*border:1px solid black;*/
				
				
			}
			
			
			/* 로그인 메뉴 디자인 */	
			#section1 #loginMenu
			{
				width:375px;
				/* border:1px solid black; */
		
			}
		
				/*로그인 메뉴 a태그 디자인*/
				#section1 #loginMenu a
				{
					text-decoration:none;
					color:black;
			
				}
			
			
				/*로그인 메뉴 a태그에 마우스가 올라갔을 때 디자인*/
				#section1 #loginMenu a:hover {
				
					text-decoration: underline;
    				color: green;
			
				}
				
				
				#section1 #loginMenu #memberMenu {  /* ul */
						
						
    					position: absolute;
    					left:1670px;
    					top:52px;
    					padding-left: 0;
    					width: 110px;
    					background: white;
    					display: none;
    					z-index: 10; /* 다른 요소들 위에 표시되도록 설정 */
    					box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    					
    					
    					
    					
					}
					
					
				#section1 #loginMenu #memberMenu >li {
						list-style-type: none;
   	 					width: 110px;
    					height: 30px;
    					line-height: 30px;
    					text-align: center;
    					cursor: pointer;
    					border-bottom: 1px solid #ddd;
				}
				
				#section1 #loginMenu #memberMenu >li:hover {
					
						text-decoration: underline;
						color:green;
				}
		
	
	header > nav
	{
		
		width:100%;
		/*border:1px solid black;*/
		
		/*background:#FFE0B2;*/
		
		height: 70px;
		margin:auto;
		line-height:50px;
		
	}


	header > nav a {
	
		text-decoration:none;	/* a태그 일때 밑줄 없애기 */
      	color:black;			/* a태그 일때 색을 바꾸기 */
	
	}
	
	header > nav a:hover {
		
		text-decoration:underline;		/* a태그 일때 마우스 커서 밑줄 생기기 */
		color:green;					/* a태그 일때 마우스 커서 색 바꾸기 */
	
	
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
	height: 503px;
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
    heigth: 70%; 
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
    height: 100ox;
    position: relative;
}


.booking_widget_list:before{
position: absolute;
    top: 0;
    left: 1.3rem;
    display: block;
    width: calc(100% - 2.6rem);
    height: 100%;
    content: none;
    background-color: #65728a;
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
    z-index:2;
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
}


</style>

<script>


/*메뉴바 마우스 커서 이동시 하위메뉴 등장 */
function viewMenu(n)
{
	   document.getElementsByClassName("menu")[n].style.visibility="visible";
}
function hideMenu(n)
{
	   document.getElementsByClassName("menu")[n].style.visibility="hidden";
}



/*고객센터 마우스 커서 이동시 하위메뉴 등장*/
function viewMy() {
    document.getElementById("memberMenu").style.display="block"; // display를 block으로 설정하여 보여줌
}

function hideMy() {
    document.getElementById("memberMenu").style.display="none"; // display를 none으로 설정하여 숨김
}

</script>


 <sitemesh:write property="head"/>

</head>
<body>

<header>

	<div id="section1">
	
		<!-- 로고 -->
		<div id="logo">
			
			<!-- 로그 클릭시 홈페이지로 돌아오기 -->
			<a href ="../main/index">
			
				<!-- 로고 디자인 -->
			<img src="../static/resources/123.png" width="200px" height="75px">
		
			
			</a>
			
		</div>
		
		<!-- 회원가입 | 로그인 | 고객문의  -->
		<div id="loginMenu">
		
		
			<!-- 비회원 있을시 로그인 메뉴  -->
			<c:if test="${userid==null}">
			
			<!-- 회원가입 -->
			<a href="../member/member"> 회원가입 </a> |
			
			<!-- 로그인 -->
			<a href="../login/login"> 로그인 </a> |
			
			<!-- 고객문의 -->
			<span id="myInfo" onmouseover="viewMy()" onmouseout="hideMy()"> 고객서비스
                <ul id="memberMenu">
                    <li> 회원정보 </li>
                    <li> 예약정보 </li>
                    <li> 자유게시판 </li>
                </ul>
            </span>
			</c:if>
			
			
			<!-- 로그인 시 로그인 메뉴 -->
			<c:if test="${userid!=null}">
			
			<!-- 회원가입 -->
			<a href="../member/content"> XXX님 </a> |
			
			<!-- 로그인 -->
			<a href="../login/logout"> 로그아웃 </a> |
			
			<!-- 고객문의 -->
			<span id="myInfo" onmouseover="viewMy()" onmouseout="hideMy()"> 고객서비스
                <ul id="memberMenu">
                    <li> 회원정보 </li>
                    <li> 예약정보 </li>
                    <li> 자유게시판 </li>
                </ul>
            </span>
			</c:if>
			
			
			
			
		</div>
		
		
		</div>
	
	<nav>
	
		<ul id="main">
			<li onmouseover="viewMenu(0)" onmouseout="hideMenu(0)"> 예약
				<ul class="menu">
					<li> 
						<a href="../menu/index1">여행 준비</a> 
					</li>
					
					<li>
						<a href="../menu/index2">여행</a>
					</li>
					
					<li>
						<a href="../menu/index3">예약 취소</a>
					</li>
					
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
	<li id="booking_menu"> 
		<button type="button">
		<span> 항공권예매 </span> 
		</button>
	</li>
	<li id="booking_menu"> 
		<button type="button">
		<span> 예약조회 </span>
		</button>
	</li>
	
	<li id="booking_menu">
		<button type="button">
	 	<span> 체크인 </span>
	 	</button>
	</li>
	
	<li id="booking_menu"> 
		<button type="button">
		<span> 출도착/스케쥴 </span>
		</button>
	</li>
	</ul>
	<div class="booking_contents">
		<div id="trip methods">
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
                <td> 통신판매업신고 : 2023-경기비행-1234 </td>
                <td></td>
            </tr>
        </table>
    </footer>

</body>
</html>