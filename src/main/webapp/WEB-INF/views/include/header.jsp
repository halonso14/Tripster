<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">

	<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
	
    <!-- Fonts -->	
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>	
	<!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/font-awesome.css" media="screen" />
	
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/fullscreen.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/resources/rs-plugin/css/settings.css" media="screen" />
	
    <!-- Picker UI-->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />
	
	<!-- Modal -->
	<script type="text/javascript" src="/resources/js/modal.js"></script>	
	
	<!-- bin/jquery.slider.min.css -->
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.css" type="text/css">
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.round-blue.css" type="text/css">
	
    <!-- jQuery-->	
    <script src="/resources/assets/js/jquery.v2.0.3.js"></script>
	<script src="/resources/assets/js/jquery-ui.js"></script>	
	
	<!-- bin/jquery.slider.min.js -->
	<script type="text/javascript" src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/tmpl.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.slider.js"></script>
	
	<!-- JS-detail -->
	<script src="/resources/assets/js/js-details.js"></script>
	
	<!-- Javascript -->	
	<script src="/resources/assets/js/js-details.js"></script>
	
	<!-- Googlemap -->	
	<script src="/resources/assets/js/initialize-google-map.js"></script>
	
    <!-- Custom Select -->
	<script type='/resources/text/javascript' src='assets/js/jquery.customSelect.js'></script>
	
    <!-- Custom functions -->
    <script src="/resources/assets/js/functions.js"></script>

    <!-- Nicescroll  -->	
	<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>
	
    <!-- jQuery KenBurn Slider  -->
    <script type="text/javascript" src="/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	
    <!-- CarouFredSel -->
    <script src="/resources/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
    <script src="/resources/assets/js/helper-plugins/jquery.touchSwipe.min.js"></script>
	
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.transit.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>

    <!-- Counter -->	
    <script src="/resources/assets/js/counter.js"></script>	
	
    <!-- Carousel-->	
    <script src="/resources/assets/js/initialize-carousel-detailspage.js"></script>		
	
    <!-- Js Easing-->	
    <script src="/resources/assets/js/jquery.easing.js"></script>

	
    <!-- Bootstrap-->	
    <script src="/resources/dist/js/bootstrap.min.js"></script>
	<!-- end -->

<!-- Top wrapper -->
<div class="navbar-wrapper2 navbar-fixed-top2">
	<div class="container">
		<div class="navbar mtnav2">
			<div class="container offset-3">
				<!-- Navigation-->
				<div class="navbar-header">
					<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/" class="navbar-brand"><img src="/resources/updates/update1/img/logo.png" alt="Travel Agency Logo" class="logo2"/></a>
				</div>
				<div class="navbar-collapse collapse">
			        <%	// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
           				 if(session.getAttribute("login")==null){ 
        				%>
        				
        				
					<ul id="nonmember" class="nav nav2 navlight navbar-nav navbar-right">
						<li><a href="/member/register">회원가입</a></li>
						<li><a href="/member/login">로그인</a></li>
					</ul>
			        <%	// 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
			            }else{ 
			        %>
					<ul id="member" class="nav nav2 navlight navbar-nav navbar-right">
						<li class="dropdown">
							<a data-toggle="dropdown" class="dropdown-toggle" href="/resources/dashboard/index">
								홍길동 <span class="badge indent0">1</span><b class="lightcaret mt-2"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="/member/mypage">내정보 관리</a></li>
								<li><a href="/member/logout">로그아웃</a></li>
							</ul>
						</li>
						<li><a href="#">일정등록버튼</a></li>
					</ul>
					<%  }  %>    
				</div>
				<!-- /Navigation-->
			</div>
		</div>
	</div>
</div>
<div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="#"></a>
			<div class="left">
				<ul class="bcrumbs">
					<li><a href="/contents/restaurantList/1">Restaurant</a></li>
				  	<li><a href="/contents/placeList/1">Place</a></li>					
				</ul>				
			</div>
			<a class="backbtn right" href="#"></a>
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
</div>
<!-- /Top wrapper -->
