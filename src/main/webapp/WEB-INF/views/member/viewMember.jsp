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

</head>
<body>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<c:set var="session" value='<%= session.getAttribute("login")%>'/>


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
						<p class="size20 grey margtop40">
							<span class="dark">${memberVO.memberName}</span><br />
						</p>
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

					<!-- 작성한 plan이 있을때 화면에 뿌려준다. -->
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
										<input type="hidden" id="planID" value=${planVO.planID } />
										<a id="like" class="fav-icon like" href="javascript:void(0)" value= ${likeChkList[status.index] } ></a>
										<a class="book-icon" href="/plan/read?planID=${planVO.planID}"></a>
									</div>
									<div class="itemlabel" style="text-align: center;">
										<a href="/plan/read?planID=${planVO.planID}"><b>${planVO.planTitle}</b></a><br />
									</div>
								</div>
								<!-- plan 3개마다 줄바꿈 -->
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
<!-- <script type="text/javascript" src="/resources/js/like.js"></script> -->

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
