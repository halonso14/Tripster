<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header2.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
<link href="/resources/dist/css/bootstrap.css" rel="stylesheet"
	media="screen">
<style type="text/css">
#map {
height: 100%;
}
.container {
	padding-right: 0px;
	padding-left: 0px;
	margin-right: auto;
	margin-left: auto;
}
</style>
<script src="https://code.jquery.com/jquery-2.0.3.js" charset="UTF-8"></script>

<!-- bin/jquery.slider.min.js -->
<script type="text/javascript"
	src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
<script type="text/javascript"
	src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
<script type="text/javascript"
	src="/resources/plugins/jslider/js/tmpl.js"></script>
<script type="text/javascript"
	src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
<script type="text/javascript"
	src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
<script type="text/javascript"
	src="/resources/plugins/jslider/js/jquery.slider.js"></script>
<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
</head>



<body>
	<!-- CONTENT -->
	<!-- 유저 세션  -->
	<c:set var="userSession" value='<%=session.getAttribute("login")%>' />

	<!-- container -->
	<div class="container">
		<!-- '리스트 페이지' 버튼 -->
		<div class="container pagecontainer offset-0">
			<button class="btn-search4 right" id="getList">리스트 페이지</button>

			<div class="container pagecontainer offset-0">
				<!-- 슬라이더 파트 시작  -->
				<div class="col-md-8 details-slider">
					<div id="c-carousel">
						<div id="wrapper">
							<div id="inner">
								<div id="caroufredsel_wrapper2">

									<div id="carousel">

										<img
											src="https://www.e-architect.co.uk/images/jpgs/new_york/southwest-ny-bar-d050813.jpg"
											alt="" style="width: 625px; height: 387.5px;"> <img
											src="http://catchrestaurants.com/catchnyc/wp-content/uploads/2015/07/12-CATCH_0171_FINAL1.jpg"
											alt="" style="width: 625px; height: 387.5px;"> <img
											src="${vo.contentsThumbnail}" alt=""
											style="width: 625px; height: 387.5px;"> <img
											src="http://catchrestaurants.com/catchnyc/wp-content/uploads/2015/07/12-CATCH_0171_FINAL1.jpg"
											alt="" style="width: 625px; height: 387.5px;"> <img
											src="${vo.contentsThumbnail}" alt=""
											style="width: 625px; height: 387.5px;"> <img
											src="http://catchrestaurants.com/catchnyc/wp-content/uploads/2015/07/12-CATCH_0171_FINAL1.jpg"
											alt="" style="width: 625px; height: 387.5px;">
									</div>


								</div>
								<div id="pager-wrapper">
									<div id="pager">
										<img
											src="https://www.e-architect.co.uk/images/jpgs/new_york/southwest-ny-bar-d050813.jpg"
											width="120" height="68" alt="" /> <img
											src="http://catchrestaurants.com/catchnyc/wp-content/uploads/2015/07/12-CATCH_0171_FINAL1.jpg"
											width="120" height="68" alt="" /> <img
											src="${vo.contentsThumbnail}" width="120" height="68" alt="" />
										<img
											src="http://catchrestaurants.com/catchnyc/wp-content/uploads/2015/07/12-CATCH_0171_FINAL1.jpg"
											width="120" height="68" alt="" /> <img
											src="${vo.contentsThumbnail}" width="120" height="68" alt="" />
										<img
											src="http://catchrestaurants.com/catchnyc/wp-content/uploads/2015/07/12-CATCH_0171_FINAL1.jpg"
											width="120" height="68" alt="" />
									</div>
								</div>
							</div>

							<div class="clearfix"></div>
							<button id="prev_btn2" class="prev2">
								<img src="/resources/images/spacer.png" alt="" />
							</button>
							<button id="next_btn2" class="next2">
								<img src="/resources/images/spacer.png" alt="" />
							</button>
						</div>
					</div>
					<!-- 왼쪽 슬라이더 끝 -->
				</div>

				<div class="col-md-4 detailsright offset-0">


					<!-- 로그인 체크 -->
					<c:choose>
						<c:when test="${empty userSession}">
							<!-- 스크랩 버튼 없음 -->
						</c:when>

						<c:otherwise>
							<!-- 로그인시 스크랩 버튼 추가 -->
							<button class="btn-search4 left" id="scrapBtn" value=${scrapCheck}>스크랩</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- 아래 파트 시작 -->
			<div class="container pagecontainer offset-0">
				<div class="col-md-12 pagecontainer offset-0">
					<div class="cstyle10"></div>
						<ul class="nav nav-tabs" id="myTab">
							<li onclick="loadScript()" class=""><a data-toggle="tab" href="#maps"><span class="maps"></span><span class="hidetext">Maps</span></a></li>
							<li onclick="mySelectUpdate()" class=""><a data-toggle="tab" href="#reviews"><span class="reviews"></span><span class="hidetext">Review</span></a></li>
						</ul>
					<div class="tab-content4">
						<!-- 구글맵 -->
						<div id="maps" class="tab-pane fade">
							<div class="hpadding20">
								<div id="map-canvas"></div>
							</div>
						</div>	
						<!-- 리뷰 리스트 조회 -->
						<div id="reviews" class="tab-pane fade ">
							<div class="hpadding20">
								<span class="opensans dark size16 bold">Reviews</span>
							</div>
							<div class="line2"></div>

							<!-- 리뷰 호출 -->
							<div class="hpadding20" id="reviewList"></div>

							<!-- 리뷰 페이징 -->
							<div class="hpadding20">
								<ul class="pagination right paddingbtm20" id="reviewPaging"></ul>
							</div>

							<!-- 리뷰 작성 -->
							<br />
							<br />
							<br />
							<div class="hpadding20">
								<span class="opensans dark size16 bold">Write your review</span>
							</div>

							<div class="line2"></div>

							<div class="wh25percent left center" style="height: 400px;">
								<ul class="jslidetext2">
									<li>Title</li>
									<li>rating</li>
									<li style="margin: 120px 0px;">Comment</li>
								</ul>
							</div>
							<div class="wh75percent right offset-0">
								<div class="padding12 relative wh75percent">
									<input type="text" class="form-control margtop10"
										id="reviewTitle" placeholder="리뷰 제목을 입력해주세요">
									<div id="collapse1" class="collapse in">
										<div class="hpadding20">
											<div class="checkbox">
												<label> <input type="checkbox" value=5><img src="/resources/images/filter-rating-5.png" class="imgpos1" />5 Stars</label>
											</div>
											<div class="checkbox">
												<label> <input type="checkbox" value=4><img src="/resources/images/filter-rating-4.png" class="imgpos1" />4 Stars</label>
											</div>
											<div class="checkbox">
												<label> <input type="checkbox" value=3><img src="/resources/images/filter-rating-3.png" class="imgpos1" />3 Stars</label>
											</div>
											<div class="checkbox">
												<label> <input type="checkbox" value=2><img src="/resources/images/filter-rating-2.png" class="imgpos1" />2 Stars</label>
											</div>
											<div class="checkbox">
												<label> <input type="checkbox" value=1><img src="/resources/images/filter-rating-1.png" class="imgpos1" />1 Star</label>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
									<!-- End of Star ratings -->
									<textarea class="form-control margtop10" rows="5" id="reviewDetail" writer=${memberVO.memberName}></textarea>

									<div class="clearfix"></div>
									<div id="uploadDiv">
										<div class='uploadList'></div>
										<button id="uploadBtn">업로드</button>
									</div>
									<button type="submit" class="btn-search4 margtop10"
										id="writeReview">리뷰 등록</button>

									<br/><br/>
								</div>
							</div>
							<div class="clearfix"></div>
						<!--  -->
						</div>
						
						
					</div>
				</div>
			</div>



			<!-- END CONTENT -->

			<script>
				//구글 맵 불러오기
				function initMap() {
					var map = new google.maps.Map(document.getElementById('map'), {
						zoom : 14,
						center : new google.maps.LatLng(48.830808, 2.230123)
					});
					var marker = new google.maps.Marker({
						position : new google.maps.LatLng(48.830808, 2.230123),
						map : map
					});
				}
			</script>
			
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArNEZiYMXtSHjGN2HOwjfeYS3FzeAGNJw&callback=initMap" async defer></script>
			
			<script>
				$(document).ready(function() {
					var memberID = ${memberVO.memberID};
					var memberName = "${memberVO.memberName}";
					var listPage = ${cri.curPage};
					var contentsID = ${contentsID};
					var categoryID = ${categoryID};
					var reviewPage = 1;
					var scrapbt = $("#scrapBtn");
					var scrapCheck = 0;
					// 화면에서 등록한 파일 이름 저장
					var fileNames = new Array;
					var contentsReviewRating = 0;
									// 리뷰 평점 저장
					$('input[type="checkbox"]').on("click",function() {
						$('input[type="checkbox"]').not(this).prop("checked",false);
							contentsReviewRating = this.value;
							alert(contentsReviewRating);
					});
					// 스크랩 체크
					$.post('/scrapCheck/'+contentsID,function(check) {
						scrapbt.attr('value', check);
					});
					// 스크랩 누를경우
					scrapbt.on('click', function() {
						alert(scrapbt.val());
						// 스크랩 아이디 확인 
						if (scrapbt.val() == 1) {
							scrapbt.attr('value', "0");
							alert(scrapbt.val());
							// 스크랩 추가 ajax
							$.post('/scrap/' + contentsID,
								function(result) {
									alert(result);
								});
						} else {
							scrapbt.attr('value', "1");
							alert(scrapbt.val());
							// 스크랩 제거 ajax
							$.post('/scrapDelete/'+ contentsID,function(result) {
								alert(result);
							});
						};
					});
					// 리뷰 리스트 불러오기
					getReviewList(reviewPage);
									// 컨텐츠 리스트 페이지 가기
					$("#getList").on("click",function() {
						self.location = "/contents/contentsList/"+ categoryID + "/"+ listPage;
					});
					// 리뷰 등록
					$("#writeReview").on("click",function() {
						var contentsReviewTitle = $("#reviewTitle").val();
						var contentsReview = $("#reviewDetail").val();
						$.ajax({
							type : 'post',
							url : '/contents/contentsDetail/'+ contentsID,headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"},
							dataType : 'text',
							data : JSON.stringify({
								contentsID : contentsID,
								memberID : memberID,
								memberName : memberName,
								contentsReviewTitle : contentsReviewTitle,
								contentsReview : contentsReview,
								reviewPictureName : fileNames,
								contentsReviewRating : contentsReviewRating
							}),
							success : function(data) {
								// 리뷰 등록후 처음 1 페이지로 이동
								getReviewList(1);}
						});
						// 등록 후 리뷰 텍스트 내용 초기화
						$("#reviewTitle").val("리뷰 제목을 입력해주세요")
						$("#reviewDetail").val("")});
						// 리뷰 페이지 숫자 버튼 눌렀을때
						$("#reviewPaging").on("click", "a",function(event) {
							event.preventDefault();
							var tmp = $(this).attr("href");
							getReviewList(tmp);
						});
						// 업로드 버튼을 누른경우 css 적용
						$('#uploadBtn').on('click', function() {
							$('.uploadList').css({
								'width' : '100%',
								'height' : '200px',
								'border' : '1px dotted blue'
							});
						});
						// 파일을 끌어올때 
						$('.uploadList').on("dragenter dragover",function(event) {
							event.preventDefault();
						});
						// 파일을 박스안에 놓을때 	
						$('.uploadList').on("drop",function(event) {
							console.log('put file');
							event.preventDefault();
							// 박스안에 놓인 파일 가져오기
							var file = event.originalEvent.dataTransfer.files;
							// 가져온 파일을 저장
							var files = file[0];
							// formDate 객체 생성
							var formData = new FormData();
							// formData 객체에 파일 데이터 저장
							formData.append("file",files);
							// ajax로 컨트롤러에 데이터 전송
							$.ajax({
								url : "/uploadAjax",
								data : formData,
								dataType : 'text',
								processData : false,
								contentType : false,
								type : 'post',
								// 데이터를 보낸 후 
								success : function(data) {
									var str = "";
									getFileNames(data);
									// 생성된 파일의 이름 포맷 검사
									if (checkImageType(data)) {
										// 이미지 파일일 경우 썸네일 생성
										str = "<li>"
											// 원본 파일 링크
											+ "<a href='/displayFile?fileName="+ getImageLink(data)+ "'>"
											+ "<img src='/displayFile?fileName="+ data+ "'/>"
											+ getOriginalName(data)
											+ "</a>"
											+ "<small fileName="+data+">X</small></li>";
									} else {
										// 이미지 파일이 아닐경우 다운로드
										str = "<li><a href='/displayFile?fileName="+ data+ "'>"+ getOriginalName(data)
											+ "</a><small fileName="+data+">X</small></li>";
									}
									$('.uploadList').append(str);
								}
							});
						});
									// 삭제 버튼 누를 경우
									$('.uploadList').on(
											'click',
											'small',
											function(event) {
												var that = $(this);
												// 파일 이름 저장
												var filename = that.attr('fileName');
												// 포스트 방식으로 데이터 전달
												$.post('deleteFile', {fileName : filename}, function(result) {
													that.parent("li").remove();
												});
											});
									// 리뷰 리스트 함수
									function getReviewList(reviewPage) {
										$.getJSON("/contents/review/"+ contentsID+ "/"+ reviewPage, function(data) {
											var str = "";
											//날짜 형태를 02-01와 같은 형태를 위한 함수.
											Number.prototype.padLeft = function(base, chr) {
												var len = (String(base || 10).length - String(this).length) + 1;
												return len > 0 ? new Array(len).join(chr|| '0')+ this: this;
											}
											// usage
											//=> 3..padLeft() => '03'
											//=> 3..padLeft(100,'-') => '--3' 
											// 컨텐츠의 리뷰 리스트 받아오기
											$(data.list).each(function() {
												var d = new Date(this.updatedDate);
												var dformat = [d.getFullYear(),(d.getMonth() + 1).padLeft(), ].join('/')+ ' '+ [d.getHours().padLeft(),d.getMinutes().padLeft(),d.getSeconds().padLeft() ].join(':');
												str += "<div class='col-md-4 offset-0 center' data-contentsReviewID='"+this.contentsReviewID+"'>"
													+ "		<div class='padding20'>"
													+ "			<div class='bordertype5'>"
													+ "				<div class='circlewrap'>"
													+ "					<img src='/resources/images/user-avatar.jpg' class='circleimg' alt=''/><span>"
													+ this.contentsReviewRating
													+ "</span>"
													+ "				</div>"
													+ "				<span class='dark'>"
													+ this.memberName
													+ "</span><br/>"
													+ "				<img src='/resources/images/check.png' alt=''/><br/>"
													+ "				<span class='green'>Recommended<br/>for Everyone</span>"
													+ "			</div>"
													+ "		</div>"
													+ "	</div>"
													+ "	<div class='col-md-8 offset-0'>"
													+ "		<div class='padding20'>"
													+ "			<span class='opensans size16 dark'>"
													+ this.contentsReviewTitle
													+ "</span><br/>"
													+ "			<span class='opensans size13 lgrey'>"
													+ dformat
													+ "</span><br/>"
													+ "			<p data-contentsReviewID='"+this.contentsReviewID+"' class='"+this.contentsReviewID+"'>"
													+ this.contentsReview
													+ "</p>"
													//						+ " 			<div id='getImage'>"+getImage(this.reviewPictureName)+"</div>" 
													+ "		</div>"
													+ "	</div>"
													+ " <div>"
													+ "		<button class='btn-search4 right modify' id='"+this.contentsReviewID+"'>Modify</button>"
													+ "     <button class='btn-search4 right delete' id='"+this.contentsReviewID+"'>delete</button>"
													+ "		<div class='clearfix'></div>"
													+ "</div>"
													+ ""
													+ "<div class='line3'></div>";
											});
											// reviewList 에 추가
											$("#reviewList").html(str);
											// 초기화 후 업로드박스안의 파일 제거
											$('.uploadList').html("");
											// 초기화후 업로드 박스 제거
											$('.uploadList').removeAttr('style');
											// 리뷰 등록시 업로드했던 파일 이름 제거
											fileNames = new Array;
											// 페이징 처리
											printPaging(data.pageMaker);
										});
									}
									// 리뷰 아이디를 받아 이미지 생성 
									function getImage(reviewPictureName) {
										var fileList = new Array;
										var str = "";
										fileList = reviewPictureName;
										// 받은 파일 이름들로 이미지 추가
										for (var i = 0; i < fileList.length; i++) {
											// 확장자 검사
											if (checkImageType(fileList[i])) {
												// 이미지 파일일 경우 썸네일 생성
												str = str
														+ "<li>"
														// 원본 파일 링크
														+ "<a href='/displayFile?fileName="
														+ getImageLink(fileList[i])
														+ "'>"
														// 썸네일 생성
														+ "<img src='/displayFile?fileName="
														+ fileList[i]
														+ "'/>"
														+ getOriginalName(fileList[i])
														+ "</a></li>";
											} else {
												// 이미지 파일이 아닐경우 다운로드
												str = str
														+ "<li><a href='/displayFile?fileName="
														+ fileList[i]
														+ "'>"
														+ getOriginalName(fileList[i])
														+ "</a></li>";
											}
											;
										}
										return str;
									}
									// 리뷰 수정
									$('#reviewList').on('click','.modify',function() {
														// 리뷰 아이디
														var contentsReviewID = $(this).attr('id');
														if (this.value == 1) {
															// 수정 텍스트 출력
															$(this).attr('value', 0);
															var str = "<textarea id='textarea' cols=" + 30 + "rows=" + 10 + "></textarea>";
															$('.'+ contentsReviewID).html(str);
														} else {
															// 수정 내용 저장
															var modify = $('#textarea').val();
															$(this).attr('value', 1);
															// 수정 내용 전달
															$.ajax({
																type : 'put',
																url : '/contents/contentsDetail/'+ contentsID+ '/'+ contentsReviewID,
																headers : {
																	"Content-Type" : "application/json",
																	"X-HTTP-Method-Override" : "PUT",
																},
																dataType : 'text',
																data : JSON.stringify({
																	contentsID : contentsID,
																	memberID : memberID,
																	contentsReview : modify
																}),
																success : function(result) {
																		alert(result);
																		// 리뷰 등록후 처음 1 페이지로 이동
																		getReviewList(1);
																}
															});
														}
													})
									// 리뷰 삭제
									$('#reviewList').on('click','.delete',function() {
										alert('click');
										// 리뷰 아이디
										var contentsReviewID = $(this).attr('id');
										console.log(contentsReviewID);
										$.ajax({
											type : 'delete',
											url : '/contents/contentsDetail/'+ contentsID+ '/'+ contentsReviewID,
											headers : {
												"Content-Type" : "application/json",
												"X-HTTP-Method-Override" : "DELETE",
											},
											dataType : 'text',
											success : function(result) {
												alert(result);
												// 리뷰 등록후 처음 1 페이지로 이동
												getReviewList(1);
											}
										});
									})
									// 리뷰 등록시  파일 이름 저장
									function getFileNames(data) {
										fileNames.push(data);
									}
									// 페이징 처리
									function printPaging(pageMaker) {
										var str = "";
										if (pageMaker.prev) {
											str += "<li><a href='"
													+ (pageMaker.startPage - 1)
													+ "'> << </a></li>";
										}
										for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
											var strClass = pageMaker.cri.curPage == i ? 'class=active'
													: '';
											str += "<li " +strClass+"><a href='"+i+"'>"
													+ i + "</a></li>";
										}
										if (pageMaker.next) {
											str += "<li><a href='"
													+ (pageMaker.endPage + 1)
													+ "'> >> </a></li>";
										}
										$("#reviewPaging").html(str);
									}
									;
									// 확장자 체크
									function checkImageType(fileName) {
										var pattern = /jpg$|gif$|png$|jpeg$/i;
										// 이미지 확장자일 경우 true 리턴
										return fileName.match(pattern);
									}
									;
									// UUID이름 지우기
									function getOriginalName(fileName) {
										// 이미지 파일인 경우 _가 2번 들어감
										var idx = fileName.indexOf("_") + 1;
										var str = fileName.substr(idx);
										var idx2 = str.indexOf("_") + 1;
										return str.substr(idx2);
									}
									// 이미지 파일 링크 처리
									function getImageLink(fileName) {
										// /년/월/일 추출
										var front = fileName.substr(0, 12);
										// s_ 제거한 원본 이름
										var end = fileName.substr(14);
										// 원본이름 리턴
										return front + end;
									}
								});
			</script>

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
			<link
				href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
				rel='stylesheet' type='text/css'>
			<link
				href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic'
				rel='stylesheet' type='text/css'>
			<!-- Font-Awesome -->
			<link rel="stylesheet" type="text/css"
				href="/resources/assets/css/font-awesome.css" media="screen" />
			<!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->

			<!-- REVOLUTION BANNER CSS SETTINGS -->
			<link rel="stylesheet" type="text/css"
				href="/resources/css/fullscreen.css" media="screen" />
			<link rel="stylesheet" type="text/css"
				href="/resources/rs-plugin/css/settings.css" media="screen" />

			<!-- Picker UI-->
			<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />

			<!-- bin/jquery.slider.min.css -->
			<link rel="stylesheet"
				href="/resources/plugins/jslider/css/jslider.css" type="text/css">
			<link rel="stylesheet"
				href="/resources/plugins/jslider/css/jslider.round-blue.css"
				type="text/css">

			<!-- bin/jquery.slider.min.js -->
			<script type="text/javascript"
				src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
			<script type="text/javascript"
				src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
			<script type="text/javascript"
				src="/resources/plugins/jslider/js/tmpl.js"></script>
			<script type="text/javascript"
				src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
			<script type="text/javascript"
				src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
			<script type="text/javascript"
				src="/resources/plugins/jslider/js/jquery.slider.js"></script>


			<!-- Googlemap -->
			<script src="/resources/assets/js/initialize-google-map.js"></script>

			<!-- Custom Select -->
			<script type='text/javascript'
				src='/resources/assets/js/jquery.customSelect.js'></script>

			<!-- Custom functions -->
			<script src="/resources/assets/js/functions.js"></script>

			<!-- Nicescroll  -->
			<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>

			<!-- jQuery KenBurn Slider  -->
			<script type="text/javascript"
				src="/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

			<!-- CarouFredSel -->
			<script
				src="/resources/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
			<script
				src="/resources/assets/js/helper-plugins/jquery.touchSwipe.min.js"></script>

			<script type="text/javascript"
				src="/resources/assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
			<script type="text/javascript"
				src="/resources/assets/js/helper-plugins/jquery.transit.min.js"></script>
			<script type="text/javascript"
				src="/resources/assets/js/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>

			<!-- Counter -->
			<script src="/resources/assets/js/counter.js"></script>

			<!-- Carousel-->
			<script src="/resources/assets/js/initialize-carousel-detailspage.js"></script>

			<!-- Js Easing-->
			<script src="/resources/assets/js/jquery.easing.js"></script>

</body>
</html>