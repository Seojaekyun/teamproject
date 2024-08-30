<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 	
 	form{
    width: 400px;
    height: 915px;
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
}

#userid {
 	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:36px;
    align: center;
} 	

#pwd {
	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:36px;
    align: center;
}

#pwdchk {
 	border: 1px solid #D2D2D2;
 	border-radius: .4rem;
 	width:360px;
    height:36px;
    align: center;
}

#phone {
	border: 1px solid #D2D2D2;
	border-radius: .4rem;
	width: 103px;
	height: 36px;
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


.sex {
  gap: 10px; /* radio 버튼 사이의 간격 조정 */
  align-items: center; /* 수직 중앙 정렬 */
}

.sex input[type="radio"] {
  margin-right: 1px; /* radio 버튼과 텍스트 간의 간격 조정 */
}

.sex label {

    margin-right: 0px; /* radio 버튼 레이블과 레이블 간의 간격 조정 */
    font-size: 14px; /* 레이블 폰트 크기 조정 */
}
 	
	
	
	
	#submit {
	text-align: center;
    width: 360px;
    height: 36px;
    border-radius: .4rem;
    background-color: black;
    color: white;
    cursor:pointer;
    
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
  var uchk=0;
  function useridCheck(userid)
  {
	  if(userid.trim().length>=6) // 아이디 길이는 6자 이상
	  {
		  var chk=new XMLHttpRequest();
		  chk.onload=function()
		  {
			  if(chk.responseText=="0")
			  {
				  document.getElementById("umsg").innerText="사용 가능한 아이디 입니다";
				  document.getElementById("umsg").style.fontSize="11px";
				  document.getElementById("umsg").style.color="blue";
				  uchk=1;
			  }	  
			  else
			  {
				  document.getElementById("umsg").innerText="사용불가능한 아이디 입니다";
				  document.getElementById("umsg").style.fontSize="11px";
				  document.getElementById("umsg").style.color="red";
				  uchk=0;
			  }	  
		  }
		  chk.open("get","useridCheck?userid="+userid);
		  chk.send();
	  }	  
	  else
	  {
		  document.getElementById("umsg").innerText="아이디를 다시 입력하고 체크하세요";
		  document.getElementById("umsg").style.fontSize="11px";
		  document.getElementById("umsg").style.color="red";
		  uchk=0;
	  }	  
  }
  
  function chgServer(server)
  {
	  document.mform.e2.value=server;
  }
  var pchk=0;
  function pwdCheck(n)
  {
	  // 2개의 비밀번호를 비교
	  var pwd=document.mform.pwd.value;
	  var pwd2=document.mform.pwd2.value;
	 
	  if(n==1 || (n==0 && pwd2!=""))
	  {	  
		   
		   
		   if(pwd==pwd2)
		   {
			   document.getElementById("pmsg").innerText="비밀번호가 일치합니다";
			   document.getElementById("pmsg").style.color="blue";
			   document.getElementById("pmsg").style.fontSize="11px";
			   pchk=1;
		   }
		   else
		   {
			   document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다";
			   document.getElementById("pmsg").style.color="red";
			   document.getElementById("pmsg").style.fontSize="11px";
			   pchk=0;
		   }	   
	  }
   
  }
  
  function check()
  {
	  var email=document.mform.e1.value+"@"+document.mform.e2.value;
	  document.mform.email.value=email;
	  
	  if(uchk==0)
	  {
		  alert("아이디를 체크하세요");
		  return false;
	  }	  
	  else if(document.mform.name.value=="")
		   {
		       alert("이름을 입력하세요");
		       return false;
		   }
	       else if(pchk==0)
	    	    {
	    	        alert("비밀번호 체크하세요");
	    	        return false;
	    	    }
	            else
 	            {
		           return true;
 	            }	   
  }
 </script>
</head>
<body> <!-- member/m -->
   
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
     <input type="password" name="pwd" onkeyup="pwdCheck(0)" id="pwd" placeholder="비밀번호">
     </div>
     </li>
     
     <li>
     <div class="pwdidentify">
     <h6>비밀번호 확인*</h6>
       <input type="password" name="pwd2" onkeyup="pwdCheck(1)" id="pwdchk" placeholder="비밀번호 확인"> 
      <br> <span id="pmsg"></span>
      </div>
      </li>
      
      <li>
      <div class="phonebox">
      <h6> 휴대폰 번호* </h6>
      <input type="text" name="phone" id="phone" placeholder="휴대폰 번호"> -
      <input type="text" name="phone" id="phone" > -
      <input type="text" name="phone" id="phone" >
      </div>
      </li>
     
     <li>
     <div class="emailbox">
     <h6>이메일*</h6>
     <input type="text" name="e1" id="txt2" placeholder="이메일아이디"> @
     <input type="text" name="e2" id="txt2" placeholder="이메일주소">
      <select  onchange="chgServer(this.value)" class="emailmenu">
         <option value=""> 직접입력 </option>
         <option value="naver.com"> 네이버 </option>
         <option value="daum.net"> 다음 </option>
         <option value="google.com"> 구글 </option>
         <option value="hotmail.com"> 핫메일 </option>
       </select>
       </div>
     </li>
     
     <li class="flex-row">
      <div class="age">
      <h6> 연령* </h6>
      <select  class="generation">
      	<option> 선택* </option>
      	 <option> 10대 미만 </option>
         <option> 10대 </option>
         <option> 20대 </option>
         <option> 30대 </option>
         <option> 40대 </option>
         <option> 50대 </option>
         <option> 60대 </option>
         <option> 70대 이상 </option>
       </select>
       </div>
       <div class="sex">
       <h6> 성별* </h6>
		<label><input type="radio" name="gender" value="male" required> 남성</label>
    	<label><input type="radio" name="gender" value="female"> 여성</label>
    	<label><input type="radio" name="gender" value="other"> 기타</label>
      </div>
      </li>
      
      <li class="agree">
      <input type="checkbox" id="flag" value="flag"> 
      <span id="agree"> 뉴스레터 수신에 동의합니다.</span>
      <ul>
      <li id="agreecontent">
      "리움미술관에서 보내는 뉴스레터, 혜택 안내를 위한 소식을 이메일, 문자로 받으실 수 있습니다. 수신 여부는 리움미술관 홈페이지에서 언제든지 변경할 수 있습니다."
      </li>
      </ul>
       </li>

     <div> <input type="submit" value="회원 가입" id="submit"> </div>     
     </ul>

    </form>

</body>
</html>