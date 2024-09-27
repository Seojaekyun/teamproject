<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
  section {
      width:1000px;
      height:600px;
      margin:auto;
   }
   section table td {
      height:40px;
   }
   section #emailTwo {
      display:none;
   }
   section #pwdChg {
     width:396px;
     height:260px;
     margin:auto;
     text-align:center;
     border:1px solid black;
     margin-top:20px;
     margin-bottom:100px;
     /* 기존비밀번호가 틀려서 다시 왔을때 err값을 1을 가지고 온다 값이 있다면 display:none이 생략 폼이 남아있다 */
    <c:if test="${err==null}">
     display:none;
    </c:if>
   }
   section #pwdChg input[type=password] {
     width:200px;
     height:28px;
     margin-top:8px;
   }
   section #pwdChg input[type=submit] {
     width:208px;
     height:32px;
     margin-top:8px;
   }
  </style>
  <script>
   function viewForm()
   {
	   document.getElementById("emailOne").style.display="none";
	   document.getElementById("emailTwo").style.display="block";
   }
   function cancelForm()
   {
	   document.getElementById("emailOne").style.display="block";
	   document.getElementById("emailTwo").style.display="none";
   }
   var mychk=0;
   function pwdChg(my)
   {
	   if(mychk%2==0)
	   {	   
	       document.getElementById("pwdChg").style.display="block";
	       my.innerText="비밀번호 변경취소";
	   }
	   else
	   {
		   document.getElementById("pwdChg").style.display="none";
		   my.innerText="비밀번호 변경";
	   }	   
	   mychk++;
   }
  </script>
</head>
<body> 
    <section>
      <table width="400" align="center">
        <caption> <h3> 회원님  정보
         <span style="font-size:12px;cursor:pointer;" onclick="pwdChg(this)">
         <c:if test="${err==null}"> 
          비밀번호변경 
         </c:if>
         <c:if test="${err==1}">
          비밀번호 변경취소
         </c:if>
         </span>
 
        </h3></caption>
        <tr>
          <td> 아이디 </td>
          <td> ${mdto.userid} </td>
        </tr>
        <tr>
          <td> 이 름 </td>
          <td> ${mdto.name} </td>
        </tr>
        <tr>
          <td> 이메일 </td>
          <td> 
            <div id="emailOne"> ${mdto.email} <input type="button" value="수정" onclick="viewForm()"> </div>
            <div id="emailTwo">
               <form method="post" action="emailEdit">
                 <input type="text" name="email" value="${mdto.email}">
                 <input type="submit" value="수정">
                 <input type="button" value="취소" onclick="cancelForm()">
               </form>
            </div> 
          </td>
        </tr>
        <tr>
          <td> 전화번호 </td>
          <td>
            <form method="post" action="phoneEdit">
              <input type="text" name="phone" value="${mdto.phone}">
              <input type="submit" value="수정">
            </form>  
          </td>
        </tr>
      </table>
     
      <div id="pwdChg">
       <div> <h4> 비밀번호 변경하기 </h4></div>
      
       <form method="post" action="pwdChg">
         <input type="password" name="oldPwd" placeholder="기존 비밀번호"><br>
         <input type="password" name="pwd" placeholder="새 비밀번호"><br>
         <input type="password" name="pwd2" placeholder="새 비밀번호 확인"><br>
         <input type="submit" value="비밀번호 변경">
       </form>
      <c:if test="${err!=null}">
       <div style="color:red;font-size:11px;"> 기존비밀번호가 틀립니다 </div>
      </c:if>
    </div>
    </section>
</body>
</html>







