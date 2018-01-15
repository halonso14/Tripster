<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
<%@include file="/WEB-INF/views/plan/registerModal.jsp"%>
<head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Travel Agency - HTML5 Booking template</title>
	
    <!-- ymum my css-->
    <link rel = "stylesheet" type = "text/css" href ="/resources/css/statistics.css">
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- ymum my css-->
    
    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    <!-- ymmu bootstrap table -->
    <link href="/resources/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">


	<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
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
	
	<!-- Animo css-->
	<link href="/resources/plugins/animo/animate+animo.css" rel="stylesheet" media="screen">

    <!-- Picker -->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />	
	
<!--     jQuery	 -->	
    <script src="https://code.jquery.com/jquery-2.0.3.js"></script>

<script src="/resources/dist/js/bootstrap.min.js"></script>
  </head>
    
   <body id="top" class="thebg" >
	<div class="navbar-wrapper2 navbar-fixed-top">
      <div class="container">
		<div class="navbar mtnav">

			<div class="container offset-3">
			  <!-- Navigation-->
			  <div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a href="/" class="navbar-brand"><img src="/resources/images/logo.png" alt="Travel Agency Logo" class="logo"/></a>
			  </div>
			  <div class="navbar-collapse collapse" >

					  <c:choose>
        				<c:when test = "${empty userSession}">
							<ul id="nonmember" class="nav nav2 navlight navbar-nav navbar-right" >
								<li><a href="/member/register">회원가입</a></li>
								<li><a href="/member/login">로그인</a></li>
							</ul>
						</c:when>
			
 						<c:otherwise>		
 							<ul id="member" class="nav nav2 navlight navbar-nav navbar-right">
								<li class="dropdown">
									
									<a data-toggle="dropdown" class="dropdown-toggle" href="/dashboard/index">
										<img src="/resources/images/user2.png" alt=""/>&nbsp;${userSession.memberName}<b class="lightcaret mt-2"></b>
									</a>
							<ul class="dropdown-menu">
								<li><a href="/member/mypage">내정보 관리</a></li>
								<li><a href="/member/logout">로그아웃</a></li>
							</ul>
								</li>
								<li><a href="#" onclick="planModal();">일정등록버튼</a></li>
							</ul>
						</c:otherwise>
        			
        			</c:choose>	

			  </div>
			  <!-- /Navigation-->			  
			</div>
        </div>
      </div>
    </div>
	
