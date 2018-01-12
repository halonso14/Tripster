<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행 일정 등록</title>
</head>
    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
	<link href="/resources/assets/css/intro.css" rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
	
    <!-- Fonts -->	
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>	
	<!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/font-awesome.css" media="screen" />
    <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->
    
     <!-- Carousel -->	
    	<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
    	
    <!-- Revolution banner css settings -->
    <link rel="stylesheet" type="text/css" href="/resources/css/fullscreen.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/resources/rs-plugin/css/settings.css" media="screen" />

    <!-- Picker -->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />	
	
<!--     jQuery	 -->	
    <script src="https://code.jquery.com/jquery-2.0.3.js"></script>

	<%-- <%@include file="/WEB-INF/views/include/header2.jsp"%> --%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
    
    	<!-- BLUE SECTION -->	
	<div class="bluediv">
		<div class="loader"><img src="/resources/images/loading.gif" alt="" /></div>
		
		<a href="/"><img class="logointro" src="/resources/images/logo-intro.png" alt="" /></a>
		
		<div class="tabscontainer">
			<ul class='tabs'>
				<li class="b1"><a href='#tab1'><div class="aniflights"><img src="/resources/images/spacer.png" alt=""/>일정 등록</div></a></li>
			</ul>
		</div>
		
		<div class="social">
			<a href="#" ><img src="/resources/images/icon-facebook.png" alt=""/></a>
			<a href="#" ><img src="/resources/images/icon-twitter.png" alt=""/></a>
			<a href="#" ><img src="/resources/images/icon-gplus.png" alt=""/></a>
			<a href="#" ><img src="/resources/images/icon-youtube.png" alt=""/></a>
			<br/><br/>
			&copy; 2018 |<a href="#">Tripster</a><br/>All rights reserved.
		</div>
	</div>
	<!-- END OF BLUE SECTION -->	

	<!--WHITE SECTION -->	
	<div class="whitediv" style="width: 696.5px" >
	
		<!--HOME OBJECTS -->	
		<img class="couple" src="/resources/images/couple.png" alt="" />
		<img class="girl" src="/resources/images/girl.png" alt="" />
		<img class="girl2" src="/resources/images/girl2.png" alt="" />
		<img class="girl-car" src="/resources/images/girl-car.png" alt="" />
		<img class="car" src="/resources/images/car.png" alt="" />
		<img class="girl-cruise" src="/resources/images/girl-cruise.png" alt="" />
		<div class="palmbgcontainer"></div>
		<img class="dubai" src="/resources/images/dubai.jpg" alt="" />
		<img class="plane" src="/resources/images/plane.jpg" alt="" />
		<img class="road" src="/resources/images/road.jpg" alt="" />
		<img class="cruise" src="/resources/images/cruise.jpg" alt="" />

		<!--TAB 1 -->	
		<div id="tab1">
			<form role="form" action="/plan/register" method="POST">
				<div class="w100percent">
					<span class="opensans size13"><b>Title</b></span>
					<input type="text" class="form-control" id="planTitle" name="planTitle" onmousedown="titleMouseDown()"s>
				</div>
				<div class="titleError" id="titleError"style="color: red; font-weight: bold;"></div>
				<div class="clearfix"></div><br/>
				
				<div class="w50percent">
					<div class="wh90percent textleft">
						<span class="opensans size13"><b>Start date</b></span>
						<input type="date"  class="form-control mySelectCalendar2" name="planStartDate" id="planStartDate" onmousedown="dateMouseDown()"/>
					</div>
				</div>
	
				<div class="w50percentlast">
					<div class="wh90percent textleft right">
						<span class="opensans size13"><b>End date</b></span>
						<input type="date" class="form-control mySelectCalendar2" id="planEndDate" name="planEndDate" onmousedown="dateMouseDown()"/>
					</div>
				</div>
				<span class="dateError" id="dateError" style="color: red; font-weight: bold;"></span>
				<div class="clearfix"></div></br>
				<input type="button" class="btn-search2" value="등록" onclick="errorCheck();"/>
			</form>
		</div>
		<!-- END OF TAB1 -->
		
	</div>
	<!-- END OF WHITE SECTION -->	
	
	<script>
  		//modal open			  
    		function planModal(){
    			$('#planModal').modal({backdrop: 'static'});
    			$('#planModal').modal('show');
    		}
    		
    		
    		//입력 폼에 대한 errorCheck
    		function errorCheck(){
    			var startDate = $("#planStartDate").val();
    			var endDate= $("#planEndDate").val();
    			var errorMessage='';
    			var title = $("#planTitle").val();
    			//title입력 여부?	
     			if(''!=title){
     				//yes-> startDate && endDate 입력여부?
    					if(startDate && endDate){
    						//yes -> startDate 와 endDate를 date type으로 변환.
	    					var start = new Date(startDate);
	    					var end = new Date(endDate);
	    					//startDate > endDate ?
		    				if(startDate > endDate){
		    					//yes -> errorMessage출력.		
			    				errorMessage ='<span>여행 일정을 확인해주세요.</span>';
			    				$(".dateError").html(errorMessage);
			    			}else{
			    				//no -> 입력 검증 완료, form 전송.
			    				var formdata =$("form[role='form']").get(0);
			    				formdata.submit();
			    			}
	    				}else{
	    					//no-> errorMessage 출력.
	    					errorMessage ='<span>여행 일정을 확인해주세요.</span>';
	    					$(".dateError").html(errorMessage);
	    				} 
    				}else{
    					//no-> errorMessage 출력.
	   				errorMessage = '<span>제목을 입력하세요.</span>';
    				$('.titleError').html(errorMessage); 
    			} 
    		}
    		
    		//errorMessage값 지워주기.
    		function titleMouseDown() {
    		    $(".titleError").empty();
    		}
    		function dateMouseDown() {
    			$(".dateError").empty();
    		}
    		 
    </script>
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/dist/js/bootstrap.min.js"></script>
	
    <!-- Javascript -->
	<script src="/resources/assets/js/js-intro.js"></script>
	
	<!-- Preload images -->
    <script src="/resources/assets/js/jquery.preload.js"></script>	
	
    <!-- Easing -->	
    <script src="/resources/assets/js/jquery.easing.js"></script>	
	
    <!-- Nicescroll  -->	
	<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>	
	
    <!-- Picker UI-->		
	<script src="/resources/assets/js/jquery-ui.js"></script>		
	
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/assets/js/jquery.customSelect.js'></script>
	
    <!-- Functions -->
    <script src="/resources/assets/js/functions.js"></script>
	
    <!-- CarouFredSel -->
    <script src="/resources/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
    <script src="/resources/assets/js/helper-plugins/jquery.touchSwipe.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.transit.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
</body>
</html>