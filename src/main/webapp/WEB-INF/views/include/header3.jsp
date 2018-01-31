<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Tripster</title>

    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
	<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
	<link href="/resources/updates/update1/css/search.css" rel="stylesheet" media="screen">
	<link href="/resources/updates/update1/css/style02.css" rel="stylesheet" media="screen">
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
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/fullscreen.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/resources/rs-plugin/css/settings.css" media="screen" />
    <!-- Picker -->
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />
	<!-- bin/jquery.slider.min.css -->
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.css" type="text/css">
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.round.css" type="text/css">
    <!-- jQuery -->
    <script src="/resources/assets/js/jquery.v2.0.3.js"></script>
    <!-- scrapbtn css -->
	<link href="/resources/assets/css/scrapBtn.css" rel="stylesheet" media="screen">
	<!-- followbtn css -->
	<link href="/resources/assets/css/followBtn.css" rel="stylesheet" media="screen">
	<!-- likebtn css -->
	<link href="/resources/assets/css/searchLikeBtn.css" rel="stylesheet" media="screen">
	<!-- bin/jquery.slider.min.js -->
	<script type="text/javascript" src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/tmpl.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.slider.js"></script>
  </head>
  <body id="top" class="thebg" >
	<!-- 로그인 세션  -->
	<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
	<!-- HEADER -->
		<style>
		a.navbar-brand  {
			float:left;
			padding: 15px;
		}
		</style>

		<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
		<%-- <%@include file="/WEB-INF/views/plan/registerModal.jsp"%> --%>
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

		  				<ul  class="nav nav2 navlight navbar-nav navbar-right" >
			  				<c:choose>
								<c:when test = "${empty userSession}">
									<li><a href="/member/register">회원가입</a></li>
									<li><a href="/member/login">로그인</a></li>
								</c:when>
								<c:otherwise>
									<li class="dropdown">
										<a data-toggle="dropdown" class="dropdown-toggle" href="/dashboard/index">
											<img src="/resources/images/user2.png" alt=""/>&nbsp;${userSession.memberName}<b class="lightcaret mt-2"></b>
										</a>
										<ul class="dropdown-menu">
											<li><a href="/member/mypage">내정보 관리</a></li>
											<li><a href="/member/logout">로그아웃</a></li>
										</ul>
		`							</li>
									<li><a href="/plan/register">일정등록버튼</a></li>
								</c:otherwise>
							</c:choose>
							<li><form action="/search/result" >
								<div class="input-group" style="padding:8px 0; width:200px">
									<input  id="keywordInput" name='keyword' type="text" class="form-control" placeholder="${cri.keyword }" value="${cri.keyword }" ></input>
									<span class="input-group-btn">
										<button class="btn btn-default searchbtn" type="submit">Go!</button>
									</span>
								</div>
							</form></li>

						</ul>

					  </div>
					  <!-- /Navigation-->
					</div>
		        </div>
		      </div>
		    </div>


	<!-- BREADCRUMBS -->
	<div class="container breadcrub"><div class="brlines"></div></div>
