<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!--18/01/08 추가. submit할때 유저ID보내주기 위해서 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ymum my css-->
<link rel = "stylesheet" type = "text/css" href ="/resources/css/statistics.css">
<link rel = "stylesheet" type = "text/css" href ="/resources/css/test_view.css">
<link rel = "stylesheet" type = "text/css" href ="/resources/slider/css/slider.css">
<title>Insert title here</title>
</head>
<body>

    <!-- multistep form -->
<form id="msform">
	<!--18/01/08 추가. submit할때 유저ID보내주기 위해서 -->
	<input type="hidden" id="memberID" value="${member.memberID}" />
	<!-- progressbar -->
	<ul id="progressbar">
		<li class="active" >연령대</li> <!-- 1 -->
		<li>성별</li> <!-- 2 -->
		<li>인상깊었던 여행지</li> <!-- 3 -->
		<li>travel_type</li> <!-- 5 -->
	<!--	<li>travel_type2</li>  8 -->
		<li>travel_reason</li> <!-- 7 -->
		<li>travel_time1</li> <!-- 9 -->
		<li>travel_budget</li> <!-- 11 -->
        <li>blog url</li> <!-- 12 -->
	</ul>
	<!-- fieldsets -->
	
    <fieldset>
        <h2 class="fs-title">${member.memberName}님의 연령대가 궁금합니다~</h2>
		<h3 class="fs-subtitle"> Age </h3>
		<div class="container">
			<div class="container_radio">
	            <label for="q0"><input type="radio" id="q0" name="q0" value="1" checked="checked">10대</label>
	            <label for="q0" id="q02"><input type="radio" name="q0" value="2"/>20대</label>
	            <label for="q0" id="q03"><input type="radio" name="q0" value="3"/>30대</label>
	            <label for="q0" id="q04"><input type="radio" name="q0" value="4"/>40대 이상</label>
			</div>
		</div>
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	
	<fieldset>
        <h2 class="fs-title">${member.memberName}님의 성별은 어떻게 되나요?</h2>
		<h3 class="fs-subtitle"> Gender </h3>
		<div class="container">
			<div class="container_radio">
	            <label for="q1"><input type="radio" id="q1" name="q1" value="1" checked="checked"/>여</label>
	            <label for="q1"><input type="radio" name="q1" id="q1" value="2"/>남</label>
	            <label for="q1" ><input type="radio" name="q1" id="q1" value="3"/>기타</label>
	        </div>
		</div>

        	<input type="button" name="previous" class="previous action-button" value="Previous" />
			<input type="button" name="next" class="next action-button" value="Next" />

	</fieldset>
    

   <!-- must consider above (favorite1)question -->
   <!-- need better way to present a country list-->
   
    <fieldset>
        <h2 class="fs-title">즐거운 추억이 있는 나라와 도시를 선택해주세요!</h2>
		<h3 class="fs-subtitle"> Favorite countries </h3>
		<h3 class="fs-subtitle"> 확대해서 추억이 있는 도시를 찾을 수 있어요! </h3>
		<div class="container">
			<div id="maps">
		        <div id="gmap" class="mapdiv" style="visibility: hidden;"></div>
		        <div id="chartdiv_rcm" class="mapdiv" style="visibility: visible;"></div>
		    </div> 
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
   

    <fieldset>
        <h2 class="fs-title">당신은 여행 스타일은 어떤가요?</h2>
		<h3 class="fs-subtitle"> Travel type1 </h3>
        <div class="container">
        	<div class="container_radio">
	            <label for="q5"><input type="radio" id="q5" name="q5" value="1" checked="checked"/>혼자 여행을 선호해요!</label>
	            <label for="q5" id="q5"><input type="radio" name="q5" value="2"/>가족이나 친구와 같이 가요!</label>
	            <label for="q5" id="q5"><input type="radio" name="q5" value="3"/>스케줄이 정해져 있는 여행사를 통해 가요!</label>
			</div>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>

    <fieldset>
        <h1 class="fs-title">가장 강력한 여행의 목적은 무엇인가요?</h1>
		<h3 class="fs-subtitle"> Travel reason </h3>
        <div class="container">
        	<div class="container_radio">
	            <label for="q6"><input type="radio" id="q6" name="q6" value="1" checked="checked"/>음식</label>
	            <label for="q6" id="q6"><input type="radio" name="q6" value="2"/>문화체험</label>
	            <label for="q6" id="q6"><input type="radio" name="q6" value="3"/>경관, 사진찍기</label>
	            <label for="q6" id="q6"><input type="radio" name="q6" value="4"/>액티비티,스포츠</label>
	            <label for="q6" id="q6"><input type="radio" name="q6" value="5"/>쇼핑</label>
	        </div>
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
  
    <fieldset>
        <h2 class="fs-title">여행을 간다면 보통 얼마나 여행지에 머무시나요?</h2>
		<h3 class="fs-subtitle"> Travel time2 </h3>
        <div class="container">
        	<div class="container_radio">
	            <label for="q9"><input type="radio" id="q9" name="q9" value="1" checked="checked"/>당일치기~3일</label>
	            <label for="q9" id="q9"><input type="radio" name="q9" value="2"/>4~7일</label>
	            <label for="q9" id="q9"><input type="radio" name="q9" value="3"/>2~3주</label>
	            <label for="q9" id="q9"><input type="radio" name="q9" value="4"/>1~3개월</label>
	            <label for="q9" id="q9"><input type="radio" name="q9" value="5"/>3개월 이상</label>
	        </div>    
		</div>
        <input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">여행경비는 얼마로 잡으셨나요?</h2>
		<h3 class="fs-subtitle">budget</h3>
        <div class="container">
	        <div class="slider_ymmu">
	       		<input id="ex2" type="text"/>
	       	</div>
	       	<!-- 
        	<div class="container_radio">
	            <label for="q10"><input type="radio" id="q10" name="q10" value="1" checked="checked"/>~20만원</label>
	            <label for="q10" id="q10"><input type="radio" name="q10" value="2"/>20만원 ~ 40만원</label>
	            <label for="q10" id="q10"><input type="radio" name="q10" value="3"/>40만원 ~ 80만원</label>
	            <label for="q10" id="q10"><input type="radio" name="q10" value="4"/>foods</label>
	            <label for="q10" id="q10"><input type="radio" name="q10" value="5"/>activities</label>
	        </div>
	         -->
		</div>
		<input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle"> blog url </h3>
        <div class="container">
           <input type="text" id="q11" name="q11" placeholder="your blog url" />
		</div>
		<input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="submit" name="submit" class="submit action-button" value="Submit" />
	</fieldset>
</form>

	<!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.0.3.js"></script>
    <script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
    <!--  bootstrap slider -->
    <script type="text/javascript" src="/resources/slider/js/bootstrap-slider.js"></script>
    
    <!-- jQuery easing plugin -->
	<!-- google map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2hKi_ABEp2xZW6gQfjYyPaVA1Kddub6k&callback=initGoogleMap" defer ></script>	<!-- &callback=initGoogleMap -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>

    <!--chart -->
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <script src="https://www.amcharts.com/lib/3/ammap.js"></script>
    <script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
   
   <!-- custom ymmu -->
	<script type="text/javascript" src="/resources/js/test_view_edit.js"></script>
    <script type="text/javascript" src="/resources/js/user_detail.js"></script>

</body>
</html>