<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f8f8;
    margin: 0;
    padding: 20px;
}

section {
    width: 1000px;
    margin: 0 auto;
    padding: 20px;
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.profile-header {
    display: flex;
    flex-direction: column;
    background-color: #f0f4f8;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 30px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.profile-info {
 	display: flex;
    align-items: center;
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.profile-divider {
    width: 2px; /* 세로선 너비 */
    height: 50px; /* 세로선 높이 */
    background-color: #ccc; /* 세로선 색상 */
    margin: 0 10px; /* 세로선 좌우 여백 */
}


.profile-item {
	width: 50%;
    padding: 10px;
    /* background-color: white; */
    /* border-radius: 10px; */
    /* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
    text-align: center;
    margin-bottom: 12px;
}

.profile-divider {
    border-left: 2px solid #ccc; /* 두 블럭 사이에 세로선 추가 */
}

.profile-header h2 {
    font-size: 20px;
    margin-bottom: 8px;
    color: #333;
    font-weight: bold;
}

.profile-header span {
    font-size: 16px;
    color: #555;
    display: block;
}

.section-box {
    background-color: white;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
}

.section-box h3 {
    font-size: 18px;
    margin-bottom: 15px;
    font-weight: bold;
}

.section-box p {
    margin-bottom: 15px;
    font-size: 14px;
    color: #666;
}

.section-box input[type=text],
.section-box input[type=password] {
    width: calc(100% - 20px);
    padding: 12px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.section-box input[type=submit] {
    width: 100%;
    padding: 12px;
    background-color: #0078D7;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.section-box input[type=submit]:hover {
    background-color: #005bb5;
}

.section-box button {
    width: 100px;
    padding: 10px;
    margin-top: 10px;
    background-color: #0078D7;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.section-box button:hover {
    background-color: #005bb5;
}

</style>

  <script>
   function viewForm() {
	   document.getElementById("emailOne").style.display="none";
	   document.getElementById("emailTwo").style.display="block";
   }
   function cancelForm() {
	   document.getElementById("emailOne").style.display="block";
	   document.getElementById("emailTwo").style.display="none";
   }
   var mychk=0;
   function pwdChg(my) {
	   if(mychk % 2 == 0) {	   
	       document.getElementById("pwdChg").style.display="block";
	       my.innerText="비밀번호 변경취소";
	   } else {
		   document.getElementById("pwdChg").style.display="none";
		   my.innerText="비밀번호 변경";
	   }	   
	   mychk++;
   }
  </script>
</head>
<body> 
 <section>
    <!-- 상단 회원 정보 -->
    <div class="profile-header">
 <div class="profile-info">
    <div class="profile-item">
        <h2>성명</h2>
        <span>${mdto.name}</span>
    </div>
    <div class="profile-divider"></div>
    <div class="profile-item">
        <h2>아이디</h2>
        <span>${mdto.userid}</span>
    </div>
</div>


        
        <!-- 비밀번호 변경 -->
        <div class="section-box">
            <h3>비밀번호</h3>
            <p>회원님의 소중한 개인정보 보호를 위해 비밀번호를 주기적으로 변경해 주세요.</p>
            <span style="font-size:14px;cursor:pointer;" onclick="pwdChg(this)">
              <c:if test="${err == null}">비밀번호 변경</c:if>
              <c:if test="${err == 1}">비밀번호 변경취소</c:if>
            </span>
            <div id="pwdChg" style="display:none;">
              <form method="post" action="pwdChg">
                <input type="password" name="oldPwd" placeholder="기존 비밀번호"><br>
                <input type="password" name="pwd" placeholder="새 비밀번호"><br>
                <input type="password" name="pwd2" placeholder="새 비밀번호 확인"><br>
                <input type="submit" value="비밀번호 변경">
              </form>
              <c:if test="${err != null}">
                <div style="color:red;font-size:11px;">기존 비밀번호가 틀립니다</div>
              </c:if>
            </div>
        </div>
        
        <!-- 기본정보 수정 -->
        <div class="section-box">
            <h3>기본정보</h3>
            <div id="emailOne">
              ${mdto.email} <button onclick="viewForm()">수정</button>
            </div>
            <div id="emailTwo" style="display:none;">
              <form method="post" action="emailEdit">
                <input type="text" name="email" value="${mdto.email}">
                <input type="submit" value="수정">
                <button type="button" onclick="cancelForm()">취소</button>
              </form>
            </div>

            <form method="post" action="phoneEdit">
              <input type="text" name="phone" value="${mdto.phone}">
              <input type="submit" value="수정">
            </form>
        </div>
       <div class="delete_id">
    <c:choose>
        <c:when test="${mdto.level == 0 || mdto.level == 1 || mdto.level == 2}">
            <a href="../member/id_verification">탈퇴신청 ></a>
        </c:when>
        <c:when test="${mdto.level == 3}">
            <span>탈퇴승인중 | <a href="../member/recovery_request">복구 신청 ></a></span>
        </c:when>
                <c:when test="${mdto.level == 5}">
            <span>복구승인중 | <a href="../member/id_verification">탈퇴 신청 ></a></span>
        </c:when>
    </c:choose>
</div>
    </div>
</section>


</body>
</html>
