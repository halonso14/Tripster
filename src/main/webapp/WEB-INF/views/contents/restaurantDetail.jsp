<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html style="overflow-x: hidden;">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>title</title>
	
	<!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    
    <!-- Button -->
	<link href="/resources/assets/css/scrapBtn.css" rel="stylesheet" media="screen">
	<!-- scrap -->
	<script src="/resources/js/scrapHD.js"></script>
	<!-- review -->
	<!-- 
	<script src="/resources/js/review.js"></script>
 -->
	<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- Fonts -->	
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>	
	<!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/font-awesome.css" media="screen" />
	
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/fullscreen.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/resources/rs-plugin/css/settings.css" media="screen" />
	
    <!-- Picker UI-->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />	
	
	<!-- bin/jquery.slider.min.css -->
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.css" type="text/css">
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.round-blue.css" type="text/css">
	
    <!-- jQuery-->	
    <script src="/resources/assets/js/jquery.v2.0.3.js"></script>
	<script src="/resources/assets/js/jquery-ui.js"></script>	
	
	<!-- bin/jquery.slider.min.js -->
	<script type="text/javascript" src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/tmpl.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.slider.js"></script>
	<!-- end -->
    

	<style type="text/css">
	html {
		overflow-x: hidden;
	}
	</style>

<body id="top" class="thebg" >
	<div class="container breadcrub">
		<a class="homebtn left" href="/"></a>
			<div class="left offset-2">
				
				<p style="color: black;font-weight:bold;"></p>		
				
			</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>
	<!-- CONTENT -->
	<!-- 유저 세션  -->
	<c:set var="userSession" value='<%=session.getAttribute("login")%>' />

	<!-- container -->
	<div class="container">
		<!-- '리스트 페이지' 버튼 -->
		<button class="btn-search4 right" id="getList">리스트 페이지</button>

			<div class="container pagecontainer offset-0">
				<!-- 슬라이더 파트 시작  -->
				<div class="col-md-8 details-slider">
					<div id="c-carousel">
						<div class="wrapper2">
							<div class="list_carousel2">
								<ul class="foo5">
									<c:if test="${not empty vo.contentsThumbnail}">
										<c:set var="image" value=""/>
					           				<li>
												<a href="${vo.contentsThumbnail}"><img class="img-responsive" src="${vo.contentsThumbnail}" style="max-height: 407px;max-width: 950px; width: 950px; height: 407px" /></a>
											</li>
									</c:if>
								</ul>
								<div class="clearfix"></div>
									<a id="prev_btn" class="xprev" href=""><img src="/resources/images/spacer.png" alt=""/></a>
									<a id="next_btn" class="xnext" href=""><img src="/resources/images/spacer.png" alt=""/></a>
							</div>				
						</div>
<!-- 						
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
							</div>
							<div class="clearfix"></div>
						</div>
 -->		
					</div>
					<!-- 왼쪽 슬라이더 끝 -->
				</div>
<!-- 이미지 슬라이더 -->
<script>
						//------------------------------
						//CaroufredSell
						//------------------------------
						$(document).ready(function(jQuery){
							jQuery(".foo5").carouFredSel({
								width: "100%",
								height: 407,
								items: {
									visible: 5,
									minimum: 1,
									start: 2
								},
								scroll: {
									items: 1,
									easing: "easeInOutQuad",
									duration: 500,
									pauseOnHover: true
								},
								auto: false,
								prev: {
									button: "#prev_btn",
									key: "left"
								},
								next: {
									button: "#next_btn",
									key: "right"
								},				
								swipe: true
							});
						});
</script>
					<!-- 로그인 체크 -->
					<!-- 
					<c:choose>
						<c:when test="${empty userSession}">
						</c:when>
						<c:otherwise>
							<button class="btn-search4 left" id="scrapBtn" value=${scrapCheck}>스크랩</button>
						</c:otherwise>
					</c:choose>
					 -->
				<!-- 오른쪽 파트 시작 -->
				<div class="col-md-4 detailsright offset-0">
					<div class="padding20">
					<h4 class="lh1">${vo.title}</h4>
					<img src="/resources/images/smallrating-5.png" alt=""/>
				</div>
				
				<div class="line3"></div>
				
				<div class="hpadding20">
					<h2 class="opensans slim green2">Wonderful!</h2>
				</div>
				
				<div class="line3 margtop20"></div>
				
				<div class="col-md-6 bordertype1 padding20">

					${vo.location}
				</div>
				<div class="col-md-6 bordertype2 padding20">
					<span class="opensans size30 bold grey2">Taste</span><br/>
					of ${vo.city}
				</div>
				
				<div class="col-md-6 bordertype3">
					<img src="/resources/images/user-rating-4.png" alt=""/><br/>
					${vo.contentsReviewCnt} reviews
				</div>
				<div class="col-md-6 bordertype3">
					<img src="/resources/images/user-rating-4.png" alt=""/><br/>
					${vo.contentsScrapCnt} scraps
				</div>
				<div class="clearfix"></div><br/>
				<div class="hpadding20">
					<c:choose>
						<c:when test="${not empty memberVO}">
							<c:set var='memberID' value='${memberVO.memberID}' />
						</c:when>
						<c:otherwise>
							<c:set var='memberID' value='' />
						</c:otherwise>	
					</c:choose>
					<c:choose>
						<c:when test='${scrapCheck ne contentsID}'>
							<button class="btn scrapButton" onmouseenter="mouseover('${memberID}',$(this))" onmouseleave="mouseout($(this))" value="${contentsID}" rel="6">스크랩</button>
						</c:when>
						<c:otherwise>
							<button class="btn scrapButton scraped" onmouseenter="mouseover('${memberID}',$(this))" onmouseleave="mouseout($(this))" value="${contentsID}" rel="6">스크랩</button>
						</c:otherwise>
					</c:choose>
				</div>
					
				</div>
			</div>

			<!-- 아래 파트 시작 -->
			<div class="container mt25 offset-0">
				<div class="col-md-12 pagecontainer2 offset-0">
					<div class="cstyle10"></div>
						<ul class="nav nav-tabs" id="myTab">
							<li onclick="mySelectUpdate()" class="active"><a data-toggle="tab" href="#reviews"><span class="thingstodo"></span><span class="hidetext">Reviews</span>&nbsp;</a></li>
							<li onclick="loadScript()" class=""><a data-toggle="tab" href="#maps"><span class="maps"></span><span class="hidetext">Maps</span></a></li>
						</ul>
					<div class="tab-content4">
						<!-- TAB1 -->
						<!-- 리뷰 리스트 조회 -->
						<div id="reviews" class="tab-pane fade active in" data->
							<div class="hpadding20">
								<br/>
								<span class="opensans dark size16 bold">Reviews</span>
							</div>
							<div class="line2"></div>

							<!-- 리뷰 호출 -->
							<div class="hpadding20" id="reviewList">
							</div>

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

							<div class="wh25percent left center">
								<ul class="jslidetext2">
									<li>Title</li>
									<li>rating</li>
									<li>Comment</li>
								</ul>
							</div>
							<div class="wh75percent right offset-0">
								<script>
									//This is a fix for when the slider is used in a hidden div
									function testTriger(){
										setTimeout(function (){
											$(".cstyle01").resize();
										}, 10);	
									}
								</script>
								<div class="padding12 relative wh75percent">
									<input type="text" class="form-control margtop10" id="reviewTitle" placeholder="리뷰 제목을 입력해주세요">
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
									<button type="submit" class="btn-search4 margtop10" id="writeReview">리뷰 등록</button>

									<br/><br/>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						
						<!-- TAB2 -->
						<!-- 구글맵 -->
						<div id="maps" class="tab-pane fade">
							<div class="hpadding20">
								<div id="map-canvas"></div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
					
				</div>
			</div>
		</div>
<script>
$(document).ready(function() {
	var memberID = "${memberVO.memberID}";
	var memberName = "${memberVO.memberName}";
	var listPage = ${cri.curPage};
	var contentsID = "${contentsID}";
	var categoryID = ${categoryID};
	var reviewPage = 1;
	
	var scrapCheck = "${scrapCheck}";
	var fileNames = new Array;
	var contentsReviewRating = 0;
	
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
					+ " 			<div id='getImage'>"+getImage(this.reviewPictureName)+"</div>" 
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
	
	//리뷰리스트 조회 함수 호출
	getReviewList(reviewPage, memberID, contentsID);
	// 리뷰 등록
	// 리뷰 평점 저장
	$('input[type="checkbox"]').on("click",function() {
		$('input[type="checkbox"]').not(this).prop("checked",false);
			contentsReviewRating = this.value;
	});
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
			url : '/contents/contentsDetail/'+ contentsID,
			headers : {
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
			success : function(data) {}
				// 리뷰 등록후 처음 1 페이지로 이동
//				getReviewList(1);
		});
		// 등록 후 리뷰 텍스트 내용 초기화
		$("#reviewTitle").val("리뷰 제목을 입력해주세요");
		$("#reviewDetail").val("");
	});
	
	// 리뷰 페이지 숫자 버튼 눌렀을때
	$("#reviewPaging").on("click", "a",function(event) {
		event.preventDefault();
		var tmp = $(this).attr("href");
		//getReviewList(tmp);
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
		}
		return str;
	}
	
	function getFileNames(data) {
		fileNames.push(data);
	}
	
	
	
	// 확장자 체크
	function checkImageType(fileName) {
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		// 이미지 확장자일 경우 true 리턴
		return fileName.match(pattern);
	}
	
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

			<!-- Javascript -->	
			<script src="/resources/assets/js/js-details.js"></script>
			
			<!-- Googlemap -->	
			<script src="/resources/assets/js/initialize-google-map.js"></script>

			<!-- Nicescroll  -->	
			<script src="/resources/assets/js/jquery.nicescroll.min.hd.js"></script>
			
		    <!-- Custom Select -->
			<script type='text/javascript' src='/resources/assets/js/jquery.customSelect.js'></script>
			
		    <!-- Custom functions -->
		    <script src="/resources/assets/js/functions.js"></script>
			
		    <!-- jQuery KenBurn Slider  -->
		    <script type="text/javascript" src="/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
			
		    <!-- CarouFredSel -->
		    <script src="/resources/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
		    <script src="/resources/assets/js/helper-plugins/jquery.touchSwipe.min.js"></script>
			
			<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
			<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.transit.min.js"></script>
			<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
			
		
		    <!-- Counter -->	
		    <script src="/resources/assets/js/counter.js"></script>	
			
		    <!-- Carousel-->	
		    <script src="/resources/assets/js/initialize-carousel-detailspage.js"></script>		
			
		    <!-- Js Easing-->	
		    <script src="/resources/assets/js/jquery.easing.js"></script>
		
			
		    <!-- Bootstrap-->	
		    <script src="/resources/dist/js/bootstrap.min.js"></script>

</body>
</html>