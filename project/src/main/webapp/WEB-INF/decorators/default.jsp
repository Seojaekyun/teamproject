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