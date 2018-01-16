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
	<!-- Breadcrumbs -->
	<div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="#"></a>
			<div class="left offset-2">
				
				<a href="#" class="active">'${cri.keyword }' 검색결과</a>		
				
			</div>
			<a class="backbtn right" href="#"></a>
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div><!-- / Breadcrumbs -->
	
	<!--####### CONTAINER #######-->
	<div class="container">
		<!-- CONTENTS CONTAINER -->
		<div class="container pagecontainer offset-0">	
			<!-- LEFT CONTENT: SIDE FILTERS -->
			
			<%@include file="../include/sidefilter.jsp" %>
			
			<!-- RIGHT CONTENT -->
			<div class="rightcontent col-md-9 offset-2">
			
					
					<!-- 전체 검색결과 리스트  -->
					<div class="tab-pane  active" id="totalList">
						<!-- Top FILTERS -->
						<div class="hpadding20">
							<div class="topsortby">
								<div class="col-md-4 offset-0">
										
										<div class="left mt7"><b>Sort by:</b></div>
										
										<div class="right wh70percent">
											<select class="form-control mySelectBoxClass ">
											  <option selected>Guest rating</option>
											  <option>5 stars</option>
											  <option>4 stars</option>
											  <option>3 stars</option>
											  <option>2 stars</option>
											  <option>1 stars</option>
											</select>
										</div>
		
								</div>			
								<div class="col-md-4">
									<div class="w50percent">
										<div class="wh90percent">
											<select class="form-control mySelectBoxClass ">
											  <option selected>Name</option>
											  <option>A to Z</option>
											  <option>Z to A</option>
											</select>
										</div>
									</div>
									<div class="w50percentlast">
										<div class="wh90percent">
											<select class="form-control mySelectBoxClass ">
											  <option selected>Price</option>
											  <option>Ascending</option>
											  <option>Descending</option>
											</select>
										</div>
									</div>					
								</div>
								<div class="col-md-4 offset-0">
									<button class="popularbtn left">Most Popular</button>

								</div>
							</div>
						</div>
						<!-- End of Top FILTERS-->
						
						<!-- 컨텐츠 검색결과  -->
						<div class="itemscontainer" >
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>컨텐츠</b></div>
								
								<c:set var="more" value="${getNum.contentsNum }" />
								<c:if test="${more > 3 }" >
									<div class=" grey right">
											<a href="/search/result?keyword=${cri.keyword }&go=contents" 
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
											<img src=${esContentsVO.contents_thumbnail } alt="" style="display:block" />
										</a>
									</div>
									<div class="col-md-8 offset-0" style="border:1px solid #e6e6e6" >
										<div class="itemlabel4" style="height:208px;">
											<div class="labelright">
												<span class=" green size18"><b>${esContentsVO.contents_review_cnt}</b></span><span class="green size14"> Review</span><br>
												<img class="margtop10" src="/resources/images/filter-rating-${esContentsVO.contents_rating}.png" width="60" alt=""><br>
												<span class="size11 grey ">${esContentsVO.contents_rating} Stars</span><br><br>
												<span class="margtop20 green size18"><b>0</b></span><span class="green size14"> Plan</span><br>
												<span class="size11 grey">${esContentsVO.contents_scrap_cnt} Scrap</span><br><br>
											 	
										 		<button class="bookbtn mt1" value="${esContentsVO.contents_id}" check="1" >Scrap</button>		
									 			
											</div>
											<div class="labelleft">			
												<span class="size18"><a href="/contents/${esContentsVO.category_id }/${esContentsVO.contents_id}">
													<b>${esContentsVO.contents_title}</b></a>
												</span><br>
												<span class="margtop10 size12 grey glyphicon glyphicon-map-marker"></span><span class="grey2"> ${esContentsVO.contents_location}</span> 
												<div class="line4 wh80percent"></div>
												<span class="opensans size14 grey">
													Category: ${esContentsVO.category_value_kor}<br>
													Keyword: ${esContentsVO.contents_keyword }
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

						<!-- 일정 검색결과 -->	
						<div class="plans">
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>일정</b></div>
								
								<c:set var="more" value="${getNum.planNum }" />
								<c:if test="${more > 3 }" >
									<div class=" grey right">
											<a href="/search/result?keyword=${cri.keyword }&go=plans" 
											style="text-decoration:underline"> 더보기 〉 </a>
									</div>
								</c:if>
								
								<div class="clearfix"></div>
							</div>	
					
							<c:forEach items="${planList}" var = "esPlanVO" begin="0" end="2">
								<div class="col-md-4">
									<div class="listitem">
										<img src="http://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2016/09/countries-drive-from-india-cover2.jpg" >
									</div>
									<div class="itemlabel2">
										<div class="labelright">													
											<img src="/resources/images/user.png" alt="유저프로필" class=" ">
											<p class="size12 grey margtop20">${esPlanVO.member_name}</p><br>
											<span class="size11 grey">댓글수</span><br>
											<span class="size11 grey">좋아요수</span><br>
											<button class="bookbtn mt1">좋아요</button>		
										</div>
										<div class="labelleft">	
											<span class="size16"><b>${esPlanVO.plan_title}</b></span><br>		
											<br>
											<p class="grey">$</p>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</c:forEach>
							<div class="clearfix"></div>
							<div class="offset-2" style="padding-top:30px"></div>
							<div class="offset-2"><hr></div>	
						</div>
						
						<!-- 회원 검색결과 -->
						<div class="members">
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>회원</b></div>
					
								<c:set var="more" value="${getNum.memberNum }" />
								<c:if test="${more > 3 }" >
									<div class=" grey right">
											<a href="/search/result?keyword=${cri.keyword }&go=member" 
											style="text-decoration:underline"> 더보기 〉 </a>
									</div>
								</c:if>
							
							<div class="clearfix"></div>
							</div>	
							<c:forEach items="${memberList}" var = "esMemberVO" begin="0" end="2">
								<div class="col-md-4" >
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
							<div class="offset-2" style="padding-top:50px"></div>
							<div class="offset-2"><hr></div>
						</div>	
						
					</div> <!-- 전체 검색결과 리스트 끝 -->
	

				
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
    <!-- Scrap Btn -->
    <script src="/resources/js/scrap.js"></script>
    
  </body>

</html>