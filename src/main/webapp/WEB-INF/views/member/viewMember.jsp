<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel Agency - HTML5 Booking template</title>

    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    
    <link href="/resources/assets/css/followBtn.css" rel="stylesheet" media="screen">
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
<body>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<c:set var="session" value='<%= session.getAttribute("login")%>'/>

	<div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="/"></a>
			<div class="left offset-2">
				
				<p style="color: black;font-weight:bold;">회원 정보 조회</p>		
				
			</div>
			
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>	


<!-- CONTENT -->
<div class="container">


	<div class="container mt25 offset-0">



		<!-- CONTENT -->
		<div class="col-md-12 pagecontainer2 offset-0 padding50 active">



			<!-- RIGHT CPNTENT -->
			<div class="col-md-11 offset-0">
				<!-- Tab panes from left menu -->
				<div class="tab-content5">

					<!-- TAB 1 -->
					<!-- Admin top -->
					<div class="col-md-4 offset-0">
					
						<c:choose>
							<c:when test="${empty memberVO.memberPicture }">
								<img src="/resources/images/user.png" alt=""
									class="left margright20" id="profileImg"
									style="height: 100px; width: 100px;" />
							</c:when>
							<c:otherwise>
								<img src="/displayFile?fileName=${memberVO.memberPicture }"
									alt="" class="left margright20" id="profileImg"
									style="height: 100px; width: 100px;" />
							</c:otherwise>
						</c:choose>
						
						<p class="size20 grey margtop20">
							<span class="dark">${memberVO.memberName}</span><br />
						</p>
						

						<div class="container">
						
						<c:set var="followID" value="${memberVO.memberID }"/>
						
						<c:forEach items="${followChkList}" var="followChk" varStatus="status">
							<c:choose>
								<c:when test='${followChk ne followID}'>
    								<button class="btn followButton" value="${followID}" rel="6">Follow</button>
								</c:when>
								<c:otherwise>
									<button class="btn followButton following" value="${followID}" rel="6">Following</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>	
						
						</div>
						
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4"></div>
					<div class="col-md-4 offset-0">
						<table class="table table-bordered  mt-10">
							<!-- ymmu data -->
							<tr class="grey opensans">
								<td class="center" style="width:33%"><span class="size30 slim lh4"
									id="numPlans">${fn:length(planVO)}</span><br />
								<span class="size12">Plans</span></td>
								<td class="center" style="width:33%"><span class="size30 slim lh4"
									id="totalDays">1</span><br />
								<span class="size12">Followers</span></td>
								<td class="center" style="width:33%"><span class="size30 slim lh4"
									id="numCountries">1</span><br />
								<span class="size12">Follows</span></td>
							</tr>
							<!-- ymmu data -->
						</table>
					</div>
					<!-- End of Admin top -->

					<div class="clearfix"></div>
					<br />
					<br /> <span class="lblue size18">${memberVO.memberName}</span> <span
						class="dark size18">님이 등록한 일정</span>

					<div class="line4"></div>

					<!-- LIST CONTENT-->

					<div class="hpadding20"></div>
					<!-- End of padding -->

					<br />
					<br />
					<div class="clearfix"></div>

					<%-- 작성한 plan이 있을때 화면에 뿌려준다. --%>
					<c:if test="${not empty planVO}">
						<div class="itemscontainer offset-1">
							<c:forEach items="${planVO}" var="planVO" varStatus="status">
								<div class="col-md-4">
									<div class="listitem">
									
										<c:choose>
											<c:when test='${pictureID[status.index] ne "" }'>
												<img src="/displayFile?fileName=${pictureID[status.index]}"
													alt="" />
											</c:when>
											<c:otherwise>
												<img src="" alt="" />
											</c:otherwise>
										</c:choose>
										
										<div class="liover"></div>
										
										<c:choose>
											<c:when test='${likeChkList[status.index] ne 1 }'>
												<a id="likeBtn" class="fav-icon like" href="javascript:void(0)" value= ${planVO.planID } likeBtnCheck='0'></a>
											</c:when>
											<c:otherwise>
												<a id="likeBtn" class="fav-icon-red like" href="javascript:void(0)" value= ${planVO.planID } likeBtnCheck='1'></a>
											</c:otherwise>
										</c:choose>
										
										<a class="book-icon" href="/plan/read?planID=${planVO.planID}"></a>
									</div>
									<div class="itemlabel" style="text-align: center;">
										<a href="/plan/read?planID=${planVO.planID}"><b>${planVO.planTitle}</b></a><br />
									</div>
								</div>
								<%-- plan 3개마다 줄바꿈 --%>
								<c:if test="${status.count%3 eq 0}">
									<div class="clearfix"></div>
									<div class="offset-2">
										<hr class="featurette-divider3">
									</div>
								</c:if>
							</c:forEach>
							<div class="clearfix"></div>
							<div class="offset-2">
								<hr class="featurette-divider3">
							</div>
						</div>
					</c:if>


<input type="hidden" id="memberID" value=${session.memberID } />
<input type="hidden" id="writerID" value=${memberVO.memberID } />

					<!-- End of offset1-->
					
							<!-- pagination -->
							<div class="hpadding20">
								<ul class="pagination right paddingbtm20">
									
									<c:if test="${pageMaker.prev }">
										<li><a href="${pageMaker.startPage-1 }">&laquo;</a></li>
									</c:if>
									
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
										
										<li id="contentsPage"
											<c:out value="${pageMaker.cri.curPage == idx?'class=active':'' }"></c:out>>
											<a href="/member/viewMember?memberID=${memberVO.memberID }&&page=${idx }" >${idx }</a>
										</li>
										
									</c:forEach>
									
									<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
										<li><a href="${pageMaker.endPage+1 }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>

					<!-- END OF LIST CONTENT-->

					<div class="clearfix"></div>

					<!-- END OF TAB 1 -->

				</div>
				<!-- End of Tab panes from left menu -->

			</div>
			<!-- END OF RIGHT CPNTENT -->

			<div class="clearfix"></div>
			<br />
		</div>
		<!-- END CONTENT -->



	</div>


</div>
<!-- END OF CONTENT -->




<!-- FOOTER -->

<div class="footerbgblack">
	<div class="container">

		<div class="col-md-3">
			<span class="ftitleblack">Let's socialize</span>
			<div class="scont">
				<a href="#" class="social1b"><img
					src="/resources/images/icon-facebook.png" alt="" /></a> <a href="#"
					class="social2b"><img src="/resources/images/icon-twitter.png"
					alt="" /></a> <a href="#" class="social3b"><img
					src="/resources/images/icon-gplus.png" alt="" /></a> <a href="#"
					class="social4b"><img src="/resources/images/icon-youtube.png"
					alt="" /></a> <br />
				<br />
				<br /> <a href="#"><img src="/resources/images/logosmal2.png"
					alt="" /></a><br /> <span class="grey2">&copy; 2013 | <a
					href="#">Privacy Policy</a><br /> All Rights Reserved
				</span> <br />
				<br />

			</div>
		</div>
		<!-- End of column 1-->

		<div class="col-md-3">
			<span class="ftitleblack">Travel Specialists</span> <br />
			<br />
			<ul class="footerlistblack">
				<li><a href="#">Golf Vacations</a></li>
				<li><a href="#">Ski & Snowboarding</a></li>
				<li><a href="#">Disney Parks Vacations</a></li>
				<li><a href="#">Disneyland Vacations</a></li>
				<li><a href="#">Disney World Vacations</a></li>
				<li><a href="#">Vacations As Advertised</a></li>
			</ul>
		</div>
		<!-- End of column 2-->

		<div class="col-md-3">
			<span class="ftitleblack">Travel Specialists</span> <br />
			<br />
			<ul class="footerlistblack">
				<li><a href="#">Weddings</a></li>
				<li><a href="#">Accessible Travel</a></li>
				<li><a href="#">Disney Parks</a></li>
				<li><a href="#">Cruises</a></li>
				<li><a href="#">Round the World</a></li>
				<li><a href="#">First Class Flights</a></li>
			</ul>
		</div>
		<!-- End of column 3-->

		<div class="col-md-3 grey">
			<span class="ftitleblack">Newsletter</span>
			<div class="relative">
				<input type="email" class="form-control fccustom2black"
					id="exampleInputEmail1" placeholder="Enter email">
				<button type="submit" class="btn btn-default btncustom">
					Submit<img src="/resources/images/arrow.png" alt="" />
				</button>
			</div>
			<br />
			<br /> <span class="ftitleblack">Customer support</span><br /> <span
				class="pnr">1-866-599-6674</span><br /> <span class="grey2">office@travel.com</span>
		</div>
		<!-- End of column 4-->


	</div>
</div>

<div class="footerbg3black">
	<div class="container center grey">
		<a href="#">Home</a> | <a href="#">About</a> | <a href="#">Last
			minute</a> | <a href="#">Early booking</a> | <a href="#">Special
			offers</a> | <a href="#">Blog</a> | <a href="#">Contact</a> <a
			href="#top" class="gotop scroll"><img
			src="/resources/images/spacer.png" alt="" /></a>
	</div>
</div>


<!-- Javascript  -->
<script src="/resources/assets/js/js-list.js"></script>

<!-- Nicescroll  -->
<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>

<!-- Custom functions -->
<script src="/resources/assets/js/functions.js"></script>
<script src="/resources/js/like.js"></script>
<script src="/resources/js/follow.js"></script>

<!-- Custom Select -->
<script src='/resources/assets/js/jquery.customSelect.js'
	type='text/javascript'></script>

<!-- Counter -->
<script src="/resources/assets/js/counter.js"></script>

<!-- Load Animo -->
<script src="/resources/plugins/animo/animo.js"></script>

<!-- Picker -->
<script src="/resources/assets/js/jquery-ui.js"></script>

<!-- Picker -->
<script src="/resources/assets/js/jquery.easing.js"></script>




</body>
</html>
