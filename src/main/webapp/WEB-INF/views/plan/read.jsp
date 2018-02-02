<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "Sat, 01 Jan 1970 22:00:00 GMT");
response.setHeader("Pragma", "no-cache");
%>
<c:set var="session" value='<%= session.getAttribute("login")%>'/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Plan Detail</title>
   <script type="text/javascript" src="/resources/js/upload.js"></script>

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
	/* padding: 3px; */
	/* border: 1px solid blue; */
	 /* margin-top: 10px;  */
}
.pagination li a {
	/* margin: 3px; */
	text-decoration: none;
}
.aboutarrow {
    display: block;
    float: left;
    position: relative;
   /*  left: 50%; */
    bottom: -20px;
    width: 25px;
    height: 13px;
    background: url(/resources/images/about-arrow.png) no-repeat;
}
.memoText{
    display: block;
    width: 100%;
    margin-bottom: 8px;
    border-left: 1px solid #eee;
    border-bottom: 1px solid #eee;
    padding-left: 8px;
    padding-right: 8px;
    line-height: 22px;
}
.member_name{
	float: right;
}
#eventWrapper{
	 border-left: 1px solid #ccc;
}
.dayCircle {
    width: 12px;
    height: 12px;
    position: absolute;
    left: -6px;
   /*  top: 9px; */
    border: 1px solid #ccc;
    border-radius: 6px;
    background: #fff;
}
.whichDay {
    font-size: 16px;
    padding: 7px 16px;
    color: #fff;
    background: #ff9900;
    margin-left: 10px;
}
#replyDelBtn{
    text-transform: uppercase;
    border: 1px solid #d75124;
    padding: 0px 0px;
    background: #e35121;
    background: -webkit-gradient(linear, left top, left bottom, from(#ff6633), to(#e35121));
    background: -webkit-linear-gradient(top, #ff6633, #e35121);
    background: -moz-linear-gradient(top, #ff6633, #e35121);
    background: -ms-linear-gradient(top, #ff6633, #e35121);
    background: -o-linear-gradient(top, #ff6633, #e35121);
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-shadow: rgba(0,0,0,0.18) 0 1px 0;
    -moz-box-shadow: rgba(0,0,0,0.18) 0 1px 0;
    box-shadow: rgba(0,0,0,0.18) 0 1px 0;
    text-shadow: rgba(0,0,0,.4) 0 -1px 0;
    color: #ffffff;
    font-size: 2px;
    font-family: Helvetica, Arial, Sans-Serif;
    text-decoration: none;
    vertical-align: middle;
    font-family: "Open Sans";
    font-weight: 700;
    -webkit-transition: .3s;
    -moz-transition: .3s;
    transition: .3s;
    width: 55px;
    height: 20px;
}
.planModifyBtn{
	text-transform: uppercase;
    border: 1px solid #006699;
    padding: 0px 0px;
    background: #3994d4;
    background: -webkit-gradient(linear, left top, left bottom, from(#3994d4), to(#1d7db7));
    background: -webkit-linear-gradient(top, #3994d4, #1d7db7);
    background: -moz-linear-gradient(top, #3994d4, #1d7db7);
    background: -ms-linear-gradient(top, #3994d4, #1d7db7);
    background: -o-linear-gradient(top, #3994d4, #1d7db7);
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-shadow: rgba(0,0,0,0.18) 0 1px 0;
    -moz-box-shadow: rgba(0,0,0,0.18) 0 1px 0;
    box-shadow: rgba(0,0,0,0.18) 0 1px 0;
    text-shadow: rgba(0,0,0,.4) 0 -1px 0;
    color: #ffffff;
    font-size: 2px;
    font-family: Helvetica, Arial, Sans-Serif;
    text-decoration: none;
    vertical-align: middle;
    font-family: "Open Sans";
    font-weight: 700;
    -webkit-transition: .3s;
    -moz-transition: .3s;
    transition: .3s;
    width: 55px;
    height: 20px;
}
.plan_pre {
  display: block; 
  margin: 0 0 0px; 
  font-size: 13px; 
  color: #333333; 
  word-break: break-all; 
  word-wrap: break-word; 
  background-color: #ffffff; 
  border: 1px solid #ffffff;
  border-radius: 4px; 
  padding: 0px;
}
.foo{
    text-align: left;
    float: none;
    position: absolute;
    top: 0px;
    right: auto;
    bottom: auto;
    left: auto;
    margin: 0px;
    width: 3992px;
    height: 407px;
    z-index: auto;
}
 .list_carousel2 > .foo5> img {
      top: 0;
      left: 0;
      max-height: 407px;
      max-width: 720px;
    } 
</style>
	
</head>
    <!-- ymum my css-->
    <link rel = "stylesheet" type = "text/css" href ="/resources/css/statistics.css">
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- ymum my css-->
    
    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
	<link href="/resources/updates/update1/css/search.css" rel="stylesheet" media="screen">
	<link href="/resources/updates/update1/css/style02.css" rel="stylesheet" media="screen">   
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
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

<!-- bootstrap -->
	<script src="/resources/dist/js/bootstrap.min.js"></script>
	
	<%@include file="/WEB-INF/views/include/header2.jsp"%>
	<%@include file="/WEB-INF/views/plan/updateModal.jsp" %>
	<div class="container breadcrub">
		<a class="homebtn left" href="/"></a>
			<div class="left offset-2">
				
				<p style="color: black;font-weight:bold;">일정 상세</p>		
				
			</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>	
	<!-- CONTENT -->
	<div class="container" >
		<div class="container mt25 offset-0">
			
			
			<!-- CONTENT -->
			<div class="col-md-12 pagecontainer2 offset-0" >
				<div class="hpadding50c">
					<div>
						<div class="lato size30 slim">
						${plan.planTitle}
						<!-- 좋아요 -->
							<c:choose>
								<c:when test='${likeChk ne 1 }'>
									<span style=" float: right; margin-right: 40px"><a id="likeBtn" class="fav-icon-black like" href="javascript:void(0)" onclick="likeClick('${session.memberID}',$(this));"  value= ${plan.planID  } likeBtnCheck='0' style="top:30px;"></a></span>
								</c:when>
								<c:otherwise>
									<span style=" float: right; margin-right: 40px"><a id="likeBtn" class="fav-icon-black fav-icon-red like" href="javascript:void(0)" onclick="likeClick('${session.memberID}',$(this));" value= ${plan.planID } likeBtnCheck='1' style="top:30px;"></a></span>
								</c:otherwise>
							</c:choose>
						</div>
					
						
						
					</div>
					<div class="lato size15 grey bold">
						<fmt:formatDate var="parseStartDate" value="${plan.planStartDate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="parseEndDate" value="${plan.planEndDate }" pattern="yyyy-MM-dd"/>
						
						<span class="lato size15 grey bold">전체일정 : ${parseStartDate} ~ ${parseEndDate }</span>
						<span class="member_name">
							<ul id="writer" style="list-style:none;">
								<li class="dropdown">
									작성자 :
									<a data-toggle="dropdown" class="dropdown-toggle" href="#">
										 ${memberName }<b class="lightcaret mt-2"></b>
									</a>
									<!-- 일정 리스트 페이지 링크. -->
									<c:choose>
										<c:when test="${session.memberID eq plan.memberID }">
											<ul class="dropdown-menu">
												<li><a href="/member/mypage?planTab=active">나의 일정 리스트</a></li>
											</ul>
										</c:when>
										<c:otherwise>
											<ul class="dropdown-menu">
												<li><a href="/member/viewMember?memberID=${plan.memberID }">회원 일정 리스트</a></li>
											</ul>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</span>
					</div>
					<p class="aboutarrow"></p>
				</div>
				<div class="line3"></div>
				
				<div class="hpadding50c">
					
			

					<!-- LEFT IMG -->
					<div class="col-md-12 cpdd01 grey2" style="padding-left: 0px">
						
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
									duration: 300,
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
						
						<form role="form" id="planForm" action="" method="POST">
							<input type="hidden" name="planID" value="${plan.planID }">

							<c:set var = "date" value=""/>
							<div id="eventWrapper" style="border-left: 1px solid #ccc;padding-left: 20px">
								<!-- Day 계산 -->
								<!-- 
									 fmt:parseDate : String 형을 받아서 하는 format으로 자료형을 Date 형태로 변경 시켜 준다.
									 fmt:formatDate : Date 형을 받아서 원하는 format으로 날짜 형태를 변경시켜 준다.
									 planStartDate는 Date형 -> yyyy-mm-dd로 format -> Date형으로 다시 파싱.->일자를 초단위로 파싱.
								-->
								<fmt:formatDate var="startPlanDate" value="${plan.planStartDate }" pattern="yyyy-MM-dd"/>
								<fmt:parseDate var="parseStartDate" value="${startPlanDate }" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${parseStartDate.time / (1000*60*60*24)}" integerOnly="true" var="startDate"></fmt:parseNumber>
	
								
								<c:forEach items="${plan.planDetailVO }" var="planDetailVO">
									<!-- planDetailDate는 String형 -> yyyy-mm-dd로 Date 형태로 변경.-> 일자를 초단위로 파싱. -->
									<fmt:parseDate var="nowPlanDate" value="${planDetailVO.planDetailDate }" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${nowPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
						
									<c:if test="${planDetailVO.planDetailDate ne date}">
										<!-- 현재 Detial Date에서 전체 일정 시작 날짜를 빼서 Day 구해줌.  -->
										</br>
										<div class="dayCircle"></div><span class="whichDay">Day ${nowDate-startDate+1 }</span>&nbsp&nbsp<span class="lato size22 dark bold">${planDetailVO.planDetailDate }</span><br/>
										<c:set var = "date" value="${planDetailVO.planDetailDate }"/>
										<div class="line4"></div>
									</c:if>
									<c:set var = "detailStart" value = "${ planDetailVO.planDetailStartTime}"/>
									<!-- 시:분 까지만 뿌려주기 위해서 초단위 부분은 잘라줌.  -->
									<c:set var = "formatDetailStart" value = "${fn:substring(detailStart, 0, 5)}" />
									<div class="dayCircle"></div><span class="lato size18 dark bold">${formatDetailStart}&nbsp</span>
									<span class="lato size18 blue bold"> 
									<!-- 만약 contentsID가 존재하면, detail title부분에 contents상세 페이지 링크 연결.  -->
										<c:choose>
											<c:when test="${planDetailVO.contentsID eq 0 }">
												${planDetailVO.title }
											</c:when>
											<c:otherwise>
												<a href="/contents/${planDetailVO.categoryID }/${planDetailVO.contentsID}" class="bold">${planDetailVO.title }</a>
											</c:otherwise>
										</c:choose>
									</span><br/>
							
									<c:if test="${planDetailVO.memoVO.memoContents ne null }">
										<div class="memoText">
											<pre class="plan_pre">${planDetailVO.memoVO.memoContents }</pre>
										</div>
									</c:if>
							
									<!-- 사진 있을 경우에만 사진 띄워줌. -->
									<c:if test="${not empty planDetailVO.memoVO.memoPictureVO.get(0).memoPictureName }">
										<div class="wrapper2">
											<div class="list_carousel2">
												<ul class="foo5">
													<c:forEach items="${planDetailVO.memoVO.memoPictureVO }" var="pictureVO">
														<c:set var="image" value=""/>
					           					 		<li style="text-align: center;">
						           					 		<div style="width:100%;margin:0 auto;text-align: center; display:block;">
																<img src="/displayFile?fileName=${pictureVO.memoPictureName }&directory=plan"
																		 style="max-height: 407px;max-width: 950px;width:auto; height: 407px" />
															</div>
														</li>
													</c:forEach>
												</ul>
											<div class="clearfix"></div>
											<a id="prev_btn" class="xprev"><img src="/resources/images/spacer.png" alt=""/></a>
											<a id="next_btn" class="xnext" ><img src="/resources/images/spacer.png" alt=""/></a>
										</div>
									</div>
									<div class="line4"></div>
								</c:if>
								<!-- <div class="line4"></div> -->
							</c:forEach> 
						</div>
						</br></br>
						<c:set var="planWriter" value="${plan.memberID }"/>
						<c:if test="${session.memberID == planWriter}">
							<button class="btn-search4 margtop20" id="remove" style="width: 180px; font-size: 14px;">REMOVE</button>
							<!-- <input type="button" class="btn-search4 margtop20" id="remove" style="width: 180px; font-size: 14px;" onclick="removePlan();" value="REMOVE"/> -->
							<input type="button" class="bluebtn margtop20" id="modify" style="width: 180px;" onclick="updateModal();" value="MODIFY"/>
							<!-- <button class="bluebtn margtop20" id="modify" style="width: 180px;" onclick="updateModal();">MODIFY</button> -->
							<div class="line4"></div>
						</c:if>
					</form>
					
				
				<!-- 댓글 -->
					<div>
						<div id="count"></div>
						
						<div class="line4"></div>
						<!-- <input type="hidden" name="memberID" value=1 id="newReplyWriter"> -->
						<textarea class="form-control" rows="3" name="planReplyContents" id="newReplyText" onmousedown="replyTextMouseDown();"></textarea>
						<span class="errorMessage" style="color: red; font-weight: bold;"></span><br/>
						<button onclick="errorMessage()" type="submit" class="btn-search5" id="replyAddBtn">Post <span class="glyphicon glyphicon-arrow-down"></span></button>
						<br/><br/><br/>
					</div>
						
						<!-- <div id="count"> 
						</div> -->
						<div id="replies">
						</div>
						<div class="clearfix"></div>
						<!-- <div class="line4"></div> -->
						<span></span>
						<br>
						<br/>
						<ul class="pagination right paddingbtm20s">
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
	
<!-- Javascript  -->
	<script src="/resources/assets/js/js-blog.js"></script>
	
	<!-- Easy Pie Chart  -->
	<script src="/resources/assets/js/jquery.easy-pie-chart.js"></script>
	
    <!-- Nicescroll  -->	
	<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>
	
    <!-- Custom functions -->
    <script src="/resources/assets/js/functions.js"></script>
    <script src="/resources/js/like.js"></script>
	
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/js/lightbox.js'></script>	
	
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/assets/js/jquery.customSelect.js'></script>
	
	<!-- Load Animo -->
	<script src="/resources/plugins/animo/animo.js"></script>

    <!-- CarouFredSel -->
    <script src="/resources/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
    <script src="/resources/assets/js/helper-plugins/jquery.touchSwipe.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.transit.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
	
    <!-- JUI -->	
	<script src="/resources/assets/js/jquery-ui.js"></script>	

    <!-- Picker -->	
    <script src="/resources/assets/js/jquery.easing.js"></script>	
	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- <script src="/resources/dist/js/bootstrap.min.js"></script> -->
    
    
<script>
 $(document).ready(function() {
	var formObj = $("#planForm");
	  
 	$("#remove").click(function(){
 		formObj.attr("action","/plan/delete");
 		formObj.submit();
 	});
		 
  });
</script>

<script>
	var planID = ${plan.planID};
	var id='';
	getPageList(1);
	
	//날짜 형태를 02-01와 같은 형태를 위한 함수.
	Number.prototype.padLeft = function(base,chr){
	    var  len = (String(base || 10).length - String(this).length)+1;
	    return len > 0? new Array(len).join(chr || '0')+this : this;
	}
	// usage
	//=> 3..padLeft() => '03'
	//=> 3..padLeft(100,'-') => '--3' 
	
	function getPageList(page){
		$.getJSON("/plan/reply/read/"+planID+"/"+page, function(data){
			
			var str ='';
			var countstr ='';
			var id='';
			
			//session의 memberID값 memberID변수에 할당.
			<c:set value="${session.memberID}" var = "memberID"/>
			
			//session값 체크.(session이 있으면 id라는 변수에 해당 session의 memberID값 할당. 아니면 ''값 할당.)
			<c:choose>
				<c:when test="${empty session}">
					id='';
				</c:when>
				<c:otherwise>
					id=${memberID};
				</c:otherwise>
			</c:choose>
			
			//댓글 출력.
			$(data.reply).each(function(){
				//댓글 작성 시간을 '2017/12/28 15:55:55'와 같은 형태로 파싱.
				var d =new Date( this.planReplyTime),dformat = [d.getFullYear(), (d.getMonth()+1).padLeft(),
		               d.getDate().padLeft()
		               ].join('/') +' ' +
		              [d.getHours().padLeft(),
		               d.getMinutes().padLeft(),
		               d.getSeconds().padLeft()].join(':');
				
				
				str+= "<br><div class='wh20percent left textleft'><div class='circlewrap2'>";
				
				// 멤버프로필 사진 출력부분.
				if(this.memberPicture == null){
					str+="<img alt='' class='circleimg' src='/resources/images/user-avatar.jpg'>";
				}else{
					str+="<img alt='' class='circleimg' src='/displayFile?fileName="+this.memberPicture+"&directory=profile' style='height : 53px; width: 53px;'>";
				}
				
				str+='</div></div><div class="wh80percent right "><span class="lblue bold"><a href="/member/viewMember?memberID='+this.memberID+'">'
				+this.memberName
				+'</a></span>&nbsp&nbsp<span class="grey size12">'
				+dformat
				+'</span><br/>'
				+'<span class="replyspan" data-rno="'
				+this.planReplyID+'">'
				+"<span class='replyContents'><pre class='plan_pre'>"
				+this.planReplyContents+"</pre></span>";
				
				//session이 존재하면,	
 				if('' != id){
 					//session의 id와 댓글 작성자 id와 비교.
					 if(id == this.memberID){
						 //같으면 modify버튼 보여줌.
						str+='</br><span class="grey size12"><input type="button" class="btn-search4 planReplyBtn" id="replyDelBtn" value="Remove" onclick="replyRemove($(this))">&nbsp</span><span class="grey size12"><input type="button" input type="button" class="planModifyBtn"  value="Modify" onclick="modifyForm($(this))"></span>'
					} 
				}
				str+='</span></div><div class="clearfix"></div><div class="line4">';
			});
			
			//해당 read페이지에 달린 총 댓글 수 보여줌.
			
			countstr='<span class="size14 dark bold">Comment <span class="glyphicon glyphicon-comment"></span> ( '
					+data.replyCount+' )</span></div>';
			
			$("#count").html(countstr);
			$("#replies").html(str);
			printPaging(data.pageMaker);
		});
	}
	
	//page 뿌려주는 함수.
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
	
	//댓글 입력했는지 여부 확인
	function errorMessage(){
		var text = $("#newReplyText").val();
		var str =''
			
		//session확인.
		<c:choose>
			<c:when test="${empty session}">
				id='';
			</c:when>
			<c:otherwise>
				id=${memberID};
			</c:otherwise>
		</c:choose>
	
		//session이 존재하면 	
		if('' != id){
			//글 입력 확인.
			 if(text == ''){
				 //빈값이면 에러메세지 출력.
				str = '<span>글을 입력해주세요</span>';
				$(".errorMessage").html(str);
			}else{
				//댓글등록 함수 호출.
				addReply();
			} 
		}else{
			//session이 존재하지 않으면.
			alert('로그인 후 이용해주세요.');
		}
	}
	
	function replyTextMouseDown() {
	    $(".errorMessage").empty();
	}
	//댓글 등록.
	function addReply(){
		var replytext = $("#newReplyText").val();
		$.ajax({
			type:'post',
			url:'/plan/reply/register',
			contentType : "application/json",
			dataType : 'text',
			data : JSON.stringify({
				planID : planID,
				planReplyContents : replytext
			}),
			success : function(result) {
				if (result == 'SUCCESS') {
					$("#newReplyText").val('');
					$(".errorMessage").empty();
					alert("등록 되었습니다.");
					getPageList(replyPage);
				}
			}
		});
	}
	
	//mod버튼 클릭 시,
	function modifyForm(event){
		var reply = event.parent().parent();
		var rno = reply.attr("data-rno");
		var replytext = reply.text();
		
		reply.empty();
		str = "<div class='replyModDiv' ><textarea id='replytext' class='form-control' rows='3' col='20'>"
			+replytext
			+"</textarea></br><input type='button' class='planModifyBtn' id='replyModBtn' value='저장' onclick='replyModify()'></div>"
		reply.append(str); 
		$(".replyModDiv").attr("id", rno);
	}
	
	//삭제 호출		
	function replyRemove(event){
		var reply = event.parent().parent();
		var rno = reply.attr("data-rno");
		 $.ajax({
			type:'post',
			url:'/plan/reply/delete/'+rno,
			contentType : "application/json",
			dataType : 'text',
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPageList(replyPage);
				}
			}
		}); 
	}
	
	//수정 버튼 클릭.
	function replyModify() {
		var rno = $(".replyModDiv").attr("id");
		var replytext = $("#replytext").val();
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
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPageList(replyPage);
				}
			}
		});  
	};
	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>