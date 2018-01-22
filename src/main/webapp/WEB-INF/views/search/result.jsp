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
	
	<!-- end -->
  </head>
  <body id="top" class="thebg" >

	<!--####### HEADER #######-->
	<%@include file="../include/header2.jsp" %>
	<!-- 로그인 세션  -->
	<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
	
	<!-- Breadcrumbs -->
	<div class="container breadcrub">
		<div class="brlines"></div>
	</div><!-- / Breadcrumbs -->

	<div class="container">
		<!-- CONTENTS CONTAINER -->
		<div class="container pagecontainer offset-0" style="background:#f2f2f2">	
			<!-- LEFT CONTENT: SIDE FILTERS -->
			
			<%@include file="../include/sidefilter.jsp" %>
			
			<!-- RIGHT CONTENT -->
			<div class="rightcontent col-md-9 offset-2" style="background:#fff">
				
				<!-- 전체 검색결과 리스트  -->
				<div class="tab-pane  active" id="totalList">

					<ul class="list-group offset-2 margtop30">
						<a href="result?keyword=${cri.keyword }&go=total" class="list-group-item" >
						<span class="hidetext" style="color: black;font-weight:bold;">'${cri.keyword }' 검색결과</span>&nbsp; 
						</a>
					</ul>			
					<div class="offset-2"><hr></div>
					
					<!-- 통합검색결과가 없을경우 -->
					<c:set var="totalNum" value="${getNum.totalNum }" />
					<c:if test="${totalNum == 0 }" >
						<div class="offset-2" style="padding:20px ">
								<br/>
								<em style="color:red;">'${cri.keyword }'</em>
								에 대한 검색 결과가 없습니다.
						</div>
					</c:if>
					
					<!-- 컨텐츠 결과가 있을경우 -->
					<c:set var="contentsNum" value="${getNum.contentsNum }" />
					<c:if test="${contentsNum > 0 }" >
					
					<!-- 컨텐츠 검색결과  -->
					<div class="contentsResult" >
						
						<div class="offset-2" style="padding:20px ">	
							<div class=" left"><b>컨텐츠</b></div>
							
							<c:if test="${contentsNum > 3 }" >
								<div class=" grey right">
										<a href="/search/result?keyword=${cri.keyword}&go=contents" 
										style="text-decoration:underline"> 더보기 〉 </a>
								</div>
							</c:if>
							<div class="clearfix"></div>
						</div>
					
						<!-- 컨텐츠 리스트 -->
						<c:forEach items="${contentsList}" var = "esContentsVO" begin="0" end="2">	
							<div class="offset-2" >
								<div class="col-md-4 offset-0 listitem2" >
									<a href="/contents/${esContentsVO.category_id }/${esContentsVO.contents_id}">
										<img src="${esContentsVO.contents_thumbnail}"/>
									</a>
								</div>
								<div class="col-md-8 offset-0" style="border:1px solid #e6e6e6" >
									<div class="itemlabel4" style="height:208px;">
										<div class="labelright">
											<span class=" green size18"><b>${esContentsVO.contents_review_cnt}</b></span><span class="green size14"> Review</span><br>
													
												<div class="progress-custom" style="position:relative;">	
													<div style="width:100%; height:100%; background-color:silver"></div>						
	  												<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${esContentsVO.contents_rating*20}%; position:absolute; top:0;"></div>
													<img src="/resources/images/star.png" style="position:absolute; top:0; width:100%"/>
												</div>
											
											<span class="size11 grey ">${esContentsVO.contents_rating} Stars</span><br><br>
											<span class="margtop20 green size18"><b>0</b></span><span class="green size14"> Plan</span><br>
											<span class="size11 grey">${esContentsVO.contents_scrap_cnt} Scrap</span><br><br>
										 	
									 		<button class="bookbtn mt1" value="${esContentsVO.contents_id}" check="1" session="${empty userSession }" >스크랩</button>		
								 		
										</div>
										<div class="labelleft">			
											
											<c:choose>
												<c:when test="${esContentsVO.category_id == 1 }" > <span class="size14 label label-warning">${esContentsVO.category_value_kor}</span></c:when>
												<c:when test="${esContentsVO.category_id == 2 }" > <span class="size14 label label-primary">${esContentsVO.category_value_kor}</span></c:when>
												<c:otherwise> <span class="size14 label label-default"> ${esContentsVO.category_value_kor}</span></c:otherwise>
											</c:choose>
											<span class="size18">	
												<a href="/contents/${esContentsVO.category_id}/${esContentsVO.contents_id}">
													&nbsp;<b>${esContentsVO.contents_title} </b>
												</a>
											</span><br>
											<span class="margtop10 size12 grey glyphicon glyphicon-map-marker"></span><span class="grey size12"> ${esContentsVO.contents_location} </span> 
											<div class="line4 wh80percent"></div>
											<span class="opensans size14 grey">
												
											<c:forEach var="keyword" items="${esContentsVO.contents_keyword}">
											
											     	<span style="display:inline-block; border-radius:15px; border:1px solid #ddd; padding:5px 10px; margin:5px 2px">
											     		<b># </b> ${keyword}
										     		</span>
											     
											</c:forEach>

												
											</span> 
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="offset-2" style="padding-top:30px"></div>
						</c:forEach>
						<div class="offset-2"><hr></div>
					</div>

					</c:if>
					
					<!-- 일정 결과가 있을경우 -->
					<c:set var="planNum" value="${getNum.planNum }" />
					<c:if test="${planNum > 0 }" >
					
					<!-- 일정 검색결과 -->	
					<div class="plans">	

						<div class="offset-2" style="padding:20px ">	
							<div class=" left"><b>일정</b></div>
							<c:if test="${planNum > 3 }" >
								<div class=" grey right">
									<a href="/search/result?keyword=${cri.keyword }&go=plan" style="text-decoration:underline"> 더보기 〉 </a>
								</div>
							</c:if>
							<div class="clearfix"></div>
						</div>
							
						<c:forEach items="${planList}" var = "esPlanVO" begin="0" end="2">
							<div class="col-md-4" style="margin-bottom:30px">
								<div class="listitem ">
									<a href="/plan/read?planID=${esPlanVO.plan_id}">
										<img src="${esPlanVO.member_picture}" >
									</a>
								</div>
								<div class="itemlabel2">
									<div class="labelright" style="position:relative" >													
										<p class="member-profile" >
											<a href="/member/viewMember?memberID=${esPlanVO.member_id }"> 
												<img src="${esPlanVO.member_picture}" style="height:100%" >
											</a>
										</p>
										<p class="size12 grey ">${esPlanVO.member_name}</p><br>
										<span class="size11 grey">댓글수</span><br>
										<span class="size11 grey">${esPlanVO.plan_like_cnt} 좋아요수</span><br>
										<button class="bookbtn mt1">좋아요</button>		
									</div>
									<div class="labelleft">	
										<span class="size16"><b>${esPlanVO.plan_title}</b></span><br>		
<%-- 										<br>
										${esPlanVO.plan_startdate}<br>
										${esPlanVO.plan_enddate}<br>
										${esPlanVO.plan_endchk} --%>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
				
						</c:forEach>
						<div class="clearfix"></div>
						
						<div class="offset-2"><hr></div>	
					</div>
					
					</c:if>
					
					<!-- 멤버 결과가 있을경우 -->
					<c:set var="memberNum" value="${getNum.memberNum }" />
					<c:if test="${memberNum > 0 }" >
					
					<!-- 회원 검색결과 -->
					<div class="members">
					
						<div class="offset-2" style="padding:20px ">	
							<div class=" left"><b>회원</b></div>
							
							<c:if test="${memberNum > 3 }" >
								<div class=" grey right">
										<a href="/search/result?keyword=${cri.keyword }&go=member" 
										style="text-decoration:underline"> 더보기 〉 </a>
								</div>
							</c:if>
						<div class="clearfix"></div>
						</div>
						
						<c:forEach items="${memberList}" var = "esMemberVO" begin="0" end="2">
							<div class="col-md-4" style="margin-bottom:40px">
								<!-- CONTAINER-->
								<div class="carscontainer" style="border:1px solid #e6e6e6">
									<div class="center">
										<a href=""><img src="/resources/updates/update1/img/cars/car04.jpg"/></a>
									</div>
															
									<div class="purchasecontainer"  >
										<div class="offset-2 left bold" style="padding-top:5px">${esMemberVO.member_name}</div>		
										<div class="offset-2 right"><button class=" bookbtn mt1">팔로우</button></div>	
										<div class="clearfix"></div>
									</div>
									<div style="padding-top:20px"></div>
									<div class="clearfix"></div>
								</div>
								<!-- END OF CONTAINER-->
							</div>
						</c:forEach>
						<div class="clearfix"></div>
						<div class="offset-2"><hr></div>
					</div>	
					
					</c:if>
				</div> 
				<!-- 전체 검색결과 리스트 끝 -->
			
			</div> <!-- END OF RIGHT CONTENT -->
			
			
		</div> <!-- END OF CONTENTS CONTAINER -->
		

	</div>
	<!-- END OF Container -->
	
	<!--####### FOOTER #######-->
	
	
	
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