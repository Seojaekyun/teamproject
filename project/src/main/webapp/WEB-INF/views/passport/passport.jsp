<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.passportInfo{
margin: 5% 20%;
border: 1px solid black;
padding: 20px 20px;
}

.infobox{
margin: 10px 0px;
border: 1px solid black;
border-radius: 15px;
}

#name{
border-bottom: 1px solid black;
padding: 20px 30px;
font-size: 20px;
font-weight: bold;

}

.contents{
width: 100%;
}


.subtitle{
padding: 10px 0px;
font-size: 17px;
font-weight: bold;
}

p{
margin: 15px 0px;
}


.passport_info_details{
padding: 20px 30px;

}

.contacts_info_details{
padding: 20px 30px;
}

.info_agree {
padding: 20px 30px;
margin-bottom: 20px;
}

.contents_agree {
padding: 20px 0px;
}






label {
display:block;
width: 100%;    /* 가로 전체 차지 */
margin-bottom: 15px; 
font-size:14px;
}



.info_aligner {
	display: flex;
    justify-content: space-between;
    gap: 40px;
    width: 100%;
    padding: 20px 0px;
}

select{
    width: 100%;
    height: 60%;
    border-top: none;
    border-left: none;
    border-right: none;
    font-size: 16px;
}

input[type=text]{
    width: 100%;
    height: 60%;
    border-top: none;
    border-left: none;
    border-right: none;
    font-size: 16px;
}

#email {
	width:48%;
	height:80%;
}


#gender {
    display: flex;
    gap: 10px; /* 요소 간 간격 조절 */
}

#gender input[type="radio"] {
    display: none;
}

/* 라벨을 버튼처럼 스타일링 */
#gender label {
display: flex;
justify-content:space-between;
    width: 50%;
    padding: 10px 20px;
    border: 1px solid black;
    cursor: pointer;
    margin-right: 5px;
    transition: all 0.3s;
}

/* 선택된 라디오 버튼에 스타일 적용 */
#gender input[type="radio"]:checked + label {
    border-color: black;
    color: black;
    font-weight: bold;
}

/* 체크 표시 추가 (필요한 경우) */
#gender input[type="radio"]:checked + label::after {
    content: " ✔";
    color: black;
}


.contents_agreement {
margin: 10px 0px;
border: 1px solid black;
border-radius: 15px;
padding: 20px 30px;
}

.submit{
text-align: center;}

input[type="submit"]{
width: 15%;
font-size: 18px;
padding: 5px 30px;
}


</style>
<script>

</script>
</head>
<body>
<div class="passportInfo">
<form method="post" action="/select/selection" onsubmit="return check(this);">
<input type="hidden" name="reservationId" value="${reservationId}" />
<input type="hidden" name="pnr" value="${pnr}"/>
<h2>사전 입국 심사 정보</h2>
<p>항공 안전 및 출입국 절차 간소화를 위해 미리 여권 정보를 입력해 주세요. 여권 상의 정보와 동일하게 입력해주시기 바랍니다.</p>
<p>[*은 필수항목입니다.]</p>
<div class="infobox">
<div id="name">CLARK KENT</div>
<div class="passport_info_details">
<div class="subtitle"> 여권 정보 </div>
<div class="info_aligner">
<div class="contents" id="nationalities">
<label for="nationality"> 국적 * </label>
<select name="nationality">
<c:forEach var="nationality" items="${nationalities}">
    <option value="${nationality.countryNameEn}">
        ${nationality.countryNameKr} (${nationality.countryNameEn})
    </option>
</c:forEach>
</select>
<div class="inputContentsErrorMessage" style="color: red; font-size: 12px; margin-top:5px; visibility: hidden; ">
											필수 선택 항목입니다.
										</div>
</div>
<div class="contents" id="genders">
<label for="gender"> 성별 *</label>
<div id="gender">
<input type="radio" id="male" name ="gender" value="male" checked >
<label class="gender_label" for="male">남성</label>
<input type="radio" id="female" name ="gender" value="female">
<label class="gender_label" for="female">여성</label>
</div>

										
</div>
</div>
<div class="info_aligner">
<div class="contents" id="date_of_birth">
<label for="birth"> 생일 (YYYY-MM-DD) * </label>
<input type="text" id="birth" name="birth" required>
<div class="inputContentsErrorMessage" style="color: red; font-size: 12px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div> 
</div>
<div class="contents" id="issuing_country">
<label for="issuing_country" > 발행 국가 * </label>
<select name="issuingCountry" required>
<c:forEach var="issuingCountry" items="${nationalities}">
    <option value="${issuingCountry.countryNameEn}">
        ${issuingCountry.countryNameKr} (${issuingCountry.countryNameEn})
    </option>
</c:forEach>
</select>

</div>
</div>
<div class="info_aligner">
<div class="contents" id="passport_number">
<label for="passportnum"> 여권번호 * </label>
<input type="text" id="passportnum" name="passportnum" required>
<div class="inputContentsErrorMessage" style="color: red; font-size: 12px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div>
										</div>
<div class="contents" id="expiration_date">
<label for="exdate"> 여권만료일 (YYYY-MM-DD) * </label>
<input type="text" id="exdate" name="exdate" required>
<div class="inputContentsErrorMessage" style="color: red; font-size: 12px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div>
										</div>
</div>
</div>

<div class="contacts_info_details">
<div class="subtitle"> 연락처
<div class="info_aligner">
<div class="contents" id="country_number">
<label for="countryNumber"> 국가번호 * </label>
<input type="text" id="countryNumber" name="countryNumber" required>
<div class="inputContentsErrorMessage" style="color: red; font-size: 12px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div>
</div>
<div class="contents" id="phone">
<label for="phoneNumber"> 전화번호 * </label>
<input type="text" id="phoneNumber" name="phoneNumber" required>
<div class="inputContentsErrorMessage" style="color: red; font-size: 12px; margin-top:5px; visibility: hidden; ">
											필수 입력 항목입니다.
										</div>
</div>
</div>
<div class="info_aligner">
<div class="contents" id="address">
<label for="email">이메일</label>
<input type="text" id="email" name="eamil"> 
</div>
</div>

</div>
</div>
<div class="info_agree">
<input type="checkbox" id="info_agree" name="info_agree"> 나의 회원정보에 여권 및 연락처 정보를 저장 및 활용하는 것에 동의합니다.
</div>
</div>
<div class="contents_agreement">
<p>각국 출입국 관리 당국의 요청에 따라 항공안전 및 출입국 간소화를 위하여 승객의 개인정보를 제공하게 됩니다.</p>
<p>승객은 개인정보 제공동의를 거부할 수 있습니다. 단, 개인정보제공을 거부하거나 허위정보일 경우 입국 또는 운송 거절될 수 있습니다.</p>

<p>※ 미국 출도착 및 항공 통과 정보안내</p>
<p>미국 교통보안청(TSA)의 요청에 따라 정보개인 및 테러지원자명단에 근거하여 승객의 개인정보(성명, 국적, 생년월일, 여권번호, 발급국가, 만료일 등)를 제공하게 됩니다. 제공 정보는 미국의 Watch List(경계인물명단)와의 비교를 위해 사용되며, 미국 사법기관 또는 타 정부기관과 공유될 수 있습니다.

</p>
<div class="contents_agree">
<input type="checkbox" name="contents_agree" > 동의합니다
</div>
</div>
<div class="submit">
<input type="submit" id="submit" name="submit" value="저장"> 
</div>
</form>
</div>
</body>
</html>