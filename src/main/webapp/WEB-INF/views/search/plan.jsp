<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<!-- bin/jquery.slider.min.js -->
	<script type="text/javascript" src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/tmpl.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.slider.js"></script>
  </head>
  <body id="top" class="thebg" >

	<!-- HEADER -->
	<%@include file="../include/header2.jsp" %>
	<!-- 로그인 세션  -->
	<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
	
	<!-- BREADCRUMBS -->
	<div class="container breadcrub"><div class="brlines"></div></div>

	<div class="container">
		<div class="container pagecontainer offset-0" style="background:#f2f2f2">	
			
			<!-- LEFT: SIDE FILTERS -->
			<%-- <%@include file="../include/search/sidefilter.jsp" %> --%>
			
			<!-- RIGHT: CONTENT BOX -->
			<div class="rightcontent col-md-9 offset-2" style="background:#fff">

				<c:if test="${planList.planCnt == 0}" >
					<!-- 검색결과가 없을경우 -->
					<span class="searchStatus ">'${cri.keyword}'에 대한 일정 검색결과가 없습니다.</span>
				</c:if>	
				
				<c:if test="${planList.planCnt > 0}" >	
					<!-- 검색결과가 있을경우 -->
					<span class="searchStatus">'${cri.keyword}' 검색결과</span>	
										
					<!-- 일정 검색결과 리스트 -->
					<c:forEach items="${planList.planList}" var = "esPlanVO" begin="${(pageMaker.cri.page-1)*9}" end="${pageMaker.cri.page*9-1}">
						<%@include file="../include/search/plan.jsp" %>	
					</c:forEach>
										
					<!-- pagination -->
					<ul class="pagination right">
						<c:if test="${pageMaker.prev}">
							<li><a href="${pageMaker.makeQuery(pageMaker.startPage-1)}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">	
							<li id="contentsPage" <c:out value="${pageMaker.cri.page == idx?'class=active':''}"></c:out>>
								<a href="${pageMaker.makeQuery(idx)}">${idx}</a>
							</li>	
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
						</c:if>
					</ul> 

				</c:if>										
			</div> <!-- 일정 검색 결과 더보기 리스트 끝 -->

		</div> <!-- END OF RIGHT CONTENT -->
	</div> <!-- END OF CONTENTS CONTAINER -->

	
	<!-- FOOTER -->
	<%@include file="../include/footer.jsp" %>

    <!-- Javascript -->	
    <script src="/resources/assets/js/js-list4.js"></script>	
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/assets/js/jquery.customSelect.js'></script>
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/js/lightbox.js'></script>	
    <!-- JS Ease -->	
    <script src="/resources/assets/js/jquery.easing.js"></script>
    <!-- Custom functions -->
    <script src="/resources/assets/js/functions.js"></script>
    <!-- jQuery KenBurn Slider  -->
    <script type="text/javascript" src="/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <!-- Counter -->	
    <script src="/resources/assets/js/counter.js"></script>	
    <!-- Nicescroll  -->	
	<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>
    <!-- Picker -->	
	<script src="/resources/assets/js/jquery-ui.js"></script>
    <!-- Bootstrap -->	
    <script src="/resources/dist/js/bootstrap.min.js"></script>
	<!--  Scrap Btn -->
    <script src="/resources/js/scrap.js"></script>

  </body>

</html>