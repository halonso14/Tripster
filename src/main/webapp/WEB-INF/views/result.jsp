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
    <link href="/resources/updates/update1/css/search.css" rel="stylesheet" media="screen">
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
	<%@include file="include/header2.jsp" %>
	<!-- 로그인 세션  -->
	<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
	
	<!-- Breadcrumbs -->
	<div class="container breadcrub">
		<span class="hidetext" style="color: black;font-weight:bold;">'${cri.keyword }' 검색결과</span>
		<div class="brlines"></div>
	</div><!-- / Breadcrumbs -->

	<div class="container">
		<!-- CONTENTS CONTAINER -->
		<div class="container pagecontainer offset-0" style="background:#f2f2f2">	
			
			<!-- LEFT CONTENT: SIDE FILTERS -->
			<%@include file="include/sidefilter.jsp" %>
			
			<!-- RIGHT CONTENT -->
			<div class="rightcontent col-md-9 offset-2" style="background:#fff">
				<c:set var="getNum" value="${getNum}" />
				<div class="offset-2"><hr></div>
				
				<div class="tabcontent active" id="totalList">
				<!-- 통합 검색결과 리스트  -->
					
					<c:if test="${getNum.totalNum == 0 }" >
					<!-- 검색결과가 없을경우 -->
						<div class="offset-2" style="padding:20px ">
							<em>'${cri.keyword }'</em>에 대한 검색 결과가 없습니다.
						</div>
						<div class="offset-2"><hr></div>
					</c:if>
					
					<c:if test="${getNum.contentsNum > 0 }" >
					<!--  컨텐츠 결과가 있을경우  -->
						<!-- 컨텐츠 검색결과 리스트 -->
						<div class="totalResult contentsResult" >	
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>컨텐츠</b></div>	
									
								<c:if test="${getNum.contentsNum > 3 }" >
								<!-- 컨텐츠 검색결과 갯수가 3개 이상일 경우 더보기 버튼 노출 -->	
									<div class=" grey right">
										<button class="" onclick="more(event,'contentsList')">더보기</button>
									</div>
								</c:if>
								<div class="clearfix"></div>
							</div>
							<!-- 컨텐츠 리스트 -->
							
							<c:forEach items="${contentsList}" var = "esContentsVO" begin="0" end="2">	
								<%@include file="include/search/contents.jsp" %>	
							</c:forEach>
							<!--  Scrap Btn -->
							<script src="/resources/js/scrap.js"></script>
 			
							<div class="offset-2"><hr></div>
						</div>
					</c:if>
					
					<c:if test="${getNum.planNum > 0 }" >
					<!-- 일정 결과가 있을경우 -->
						<!-- 일정 검색결과 -->	
						<div class="plans">	
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>일정</b></div>

								<c:if test="${getNum.planNum > 3 }" >
								<!-- 일정 검색결과 갯수가 3개 이상일 경우 더보기 버튼 노출 -->
									<div class=" grey right">
										<button class="" onclick="more(event,'planList')">더보기</button>
									</div>
								</c:if>
								<div class="clearfix"></div>
							</div>
							<!-- 일정 리스트 -->	
							<c:forEach items="${planList}" var = "esPlanVO" begin="0" end="2">
								<%@include file="include/search/plan.jsp" %>	
							</c:forEach>
							<div class="clearfix"></div>
							<div class="offset-2"><hr></div>	
						</div>
					</c:if>

					<c:if test="${getNum.memberNum > 0 }" >
					<!-- 회원 결과가 있을경우 -->
						<!-- 회원 검색결과 -->
						<div class="members">
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>회원</b></div>
								
								<c:if test="${getNum.memberNum > 3 }" >
								<!-- 회원 검색결과 갯수가 3개 이상일 경우 더보기 버튼 노출 -->
									<div class=" grey right">
										<button class="" onclick="more(event,'memberList')">더보기</button>
									</div>
								</c:if>
								<div class="clearfix"></div>
							</div>
							<!--회원 리스트 -->
							<c:forEach items="${memberList}" var = "esMemberVO" begin="0" end="2">
								<%@include file="include/search/member.jsp" %>
							</c:forEach>
							<div class="clearfix"></div>
							<div class="offset-2"><hr></div>
						</div>	
					</c:if>
				
				</div> <!-- 통합 검색 결과 리스트 끝 -->
				
				
				<div class="tabcontent" id="contentsList" >
				<!-- 컨텐츠 검색 결과 더보기 리스트 -->
					<c:if test="${getNum.contentsNum == 0 }" >
					<!-- 검색결과가 없을경우 -->
						<div class="offset-2" style="padding:20px ">
							<em>'${cri.keyword }'</em>에 대한 컨텐츠 검색 결과가 없습니다.
						</div>
					</c:if>
					<c:if test="${getNum.contentsNum > 0 }" >
					<!--  컨텐츠 결과가 있을경우  -->
						<!-- 컨텐츠 검색결과 리스트 -->
						<div class="totalResult contentsResult">	
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>컨텐츠</b></div>	
								<div class="clearfix"></div>
							</div>								
							<!-- 컨텐츠 리스트 -->
							<c:forEach items="${contentsList}" var = "esContentsVO" begin="${(cri.page*cri.perPageNum)-contentsPageMaker.displayPageNum}" end="${(cri.page*cri.perPageNum)-1}">	
								<%@include file="include/search/contents.jsp" %>	
							</c:forEach>
							<div class="offset-2"><hr></div>
						</div>								
					</c:if>	
					<!-- pagination -->
					<div class="hpadding20">
						<ul class="pagination right paddingbtm20">
							<c:if test="${contentsPageMaker.prev }">
								<li><a href="${contentsPageMaker.makeQuery(contentsPageMaker.startPage-1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${contentsPageMaker.startPage }" end="${contentsPageMaker.endPage }" var="idx">	
								<li id="contentsPage" class="<c:out value="${contentsPageMaker.cri.page == idx?' active':'' }"></c:out>">
									<a href="${contentsPageMaker.makeQuery(idx,'contentsList')}" >${idx}</a>
								</li>	
							</c:forEach>
							<c:if test="${contentsPageMaker.next && contentsPageMaker.endPage > 0 }">
								<li><a href="${contentsPageMaker.makeQuery(contentsPageMaker.endPage+1,go) }">&raquo;</a></li>
							</c:if>
						</ul> 
					</div>				
				</div> <!-- 컨텐츠 검색결과더보기 리스트 끝 -->
			
			
			

				<div class="tabcontent" id="planList">
				<!-- 일정 검색 결과 더보기 리스트 -->
					<c:if test="${getNum.planNum == 0 }" >
					<!-- 검색결과가 없을경우 -->
						<div class="offset-2" style="padding:20px ">
							<em>'${cri.keyword }'</em>에 대한 일정 검색 결과가 없습니다.
						</div>
					</c:if>
					<!-- 일정 리스트 -->	
					<c:forEach items="${planList}" var = "esPlanVO" begin="0" end="2">
						<%@include file="include/search/plan.jsp" %>	
					</c:forEach>
					<div class="clearfix"></div>
					<div class="offset-2"><hr></div>						
					<!-- pagination -->
					<div class="hpadding20">
 						<ul class="pagination right paddingbtm20">
							<c:if test="${planPageMaker.prev }">
								<li><a href="${planPageMaker.makeQuery(planPageMaker.startPage-1)}">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${planPageMaker.startPage }" end="${planPageMaker.endPage }" var="idx">	
								<li id="contentsPage" <c:out value="${planPageMaker.cri.page == idx?'class=active':''}"></c:out>>
									<a href="${planPageMaker.makeQuery(idx,'planList')}" >${idx}</a>
								</li>	
							</c:forEach>
							<c:if test="${planPageMaker.next && planPageMaker.endPage > 0 }">
								<li><a href="${planPageMaker.makeQuery(planPageMaker.endPage+1) }">&raquo;</a></li>
							</c:if>
	
							
						</ul> 
					</div>										
				</div> <!-- 일정 검색 결과 더보기 리스트 끝 -->
				
				
				<div class="tabcontent" id="memberList">
				<!-- 회원 검색 결과 더보기 리스트 -->
					<c:if test="${getNum.memberNum == 0 }" >
					<!-- 검색결과가 없을경우 -->
						<div class="offset-2" style="padding:20px ">
							<em>'${cri.keyword }'</em>에 대한 회원 검색 결과가 없습니다.
						</div>
					</c:if>
					<!--회원 리스트 -->
					<c:forEach items="${memberList}" var = "esMemberVO" begin="0" end="2">
						<%@include file="include/search/member.jsp" %>
					</c:forEach>
					<div class="clearfix"></div>
					<div class="offset-2"><hr></div>					
					<!-- pagination -->
					<div class="hpadding20">
 						<ul class="pagination right paddingbtm20">
							<c:if test="${memberPageMaker.prev }">
								<li><a href="${memberPageMaker.makeQuery(memberPageMaker.startPage-1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${memberPageMaker.startPage }" end="${memberPageMaker.endPage }" var="idx">	
								<li id="contentsPage" <c:out value="${memberPageMaker.cri.page == idx?'class=active':'' }"></c:out>>
									<a href=${memberPageMaker.makeQuery(idx,'memberList') } >${idx}</a>
								</li>	
							</c:forEach>
							<c:if test="${memberPageMaker.next && contentsPageMaker.endPage > 0 }">
								<li><a href="${memberPageMaker.makeQuery(memberPageMaker.endPage+1) }">&raquo;</a></li>
							</c:if>
						</ul> 
					</div>					
				</div> <!-- 회원 검색 결과 더보기 리스트 끝 -->
				
				
			</div> <!-- END OF RIGHT CONTENT -->
		</div> <!-- END OF CONTENTS CONTAINER -->
	</div> <!-- END OF Container -->
	
	<!-- FOOTER -->
	<%@include file="include/footer.jsp" %>

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