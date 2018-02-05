<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
		<title>Tripster :: ${vo.title}</title>
	
		<!-- Bootstrap -->
	    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
	    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
		<link href="/resources/updates/update1/css/search.css" rel="stylesheet" media="screen">
		<link href="/resources/updates/update1/css/style02.css" rel="stylesheet" media="screen">   
	    <!-- Button -->
		<link href="/resources/assets/css/scrapBtn.css" rel="stylesheet" media="screen">
		<!-- scrap -->
		<script src="/resources/js/searchScrap.js"></script>
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

	</head>
	<body id="top" class="thebg" >
		<!-- 로그인 세션  -->
		<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
		<!-- HEADER -->
		<%@include file="../include/header2.jsp" %>
		<!-- BREADCRUMBS -->
		<div class="container breadcrub"><div class="brlines"></div></div>
		
		<!-- container -->
		<div class="container">
			<div class="container pagecontainer offset-0" s>	
				<div class="col-md-8 details-slider" style="background-image:url('${vo.contentsThumbnail}')">
			</div>			
	
			<div class="col-md-4 detailsright offset-0">
				<div class="offset-2">
					<div style="padding:10px 0">

						<!-- '리스트 페이지' 버튼 -->
						<c:choose>
							<c:when test="${cri.keyword==null}">
								<a href= "javascript:history.go(-1);"><span class="backListBtn">목록보기</span></a>
							</c:when>
							<c:when test="${cri.tab=='total'}">
								<a href="/search/result?cnt=${cri.cnt}&tab=${cri.tab}&page=${cri.page}&keyword=${cri.keyword}"><span class="backListBtn">목록보기</span></a>
							</c:when>
							<c:otherwise>
								<a href="/search/${cri.tab}?cnt=${cri.cnt}&tab=${cri.tab}&page=${cri.page}&keyword=${cri.keyword}"><span class="backListBtn">목록보기</span></a>
							</c:otherwise>	
						</c:choose>
						<div class="clearfix"></div>					
					</div>
							
					<div style="padding:5px 0 0 0; ">	
						<c:choose>
							<c:when test="${vo.categoryID == 1 }" > 
								<span class="size14 label label-warning" >맛집</span>
							</c:when>
				 			<c:otherwise>
				 				<span class="size14 label label-primary">관광지</span>
			 				</c:otherwise>
						</c:choose> 
						<c:set value="${vo.title}" var="esTitle"/>
						<span style="font-size:20px;"><b>
							<c:choose>
								<c:when test="${fn:length(esTitle) > 30}">
									<c:out value="${fn:substring(esTitle,0,29)}"/>..
								</c:when>
								<c:otherwise>
									<c:out value="${esTitle}"/>
								</c:otherwise> 
							</c:choose>					
						</b></span><br>
						<p style="padding:5px 2px">
							<span class="margtop10 size12 grey glyphicon glyphicon-map-marker"></span>
							<span class="grey size12"> ${vo.location} </span> 
						</p>
					</div>
					<div class="line3 "></div>	
				</div>

				<div class="opensans size14 grey" style="padding:10px">
					<c:forEach var="keyword" items="${vo.keyword }">
				     	<span class="keywordTag" ><b># </b> ${keyword}</span>
					</c:forEach>
				</div> 
				<div class="line3 "></div>
				
				<div class="col-md-6 bordertype1 padding20 ">
					<div class="progress-custom" style="position:relative; height:30px!important; margin:0 10px">	
						<div style="width:100%; height:100%; background-color:silver"></div>						
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${vo.rating*20}%; position:absolute; top:0;"></div>
						<img src="/resources/images/star.png" style="position:absolute; top:0;left:0; width:100%; height:100%"/>
					</div>
					<p class="size14" style="padding-top:10px">${vo.rating} Stars</p>
				</div>						
				<div class="col-md-6 bordertype1 padding20">
					<span class="opensans size24 grey2" style="padding-top:10px"> View Count ${vo.contentsViewCnt }</span><br>
					<p class="size14" style="padding-top:8px" id="${vo.contentsID}"><ui id="${vo.contentsID}">${vo.contentsScrapCnt}</ui> Scraps</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-md-12 " style="padding:40px;">
					<button class="btn scrapButton " value="${vo.contentsID}" onmouseenter="scrapmouseover('${userSession.memberID }',$(this))" rel="6" style="width:100%; ">스크랩</button>
				</div>
				<script>
					var scrapbtn = $("button[value="+${vo.contentsID}+"]");
					var session = ${empty userSession };
					var scrapIdList ="";
					if(session != true){
						scrapIdList = ${scrapIdList};
						for(let i=0;i<scrapIdList.length;i++){
							if(scrapbtn.val() == scrapIdList[i]){
								scrapbtn.addClass("scraped");
							};
						};
					};
				</script>
				

				</div>
				</div>
				</div>
				
				
			<!-- 아래 파트 시작 -->
			<div class="container mt25 offset-0">
				<div class="col-md-12 pagecontainer2 offset-0">
					<div class="cstyle10"></div>
						<ul class="nav nav-tabs" id="myTab">
							<li onclick="mySelectUpdate()" class="active"><a data-toggle="tab" href="#detail"><span class="thingstodo"></span><span class="hidetext">상세보기</span>&nbsp;</a></li>
							<li onclick="mySelectUpdate()" ><a data-toggle="tab" href="#reviews"><span class="thingstodo"></span><span class="hidetext">리뷰달기</span>&nbsp;</a></li>
							<li onclick="loadScript('${vo.lat}','${vo.lng}')" class=""><a data-toggle="tab" href="#maps"><span class="maps"></span><span class="hidetext">지도보기</span></a></li>
						</ul>
					<div class="tab-content4">
						<!-- TAB1 -->
						<div id="detail" class="tab-pane fade active in" data->
						 
						 	<div>${contentsURL}</div>
						 	<div>${contentsHomePage}</div>
						 	<div>${reviewList}</div>
						
						</div>
						
						<!-- 리뷰 리스트 조회 -->
						<div id="reviews" class="tab-pane fade in" data->
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
									<li style="margin-top: 115px;">Comment</li>
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
										
							            <input type="file" name="upload"/>
									        
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

	<!-- FOOTER -->
	<%@include file="../include/footer.jsp" %>		

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
				var tmp = "";
				var name = "";
				// 회원 사진
				var profile = "<img src='/displayFile?fileName="+ this.memberPictureName+ "&directory='profile' style='width: 52px;height:  52px;' class='circleimg' alt=''/>";
				
				if(memberID == this.memberID) {
					tmp +=  " <div style='margin-bottom: 10px;'>"
						+ "		<button class='btn-search4 right modify' id='"+this.contentsReviewID+"' value=1>Modify</button>"
						+ "     <button class='btn-search4 right delete' id='"+this.contentsReviewID+"' value=1>delete</button>"
						+ "		<div class='clearfix'></div>"
						+ "</div>"
				}
				
				if('${session.memberID}' == '${plan.memberID}') {
					name = "							<ul class='dropdown-menu'>"
						+ "									<li><a href='/member/viewMember?memberID="+this.memberID+"'>나의 일정 리스트</a></li>"
						+ "								</ul>";
				} else {
					name = "							<ul class='dropdown-menu'>"
						+ "									<li><a href='/member/viewMember?memberID="+this.memberID+"'>회원 일정 리스트</a></li>"
						+ "								</ul>";
				}
				
				// 회원 사진이 없는 경우 기본 이미지 설정
				if(this.memberPictureName == null){
					profile = "<img src='/resources/images/user-avatar.jpg' class='circleimg' alt=''/>";
				}
				
				
				var d = new Date(this.updatedDate);
				var dformat = [d.getFullYear(),(d.getMonth() + 1).padLeft(), ].join('/')+ ' '+ [d.getHours().padLeft(),d.getMinutes().padLeft(),d.getSeconds().padLeft() ].join(':');
				
				str += "<div class='col-md-4 offset-0 center' data-contentsReviewID='"+this.contentsReviewID+"'>"
					+ "		<div class='padding20'>"
					+ "			<div class='bordertype5'>"
					+ "				<div class='circlewrap'>"
					+ profile
					+ "<span>"+this.contentsReviewRating + "</span>"
					+ "				</div>"
					+ "				<span class='dark'>"
//					+ "				<span class='member_name'>"
					+ "				<ul id='writer' style='list-style:none;'>"
					+ "					<li class='dropdown'>"
					+ "						<a data-toggle='dropdown' class='dropdown-toggle' href='#'>"
					+ this.memberName+name
					+ "							 <b class='lightcaret mt-2'></b>"
					+ "						</a>"
					+ "					</li>"
					+ "				</ul>"
//					+ "				</span>"
					+ "			</div>"
					+ "		</div>"
					+ "	</div>"
					+ "	<div class='col-md-8 offset-0'>"
					+ "		<div class='padding20'>"
					+ "			<span class='opensans size16 dark' contentsReviewID='"+this.contentsReviewID+"'>"
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
					+ "	</div>";
					
				str = str + tmp + "		<div class='clearfix'></div>"
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
	getReviewList(reviewPage);
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
	//	getReviewList(reviewPage, memberID, contentsID);
	}
	
	// 리뷰 페이지 숫자 버튼 눌렀을때
	$("#reviewPaging").on("click", "a",function(event) {
		event.preventDefault();
		var tmp = $(this).attr("href");
		alert(tmp);
		getReviewList(tmp);
	});
	// 컨텐츠 리스트 페이지 가기
	$("#getList").on("click",function() {
		self.location = "/contents/contentsList/"+ categoryID + "/"+ listPage;
	});
	
	// 리뷰 등록
	$("#writeReview").on("click",function() {
		
		var contentsReviewTitle = $("#reviewTitle").val();
		var contentsReview = $("#reviewDetail").val();
		
		if(memberID == "") {
			alert("로그인이 필요한 서비스입니다.");
			
		}else if(contentsReviewTitle == ""){
			alert("제목을 입력해 주세요");
			
		}else if(contentsReview == ""){
			alert("내용을 입력해 주세요");
		}else if(contentsReviewRating == 0){
			alert("평점을 입력해 주세요")
		}else{
			
			var formData = new FormData();
			var file = $("input[name=upload]")[0].files;
			// 가져온 파일을 저장
			var files = file[0];
			
			formData.append("file",files);
			
			// 파일 이름 생성 및 이미지생성 ajax
			$.ajax({
				url : "/uploadAjaxReview",
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				async: false,
				type : 'post',
				// 데이터를 보낸 후 
				success : function(data) {
					
					var str = "";
					getFileNames(data);
					
				}
			});
			
			// 리뷰 등록 ajax
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
				success : function(data) {
					// 리뷰 등록후 처음 1 페이지로 이동
					getReviewList(1);
				}
			});
			// 등록 후 리뷰 텍스트 내용 초기화
			$("#reviewTitle").val("리뷰 제목을 입력해주세요");
			$("#reviewDetail").val("");
			
		}
		
	});
	
	// 리뷰 수정
	$('#reviewList').on('click','.modify',function() {
		// 리뷰 아이디
		
		var contentsReviewID = $(this).attr('id');
		var modifyTitle = $("span[contentsreviewid="+contentsReviewID+"]").text();
		var modifyContents = $("p[data-contentsreviewid="+contentsReviewID+"]").text();
		if (this.value == 1) {
			// 수정 텍스트 출력
			$(this).attr('value', 0);
			// 제목
			var str1 = "<textarea id='textarea1' cols='20' rows='1' >"+modifyTitle+"</textarea>";
			$("span[contentsReviewID="+contentsReviewID+"]").html(str1);
			// 내용 수정
			var str2 = "<textarea id='textarea2' cols=" + 30 + "rows=" + 10 + ">"+modifyContents+"</textarea>";
			$('.'+ contentsReviewID).html(str2);
			
		} else {
			// 수정 내용 저장
			var titleModify = $('#textarea1').val();
			var modify = $('#textarea2').val();
			if(titleModify == ""){
				alert("제목을 입력해주세요");
			}else if(modify == ""){
				alert("내용을 입력해주세요");
			}else{
				$(this).attr('value', 1);
				alert("리뷰 수정");
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
						contentsReview : modify,
						contentsReviewTitle : titleModify
					}),
					success : function(result) {
							// 리뷰 등록후 처음 1 페이지로 이동
							getReviewList(1);;
					}
				});
			}
			
		}
	})
	
	// 리뷰 삭제
	$('#reviewList').on('click','.delete',function() {
		
		// 리뷰 아이디
		var contentsReviewID = $(this).attr('id');
		$.ajax({
			type : 'delete',
			url : '/contents/contentsDetail/'+ contentsID+ '/'+ contentsReviewID,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE",
			},
			dataType : 'text',
			success : function(result) {
				alert("삭제되었습니다");
				// 리뷰 등록후 처음 1 페이지로 이동
				getReviewList(1);;
			}
		});
	})
	
	// 업로드 버튼을 누른경우 css 적용
	$('#uploadBtn').on('click', function() {
		if(memberID == ""){
			alert("로그인 후 이용해 주세요");
			return ;
		}
		$('.uploadList').css({
			'width' : '100%',
			'height' : '200px',
			'border' : '1px dotted blue',
			'overflow' : 'scroll'
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
						// 썸네일 생성
						+ "<img src='/displayFile?fileName="
						+ fileList[i]
						+ "&directory=review' style='width:320px;'/>"
						+ "</li>";
			} else {
				// 이미지 파일이 아닐경우 다운로드
				str = str
						+ "<li><a href='/displayFile?fileName="
						+ fileList[i]
						+ "&directory=review'>"
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
//구글 맵 호출
function initialize() {
	var Lat = '${vo.lat}';
	var Lng = '${vo.lng}';
	var latM = Math.round(Lat * 1000000) / 1000000;
	var lngM = Math.round(Lng * 1000000) / 1000000;
	
	var title = '${vo.title}';
	  // Create an array of styles.
	var styles = [
		{
			featureType: 'road.highway',
			elementType: 'all',
			stylers: [
				{ hue: '#e5e5e5' },
				{ saturation: -100 },
				{ lightness: 72 },
				{ visibility: 'simplified' }
			]
		},{
			featureType: 'water',
			elementType: 'all',
			stylers: [
				{ hue: '#30a5dc' },
				{ saturation: 47 },
				{ lightness: -31 },
				{ visibility: 'simplified' }
			]
		},{
			featureType: 'road',
			elementType: 'all',
			stylers: [
				{ hue: '#cccccc' },
				{ saturation: -100 },
				{ lightness: 44 },
				{ visibility: 'on' }
			]
		},{
			featureType: 'landscape',
			elementType: 'all',
			stylers: [
				{ hue: '#ffffff' },
				{ saturation: -100 },
				{ lightness: 100 },
				{ visibility: 'on' }
			]
		},{
			featureType: 'poi.park',
			elementType: 'all',
			stylers: [
				{ hue: '#d2df9f' },
				{ saturation: 12 },
				{ lightness: -4 },
				{ visibility: 'on' }
			]
		},{
			featureType: 'road.arterial',
			elementType: 'all',
			stylers: [
				{ hue: '#e5e5e5' },
				{ saturation: -100 },
				{ lightness: 56 },
				{ visibility: 'on' }
			]
		},{
			featureType: 'administrative.locality',
			elementType: 'all',
			stylers: [
				{ hue: '#000000' },
				{ saturation: 0 },
				{ lightness: 0 },
				{ visibility: 'on' }
			]
		}
	];
	
	var myLatlng = new google.maps.LatLng(latM, lngM);
	// Create a new StyledMapType object, passing it the array of styles,
	// as well as the name to be displayed on the map type control.
	var styledMap = new google.maps.StyledMapType(styles,
		{name: "Styled Map"});
	
	
	// Create a map object, and include the MapTypeId to add
	// to the map type control.
	var mapOptions = {
		zoom: 15,
		center: myLatlng,
		mapTypeControlOptions: {
		  mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
		}
	};
	
	var map = new google.maps.Map(document.getElementById('map-canvas'),
		mapOptions);
		
	var marker = new google.maps.Marker({
		  position: myLatlng,
		  map: map,
		  title: title
	});
	
	
	//Associate the styled map with the MapTypeId and set it to display.
	map.mapTypes.set('map_style', styledMap);
	map.setMapTypeId('map_style');
	};
</script>

			<!-- Javascript -->	
			<script src="/resources/assets/js/js-details.js"></script>
			
			<!-- Googlemap -->	
			<script src="/resources/assets/js/initialize-google-mapHD.js"></script>

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