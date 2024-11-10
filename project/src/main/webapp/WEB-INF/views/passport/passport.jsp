<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="passportInfo">
사전 입국 심사 정보

<div class="infobox">
<div id="name"></div>
<form method="post" action="/select/selection" onsubmit="return check(this);">
<div class="passport_info_details">
여권 정보
<div class="info_aligner">
<div id="nationalities">
<label for="nationality"> 국적 </label>
<select name="nationality">
<c:forEach var="nationality" items="${nationalities}">
    <option value="${nationality.countryNameEn}">
        ${nationality.countryNameKr} (${nationality.countryNameEn})
    </option>
</c:forEach>
</select>
</div>
<div id="gender">
<label for="gender">성별</label>
<input type="radio" name ="gender" value="male" checked > 남성
<input type="radio" name ="gender" value="female"> 여성

</div>
</div>
<div class="info_aligner">
<div id="date_of_birth">
<label for="birth"> 생일 (YYYY-MM-DD) </label>
<input type="text" id="birth" name="birth" required> 
</div>
<div id="issuing_country">
<label for="issuing_country" > 발행 국가 </label>
<select name="issuing_country" required>
<c:forEach var="issuingCountry" items="${nationalities}">
    <option value="${issuingCountry.countryNameEn}">
        ${issuingCountry.countryNameKr} (${issuingCountry.countryNameEn})
    </option>
</c:forEach>
</select>
</div>
</div>
<div class="info_aligner">
<div id="passport_number"></div>
<div id="expiration_date"></div>
</div>
</div>

<div class="contacts_info_details">
연락처
<div class="info_aligner">
<div id="country_number">

</div>
<div id="phone">
<label for="phoneNumber">전화번호</label>
<input type="text" id="phoneNumber" name="phoneNumber" required>
</div>
</div>
<div class="info_aligner">
<div id="address"></div>
</div>

</div>
</form>
</div>

</div>
</body>
</html>