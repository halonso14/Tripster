<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Travel Agency - HTML5 Booking template</title>
	
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
	
	<!-- PIECHART -->
	<link rel="stylesheet" type="text/css" href="/resources/assets/css/jquery.easy-pie-chart.css">	
	
	<!-- Animo css-->
	<link href="/resources/plugins/animo/animate+animo.css" rel="stylesheet" media="screen">

    <!-- Picker -->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />	
	
    <!-- jQuery -->		
    <script src="/resources/assets/js/jquery.v2.0.3.js"></script>
    <script type="text/javascript" src="/resources/js/upload.js"></script>
<script>
 $(document).ready(function() {
	var formObj = $("form[role='form']")
	$("#modify").click(function(){
		alert('클릭했당 ');
		formObj.attr("action","/plan/update");
		formObj.attr("method","GET");
		formObj.submit();
	});

	 
 	$("#remove").click(function(){
 		formObj.attr("action","/plan/delete");
 		formObj.submit();
 	})
		 
  });
</script>
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

.pagination li {
	list-style: none;
	float: left;
	padding: 3px;
	border: 1px solid blue;
	margin: 3px;
}

.pagination li a {
	margin: 3px;
	text-decoration: none;
}

.aboutarrow {
    display: block;
    float: left;
    position: relative;
   /*  left: 50%; */
    bottom: -40px;
    width: 25px;
    height: 13px;
    background: url(/resources/images/about-arrow.png) no-repeat;
}
</style>
	
</head>

<body id="top" class="thebg" >
		<div class="navbar-wrapper2 navbar-fixed-top">
      <div class="container">
		<div class="navbar mtnav">

			<div class="container offset-3">
			  <!-- Navigation-->
			  <div class="navbar-header">
				<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a href="index.html" class="navbar-brand"><img src="/resources/images/logo.png" alt="Travel Agency Logo" class="logo"/></a>
			  </div>
			  <div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
				  <li class="dropdown active">
					<a data-toggle="dropdown" class="dropdown-toggle" href="index.html">Home <span class="badge indent0">1</span><b class="lightcaret mt-2"></b></a>
					<ul class="dropdown-menu posright-0">
					  <li>
							<div class="row dropwidth01">
								<ul class="droplist col-md-4">
								  <li class="dropdown-header">Homepages</li>	
								  <li><a href="index.html">Home 1 minimal</a></li>
								  <li><a href="index2.html">Home 2 offers</a></li>
								  <li><a href="index3.html">Home 3 full search</a></li>
								  <li><a href="index4.html">Home 4 presentation</a></li>
								  <li><a href="index5.html">Home 5 footer2</a></li>
								  <li><a href="index6.html">Home 6 full</a></li>
								  <li><a href="index7.html">Home 7 </a></li>
								  <li><a href="z-new-homepage.html">New Homepage</a> <span class="green">new</span></li>									  
								</ul>
								<ul class="droplist col-md-4">
								  <li class="dropdown-header">Intro pages</li>
								  <li><a href="intro.html">Intro 1</a></li>
								  <li><a href="intro2.html">Intro 2 - slides</a> <span class="glyphicon glyphicon-star lblue"></span></li>
								  <li><a href="intro3.html">Intro 3 - slides2</a> <span class="glyphicon glyphicon-star lblue"></span></li>
								</ul>
								<ul class="droplist col-md-4">
								  <li class="dropdown-header">Colors</li>
								  <li><a href="../blue/index.html">Blue</a></li>
								  <li><a href="../green/index.html">Green</a></li>
								  <li><a href="../orange/index.html">Orange</a></li>
								  <li><a href="../cyan/index.html">Cyan</a></li>
								  <li></li>
								  <li class="inactive size10 lgrey caps"><span class="glyphicon glyphicon-star "></span> Popular pages</li>								  
								</ul>
							</div>
					  </li>
					</ul>
				  </li>
				  <li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">Pages <span class="badge indent0">14</span><b class="lightcaret mt-2"></b></a>
					<ul class="dropdown-menu posright-0">
					  <li>
							<div class="row dropwidth01">
								<ul class="droplist col-md-4">
								  <li class="dropdown-header">Inner pages</li>	
								  <li><a href="list.html">List page 1</a></li>
								  <li><a href="list2.html">List page 2</a></li>
								  <li><a href="list3.html">List page 3</a></li>
								  <li><a href="list4.html">List page 4</a></li>
								  <li><a href="details.html">Details page</a></li>
								  <li><a href="payment.html">Payment</a></li>
								  <li><a href="blog.html">Blog page</a></li>
								  <li><a href="blog-details.html">Blog details</a></li>	
								  <li><a href="about.html">About</a></li>								  
								  <li><a href="contact.html">Contact</a></li>
								  <li><a href="profile.html">User Profile</a>  <span class="glyphicon glyphicon-star lblue"></span></li>
								  <li><a href="login.html">Login</a></li>
								  <li><a href="dashboard/index.html">Dashboard</a>  <span class="glyphicon glyphicon-star lblue"></span></li>								  

						  
								</ul>	
								<ul class="droplist col-md-4">
								  <li class="dropdown-header">Update - <span class="green">14 New Pages</span></li>	
								  <li><a href="z-new-homepage.html">New Homepage</a>  <span class="glyphicon glyphicon-star lblue"></span></li>
								  <li><a href="z-flights-list.html">Flights list</a>  <span class="glyphicon glyphicon-star lblue"></span></li>
								  <li><a href="z-flights-payment.html">Flights payment</a></li>
								  <li><a href="z-cruise-list.html">Cruise list</a></li>
								  <li><a href="z-cruise-payment.html">Cruise payment</a></li>
								  <li><a href="z-rentacar-list.html">Rent a car list</a></li>
								  <li><a href="z-rentacar-details.html">Rent a car details</a></li>
								  <li><a href="z-rentacar-payment.html">Rent a car payment</a></li>
								  <li><a href="z-transfers-list.html">Transfers list</a></li>
								  <li><a href="z-transfers-payment.html">Transfers payment</a></li>
								  <li><a href="z-activities-list.html">Activities list</a></li>
								  <li><a href="z-activities-details.html">Activities details</a></li>
								  <li><a href="z-activities-payment.html">Activities payment</a></li>
								  <li><a href="z-wearesearching.html">Loading page</a></li>
								</ul>								
								<ul class="droplist col-md-4">
								  <li class="dropdown-header">Bootstrap Shortcodes</li>	
								  <li ><a href="http://getbootstrap.com/components/" target="_blank">Components</a></li>								  
								  <li ><a href="http://getbootstrap.com/javascript/" target="_blank">Javascript</a></li>								  
								  <li ><a href="http://getbootstrap.com/css/" target="_blank">Css</a></li>	
								  <li class="dropdown-header">Comming next</li>	
								  <li class="inactive"><a href="#">More Home pages</a></li>
								  <li class="inactive"><a href="#">Elements</a></li>
								  <li class="inactive"><a href="#">...</a></li>
								  <li></li>								  
								  <li class="inactive size10 lgrey caps"><span class="glyphicon glyphicon-star "></span> Popular pages</li>
								</ul>									
							</div>
					  </li>
					</ul>
				  </li>
				  <li><a href="#">Hotels</a></li>
				  <li><a href="#">Flights</a></li>
				  <li><a href="#">Vacations</a></li>
				  <li><a href="#">Cars</a></li>			  
				  <li><a href="#">Cruises</a></li>			  
				  <li><a href="#">Last minute</a></li>			  
				  <li><a href="#">Early booking</a></li>			  
				  <li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">Deals<b class="lightcaret mt-2"></b></a>
					<ul class="dropdown-menu">
					  <li class="dropdown-header">Aligned Right Dropdown</li>	
					  <li><a href="#">Sample Link 1</a></li>
					  <li><a href="#">Sample Link 2</a></li>
					</ul>
				  </li>		
				</ul>
			  </div>
			  <!-- /Navigation-->			  
			</div>
		
        </div>
      </div>
    </div>
    
    <div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="#"></a>
			<div class="left">
				<ul class="bcrumbs">
					<li>/</li>
					<li><a href="#" class="active">About us</a></li>					
				</ul>				
			</div>
			<a class="backbtn right" href="#"></a>
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>	
	
	<!-- CONTENT -->
	<div class="container">

		
		<div class="container mt25 offset-0">
			
			
			<!-- CONTENT -->
			<div class="col-md-12 pagecontainer2 offset-0">
				<div class="hpadding50c">
					<p class="lato size30 slim">${plan.planTitle}</p>
					<span class="lato size15 grey bold">${plan.planStartDate } ~ ${plan.planEndDate }</span>
					<p class="aboutarrow"></p>
				</div>
				<div class="line3"></div>
				
				<div class="hpadding50c">
					
			

					<!-- LEFT IMG -->
					<div class="col-md-12 cpdd01 grey2">
						
						<script>
						//------------------------------
						//CaroufredSell
						//------------------------------
						jQuery(document).ready(function(jQuery){

							jQuery("#foo5").carouFredSel({
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
									duration: 400,
									pauseOnHover: true
								},
								auto: true,
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
						<!-- Carousel -->
						<br/>
						<form role="form"  method="post">
							<input type="hidden" name="planID" value="${plan.planID }">

							<c:set var = "date" value=""/>
							<c:forEach items="${plan.planDetailVO }" var="planDetailVO">
								<c:if test="${planDetailVO.planDetailDate ne date}">
									<span class="lato size22 dark bold">${planDetailVO.planDetailDate }</span><br/>
									<c:set var = "date" value="${planDetailVO.planDetailDate }"/>
									<div class="line4"></div>
								</c:if>
								<span class="lato size18 dark bold">-${planDetailVO.planDetailStartTime}:</span>
								<span class="lato size18 blue bold"> ${planDetailVO.title }</span><br/>
						
								<c:if test="${planDetailVO.memoVO.memoContents ne null }">
									Memo Contents: ${planDetailVO.memoVO.memoContents }
								</c:if>
						
								<c:if test="${planDetailVO.memoVO.memoPictureVO ne null}">
									<div class="wrapper2">
										<div class="list_carousel2">
											<ul id="foo5">
												<c:forEach items="${planDetailVO.memoVO.memoPictureVO }" var="pictureVO">
													<c:choose>
						       							<c:when test="${pictureVO.memoPictureName ne null}">
						           					 		<li>
																<a href="/displayFile?fileName=${pictureVO.memoPictureName }"><img src="/displayFile?fileName=${pictureVO.memoPictureName }" style="width: 100%; max-width: 760px; vertical-align: middle"/></a>
															</li>
						       							</c:when>
						       							<c:otherwise>
						          							<li>
																<a href="/resources/planImg/noimg.png"><img src="/resources/planImg/noimg.png" style="width: 100%; vertical-align: middle"/></a>
															</li>
						       							</c:otherwise>
						  							</c:choose> 	
											</c:forEach>
										</ul>
										<div class="clearfix"></div>
										<a id="prev_btn" class="xprev" href="#"><img src="/resources/images/spacer.png" alt=""/></a>
										<a id="next_btn" class="xnext" href="#"><img src="/resources/images/spacer.png" alt=""/></a>
									</div>
								</div>
								<div class="line4"></div>
							</c:if>
							<br/><br/>
						</c:forEach> 
					
						<button class="btn-search4 margtop20" id="remove">REMOVE</button>
						<button class="bluebtn margtop20" id="modify">MODIFY</button>

					</form>
					<div class="line4"></div>
				
				<!-- 댓글 -->
					<div>
						<span class="size14 dark bold">Comments</span>
						<div class="line4"></div>
						<input type="hidden" name="memberID" value=1 id="newReplyWriter">
						<textarea class="form-control" rows="3" name="planReplyContents" id="newReplyText" ></textarea><br/>

						<button onclick="errorMessage()" type="submit" class="btn-search5" id="replyAddBtn">Post <span class="glyphicon glyphicon-arrow-down"></span></button>
						<br/><br/><br/>
					</div>
						
						<span class="size14 dark bold">3 comments</span>
						<div class="line4"></div>
						
						<div id="replies">

						</div>
						<div class="clearfix"></div>
						<div class="line4"></div>
						<ul class="pagination">
						</ul>
						<br/>
						<br/>
			
					<!-- END OF LEFT IMG -->

					<!-- END OF IMG RIGHT TEXT -->
					<div class="clearfix"></div>
					<br/><br/>

				</div>
				
			</div>
				
			<div class="clearfix"></div><br/><br/>
			</div>
			<!-- END CONTENT -->			
		</div>
	</div>
	<!-- END OF CONTENT -->
	
	<!-- 댓글 수졍 및 삭제 모달  -->
	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
	
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	var planID = ${plan.planID};
	getPageList(1);
	
	function getPageList(page){
		$.getJSON("/plan/reply/read/"+planID+"/"+page, function(data){
			console.log(data.reply.length);
			
			var str ='';
			
			$(data.reply).each(function(){
				str+= "<div class='wh20percent left textleft'><div class='circlewrap2'><img alt='' class='circleimg' src='/resources/images/user-avatar.jpg'></div></div>"
				+'<div class="wh80percent right "><span class="lblue bold">'+this.memberName+'</span><br/>'+
				'<span class="replyspan" data-rno="'+this.planReplyID+'">'+this.planReplyContents+'</br><span class="grey size12"><a href="#" class="grey">Modify</a></span></span></div><div class="clearfix"></div><div class="line4">'
			
			});
			
			$("#replies").html(str);
			printPaging(data.pageMaker);
		});
	}
	
	
	function printPaging(pageMaker) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.curPage == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}
		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		$('.pagination').html(str);
	}

	var replyPage = 1;
	

	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPageList(replyPage);
	});
	
	//댓글 추가
	$("#replyAddBtn").on("click", function(){
		var replyer = $("#newReplyWriter").attr("value");
		var replytext = $("#newReplyText").val();
		
		$.ajax({
			type:'post',
			url:'/plan/reply/register',
			contentType : "application/json",
			dataType : 'text',
			data : JSON.stringify({
				planID : planID,
				memberID : replyer,
				planReplyContents : replytext
			}),
			success : function(result) {
				if (result == 'SUCCESS') {
					$("#newReplyText").val('');
					alert("등록 되었습니다.");
					getPageList(replyPage);
				}
			}
		});
	});
	
	
	//mod버튼 클릭 시,
	$("#replies").on("click", ".replyspan a", function(){
		var reply = $(this).parent().parent();
		console.log(reply.get(0));
		var rno = reply.attr("data-rno");
		var replytext = reply.text();

		
 		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow"); 	
	});
	
	//삭제 호출		
	$("#replyDelBtn").on("click",function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'post',
			url:'/plan/reply/delete/'+rno,
			contentType : "application/json",
			dataType : 'text',
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					$("#modDiv").hide("slow");
					getPageList(replyPage);
				}
			}
		});
	});
	
	//수정 버튼 클릭.
	$("#replyModBtn").on("click", function() {
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		alert(rno);
		$.ajax({
			type : 'post',
			url : '/plan/reply/update',
			contentType : "application/json",
			dataType : 'text',
			data : JSON.stringify({
				planReplyID: rno,
				planReplyContents : replytext
			}),
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					$("#modDiv").hide("slow");
					getPageList(replyPage);
				}
			}
		}); 
	});
	
	//닫기 버튼 클릭 시,
	$("#closeBtn").on("click", function() {
		$("#modDiv").attr("style", "display: none;");
	});
</script>
</html>