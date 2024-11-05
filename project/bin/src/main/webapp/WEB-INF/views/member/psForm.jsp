<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
   #section form {
     text-align:center;
   }
   #section input[type=text] {
     width:330px;
     height:30px;
     border:1px solid #000f9b;
     border-radius: 5px;
     outline:none;
   }
   #section input[type=submit] {
     width:336px;
     height:34px;
     border:1px solid #000f9b;
     border-radius: 5px;
     background:#000f9b;
     color:white;
     font-size:15px;
   }
   #section div {
     margin-top:8px;
   }
 </style>
</head>
<body> <!-- member/psForm.jsp -->
   <div id="section">
    <form method="post" action="pwdSearch">
     <h3> 비밀번호 찾기 </h3>
     <div> <input type="text" name="userid" placeholder="아이디"></div>
     <div> <input type="text" name="name" placeholder="이 름"> </div>
     <div> <input type="text" name="email" placeholder="이메일"> </div>
     <div> <input type="submit" value="비밀번호찾기"> </div>
     <c:if test="${err!=null}">
     <div style="font-size:12px;color:red;"> 입력하신 정보가 일치하지 않습니다. </div>
    </c:if>
    </form>
   </div>
</body>
</html>




