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
	<%@include file="include/header2.jsp" %>
	
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
		<!-- CONTENTS CONTAINER -->
		<div class="container pagecontainer offset-0">	
			
			<!-- LEFT CONTENT: SIDE FILTERS -->
			<div class="col-md-3 filters offset-0">
				<ul class="blogcat margleft20 margright20 margtop10">
					<li onclick="mySelectUpdate()" class="size16">
						<a data-toggle="tab" href="#contentsList">
						<span class="hoteltab3"></span><span class="hidetext">'${keyword }'검색결과</span>&nbsp; 
						<span class="badge indent0">${getNum.get("totalNum") }</span></a></li>
					<li onclick="mySelectUpdate()" class="">
						<a data-toggle="tab" href="#contentsList">
						<span class="hoteltab3"></span><span class="hidetext">컨텐츠</span>&nbsp; 
						<span class="badge indent0">${getNum.get("contentsNum") }</span></a></li>
					<li onclick="mySelectUpdate()" class="">
						<a data-toggle="tab" href="#planList">
						<span class="cartab3"></span><span class="hidetext">일정</span>&nbsp; 
						<span class="badge indent0">${getNum.get("planNum") }</span></a></li>
					<li onclick="mySelectUpdate()" class="">
						<a data-toggle="tab" href="#vacationstab3">
						<span class="suitcasetab3"></span><span class="hidetext">회원</span>&nbsp; 
						<span class="badge indent0">${getNum.get("memberNum") }</span></a></li>
				</ul>

				
				
				
			</div>
			
			<!-- RIGHT CONTENT -->
			<div class="rightcontent col-md-9 offset-0">
				<div class="tab-content6">
						
						<!-- Tab totalList -->
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
										<div class="right">
											<button class="gridbtn" onClick="window.open('list2.html','_self');">&nbsp;</button>
											<button class="listbtn active">&nbsp;</button>
										</div>
									</div>
								</div>
							</div>
							<!-- End of Top FILTERS-->
							
							<div class="itemscontainer offset-1">
								<!--####### 컨텐츠 검색결과 : 템플릿 z-cruise-list.html #######-->
								<c:forEach items="${contentsList}" var = "esContentsVO" begin="0" end="9">
									<div class="offset-2" >
										<div class="col-md-4 offset-0" >
											<div class = "listitem2" >
												<a href="/resources/updates/update1/img/activities/act04.jpg" data-footer="A custom footer text" data-title="A random title" data-gallery="multiimages" data-toggle="lightbox">
												<img src="/resources/updates/update1/img/activities/act04.jpg" alt="" style="display:block" />
												</a>
												<div class="liover"></div>
												<a class="fav-icon" href="#"></a>
												<a class="book-icon" href="details.html"></a>
											</div>	
										</div>
										<div class="col-md-8 offset-0" style="border:1px solid #e6e6e6" >
											<div class="labelright">
												<img src="/resources/images/filter-rating-${esContentsVO.rating}.png" width="60" alt=""><br><br><br>
												<img src="/resources/images/user-rating-5.png" width="60" alt=""><br>
												<span class="size11 grey">${esContentsVO.contentsReviewCnt} Reviews</span><br><br>
												<span class="green size18"><b>1 </b>Plan</span><br>
												<span class="size11 grey margbot20">/ ${esContentsVO.contentsScrapCnt} Scrap</span><br><br>
											 	<button class="bookbtn mt1" type="submit">Scrap</button>		
											</div>
											<div class="labelleft">			
												<span class="size16"><b>${esContentsVO.title}</b></span><br>
												<span class="opensans size14 grey"><span class="grey2">Category:</span> 맛집, 관광</span><br>
												<div class="line4 wh80percent"></div>									
												<p class="grey size14 lh6">
													<span class="opensans size14 grey2">Keyword:</span> #여기에 #태그 #있으면 #좋겠다<br>
													${esContentsVO.contents}
												</p>	
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="clearfix"></div>
							
								</c:forEach>
								<div class="offset-2"><hr class="featurette-divider2"></div>
							
								<!--####### 일정 검색결과 : 템플릿 list3.html #######-->
								<p class="margleft20"><a>일정 더보기</a> </p>	
								<c:forEach items="${planList}" var = "esPlanVO" begin="0" end="9">
									<div class="col-md-4">
										<div class="listitem">
											<img src="/resources/images/items/item1.jpg" alt="일정사진은 뭘로쓸까">
											<div class="liover" style="width: 10%; height: 10%; background-color: rgb(255, 153, 0); position: absolute; top: 90px; left: 125.5px; opacity: 0;"></div>
											<a class="fav-icon" href="#" style="top: 79px; left: -25px;"></a>
											<a class="book-icon" href="#" style="top: 79px; left: 251px;"></a>
										</div>
										<div class="itemlabel2">
											<div class="labelright">													
												<img src="/resources/images/user.png" alt="유저프로필" class=" ">
												<p class="size12 grey margtop20">유저아이디</p><br>
												<span class="size11 grey">댓글수</span><br>
												<span class="size11 grey">좋아요수</span><br>
												<button class="bookbtn mt1">Book</button>		
											</div>
											<div class="labelleft">	
												<span class="size16"><b>${esPlanVO.planTitle}</b></span><br>		
												<br>
												<p class="grey">${esPlanVO.planDetailVO.title}</p>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</c:forEach>
								<div class="offset-2"><hr class="featurette-divider2"></div>	
										
								<!--####### 유저 검색결과 : 템플릿 list2.html #######-->
								<p class="margleft20"><a>유저 더보기</a> </p>		
								<c:forEach items="${memberList}" var = "esMemberVO" begin="0" end="9">
									<div class="col-md-4" >
										<!-- CONTAINER-->
										<div class="carscontainer" style="border:1px solid #e6e6e6">
											<div class="center">
												<a href=""><img src="/resources/updates/update1/img/cars/car04.jpg" alt="유저 배경사진"/></a>
											</div>
																	
											<div class="purchasecontainer">
												<div class="col-md-8 offset-0">
													<img src="/resources/images/user.png" alt="유저프로필"  class="left margright10">
													<p class="size14 margtop10">
														<span class="bold">${esMemberVO.memberName}</span><br>
														<span class="size12 grey">일정수 / 팔로워수</span>
													</p>
													<div class="clearfix"></div>
												</div>		
												<button class="col-md-4 bookbtn">Follow</button>	
											</div>
											<div class="clearfix"></div>
										</div>
										<!-- END OF CONTAINER-->
									</div>
								</c:forEach>
								<div class="clearfix"></div>
								<div class="offset-2"><hr class="featurette-divider3"></div>	
									
							</div>
						</div>
						<!-- End of Tab totalList -->
						
						<!-- Tab contentsList -->
						<div class="tab-pane " id="contentsList">
							<div class="itemscontainer offset-1">
								컨텐츠 검색 상세 리스트 
								
							</div>
							<br/><br/>
							<div class="clearfix"></div>
							
							<div class="hpadding20">
								<ul class="pagination right paddingbtm20">
								  <li class="disabled"><a href="#">&laquo;</a></li>
								  <li><a href="#">1</a></li>
								  <li><a href="#">2</a></li>
								  <li><a href="#">3</a></li>
								  <li><a href="#">4</a></li>
								  <li><a href="#">5</a></li>
								  <li><a href="#">&raquo;</a></li>
								</ul>
							</div>
						</div>
						<!-- End of Tab contentsList -->							
					
						<!-- Tab "planList" -->
						<div class="tab-pane " id="planList">
						</div>
						<!-- End of Tab "planList" -->		
					
						<!-- Tab userList -->
						<div class="tab-pane " id="userList">
						</div>
						<!-- End of Tab userList -->		
						
						
						<div class="clearfix"></div><br/>

				</div>
						  
						
				

			</div>
			<!-- END OF CONTENTS CONTAINER -->
			
		

		</div>
		<!-- END OF container-->
		
	</div>
	<!-- END OF Container -->
	
	<!--####### FOOTER #######-->
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
  </body>

</html>