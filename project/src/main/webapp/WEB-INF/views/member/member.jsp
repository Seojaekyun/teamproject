<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 	
 	form{
    width: 400px;
    height: 615px;
    border: 1px solid #D2D2D2;
    border-radius: .4rem;
    margin: auto;
    margin-top: 60px;
    margin-bottom: 100px;

 	}
 	
 	h3 {
 	font-size: 1.47em;
 	margin: 30px;
 
 	}
 	
 	.joinbox {
    width: 362px;
    height: 700px;
    margin: auto;
    list-style-type: none;
    padding-left: 0px;
	}
	
	h6 {
	margin-bottom: 7px;

	}
 	
 /* 	input {
 	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:40px;
    align: center;
 	}
*/

#name {
 	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:36px;
    align: center;
    margin-bottom:10px;
}

#userid {

 	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:36px;
    align: center;
    margin-bottom:10px;
    
} 	

#pwd {
	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:36px;
    align: center;
    margin-bottom:10px;
}

#pwdchk {
 	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:36px;
    align: center;
    margin-bottom:10px;
}

#phone1, #phone2, #phone3 {
	border: 1px solid #D2D2D2;
	border-radius: .4rem;
	width: 103px;
	height: 36px;
	margin-bottom:10px;
}

#txt2 {
	border: 1px solid #D2D2D2;
	border-radius: .4rem;
	width: 120px;
	height: 36px;
}

.emailmenu {
   font-family: Arial, sans-serif;
    font-size: 13px;
    color: #333;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 2px
  }
  
 .flex-row {
  display: flex; /* Flexbox를 사용하여 수평 배치 */
  justify-content: space-between; /* 공간을 균등하게 배분 */
  align-items: center; /* 수직 중앙 정렬 */
}

.age, .sex {
  margin-right: 20px; /* 필요한 여백 조정 */
}

.generation{
	padding-bottom: 8px;
    padding-left: 2px;
    padding-top: 8px;
    border-radius: .4rem;
    font-size: 14px;
    padding-right: 65px;
    border: 1px solid #D2D2D2;
}



 	
	
	
	
	#submit {
	text-align: center;
    width: 360px;
    height: 36px;
    border-radius: .4rem;
    background-color: black;
    color: white;
    cursor:pointer;
    margin-top:50px;
    
	}
	
	.agree {
	padding-top: 30px;
    height: 125px;
    font-weight: 500;
    font-size: 14px;
	}
	
	#flag{
	
	}
	
	.agree input[type="checkbox"] {
  margin-right: 1px; /* radio 버튼과 텍스트 간의 간격 조정 */
}
	
	#agreecontent{
	border: 1px solid #D2D2D2;
    list-style-type: none;
    font-size: 13px;
    border-radius: .4rem;
    background-color: #D2D2D2;
    font-weight: 500;
    position: relative;
    left: -40px;
    width: 340px;
    padding: 10px;
    margin-top: 4px;
	}
	
	
	
	
	
     
 </style>
<script>
  var uchk = 0; 
  var pchk = 0;

  // 아이디 체크 함수
  function useridCheck(userid) {
	  if(userid.trim().length >= 6) {
		  var chk = new XMLHttpRequest();
		  chk.onload = function() {
			  if(chk.responseText == "0") {
				  document.getElementById("umsg").innerText = "사용 가능한 아이디 입니다";
				  document.getElementById("umsg").style.color = "blue";
				  uchk = 1;
			  } else {
				  document.getElementById("umsg").innerText = "사용불가능한 아이디 입니다";
				  document.getElementById("umsg").style.color = "red";
				  uchk = 0;
			  }	  
		  }
		  chk.open("get", "useridCheck?userid=" + userid);
		  chk.send();
	  } else {
		  document.getElementById("umsg").innerText = "아이디를 다시 입력하고 체크하세요";
		  document.getElementById("umsg").style.color = "red";
		  uchk = 0;
	  }	  
  }

  // 서버 변경 함수
  function chgServer(server) {
	  document.mform.e2.value = server;
  }

  // 비밀번호 체크 함수
  function pwdCheck() {
	  var pwd = document.mform.pwd.value;
	  var pwd2 = document.mform.pwd2.value;
	 
	  if (pwd == pwd2) {
		   document.getElementById("pmsg").innerText = "비밀번호가 일치합니다";
		   document.getElementById("pmsg").style.color = "blue";
		   pchk = 1;
	  } else {
		   document.getElementById("pmsg").innerText = "비밀번호가 일치하지 않습니다";
		   document.getElementById("pmsg").style.color = "red";
		   pchk = 0;
	  }
  }

  // 전화번호 형식화 함수
  function formatPhone() {
    const phone1 = document.getElementById('phone1').value;
    const phone2 = document.getElementById('phone2').value;
    const phone3 = document.getElementById('phone3').value;
    const fullPhone = phone1 + "-" + phone2 + "-" + phone3;
    document.getElementById('phoneHidden').value = fullPhone;
    console.log(fullPhone); 
  }

  // 제출 전 체크 함수
  function check() {
	  formatPhone(); // 전화번호 형식화
	  
	  var email = document.mform.e1.value + "@" + document.mform.e2.value;
	  document.mform.email.value = email;
	  
	  if (uchk == 0) {
		  alert("아이디를 체크하세요");
		  return false;
	  } else if (document.mform.name.value == "") {
		  alert("이름을 입력하세요");
		  return false;
	  } else if (pchk == 0) {
		  alert("비밀번호 체크하세요");
		  return false;
	  } else {
		  return true;
	  }
  }
 </script>
</head>
<body> 
    <form name="mform" method="post" action="memberOk" onsubmit="return check()">
     <input type="hidden" name="email">
     <h3 align="center"> 가입정보 </h3>
     <ul class="joinbox">
     <li>
     <div class="namebox">
     <h6>이름*</h6>
   	 <input type="text" name="name" id="name" placeholder="이 름"> 
     </div>
     </li>
     
     <li>
     <div class="idbox">
     <h6>아이디*</h6>
     <input type="text" name="userid" id="userid" placeholder="아이디(6자이상)" onblur="useridCheck(this.value)">
     <br> <span id="umsg"></span> 
     </div>
     </li>
    
    <li>
    <div class="pwdbox">
     <h6>비밀번호*</h6>
     <input type="password" name="pwd" id="pwd" placeholder="비밀번호" onkeyup="pwdCheck()">
     </div>
     </li>
     
     <li>
     <div class="pwdidentify">
     <h6>비밀번호 확인*</h6>
     <input type="password" name="pwd2" id="pwdchk" placeholder="비밀번호 확인" onkeyup="pwdCheck()"> 
     <br> <span id="pmsg"></span>
     </div>
     </li>
     
     <li>
     <div class="phonebox">
     <h6>휴대폰 번호*</h6>
     <input type="text" name="phone1" id="phone1" placeholder="010"> -
     <input type="text" name="phone2" id="phone2" placeholder="1234"> -
     <input type="text" name="phone3" id="phone3" placeholder="5678">
     <input type="hidden" name="phone" id="phoneHidden">
     </div>
     </li>
     
     <li>
     <div class="emailbox">
     <h6>이메일*</h6>
     <input type="text" name="e1" id="txt2" placeholder="이메일아이디"> @
     <input type="text" name="e2" id="txt2" placeholder="이메일주소">
      <select onchange="chgServer(this.value)" class="emailmenu">
         <option value="">직접입력</option>
         <option value="naver.com">네이버</option>
         <option value="daum.net">다음</option>
         <option value="google.com">구글</option>
         <option value="hotmail.com">핫메일</option>
       </select>
     </div>
     </li>
    
     <div> <input type="submit" value="회원 가입" id="submit"> </div>     
     </ul>
    </form>
</body>
</html>