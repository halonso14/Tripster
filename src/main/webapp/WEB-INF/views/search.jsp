<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>검색결과 :: Tripster</title>
	
    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">

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
	
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/fullscreen.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/resources/rs-plugin/css/settings.css" media="screen" />

    <!-- Picker -->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />	
	
	<!-- bin/jquery.slider.min.css -->
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.css" type="text/css">
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.round.css" type="text/css">	

    <!-- jQuery -->	
    <script src="assets/js/jquery.v2.0.3.js"></script>
	
	<!-- bin/jquery.slider.min.js -->
	<script type="text/javascript" src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/tmpl.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.slider.js"></script>
	<!-- end -->
  </head>
  <body id="top" class="thebg" >

	<!--####### HEADER #######-->
	<%@include file="include/header.jsp" %>
	
	<div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="#"></a>
			<div class="left">
				<ul class="bcrumbs">
					<li>/</li>
					<li><a href="#">Hotels</a></li>
					<li>/</li>
					<li><a href="#">U.S.A.</a></li>
					<li>/</li>					
					<li><a href="#" class="active">New York</a></li>					
				</ul>				
			</div>
			<a class="backbtn right" href="#"></a>
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>	

	<!--####### CONTAINER #######-->
	<div class="container">
		<ul>
			<c:set item="${pageMaker}" var="totalCount">
				검색결과 총 ${totalCount}
			</c:set> 
			 
			<!-- 컨텐츠 검색 결과 템플릿 : list4.html -->
			<c:forEach items="${contentsList}" var = esContentsVO">
				<li>
					제목 : ${esContentsVO.title}</br>
					내용 : ${esContentsVO.contents}</br>
					조회수 ${esContentsVO.contentsViewCnt} | 리뷰 ${esContentsVO.contentsReviewCnt} | 스크랩 ${esContentsVO.contentsScrapCnt}
				</li>
			</c:forEach>
			<!-- 일정 검색 결과 템플릿 : list3.html -->
			<c:forEach items="${planList}" var = "esPlanVO">
				<li>
					제목 : ${esPlanVO.title}</br>
					내용 : ${esPlanVO.contents}</br>
					조회수 ${esPlanVO.contentsViewCnt} | 리뷰 ${esPlanVO.contentsReviewCnt} | 스크랩 ${esPlanVO.contentsScrapCnt}
				</li>
			</c:forEach>			
			<!-- 유저 검색 결과 템플릿 : list2.html -->	
			<c:forEach items="${memberList}" var = "esMemberVO">
				<li>
					제목 : ${esMemberVO.title}</br>
					내용 : ${esMemberVO.contents}</br>
					조회수 ${esMemberVO.contentsViewCnt} | 리뷰 ${esMemberVO.contentsReviewCnt} | 스크랩 ${esMemberVO.contentsScrapCnt}
				</li>
			</c:forEach>
		</ul>

		
		

		
	</div>
	<!-- END OF Container -->
	
	
  
  </body>

</html>

