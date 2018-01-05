<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Plan Detail</title>
   <script type="text/javascript" src="/resources/js/upload.js"></script>
   	<script src="https://code.jquery.com/jquery-2.0.3.js"></script>
<script>
 $(document).ready(function() {
	var formObj = $("form[role='form']")
	$("#modify").click(function(){
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
	/* border: 1px solid blue; */
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
</style>
	
</head>
	<%@include file="/WEB-INF/views/include/header2.jsp"%>

	<!-- CONTENT -->
	<div class="container">

		
		<div class="container mt25 offset-0">
			
			
			<!-- CONTENT -->
			<div class="col-md-12 pagecontainer2 offset-0">
				<div class="hpadding50c">
					<div>
						<div class="lato size30 slim">${plan.planTitle}</div>
					
						<!-- <a href="#" class="blogpost-hover" style="float: right"><span class="glyphicon glyphicon-heart"></span></a> -->
						
					</div>
					<div class="lato size15 grey bold">
						
						<fmt:formatDate var="parseStartDate" value="${plan.planStartDate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="parseEndDate" value="${plan.planEndDate }" pattern="yyyy-MM-dd"/>
						
						<span class="lato size15 grey bold">전체일정 : ${parseStartDate} ~ ${parseEndDate }</span>
						<span class="member_name">작성자 : ${memberName }</span>
					</div>
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
									<div class="dayCircle"></div><span class="whichDay">Day ${nowDate-startDate+1 }</span>&nbsp&nbsp<span class="lato size22 dark bold" ">${planDetailVO.planDetailDate }</span><br/>
									<c:set var = "date" value="${planDetailVO.planDetailDate }"/>
									<div class="line4"></div>
								</c:if>
								<c:set var = "detailStart" value = "${ planDetailVO.planDetailStartTime}"/>
								<!-- 시:분 까지만 뿌려주기 위해서 초단위 부분은 잘라줌.  -->
								<c:set var = "formatDetailStart" value = "${fn:substring(detailStart, 0, 5)}" />
								<div class="dayCircle"></div><span class="lato size18 dark bold">${formatDetailStart}&nbsp</span>
								<span class="lato size18 blue bold"> ${planDetailVO.title }</span><br/>
						
								<c:if test="${planDetailVO.memoVO.memoContents ne null }">
									<div class="memoText">
										${planDetailVO.memoVO.memoContents }
									</div>
								</c:if>
						
								<div class="wrapper2">
									<div class="list_carousel2">
										
											<c:forEach items="${planDetailVO.memoVO.memoPictureVO }" var="pictureVO">
												<ul class="foo5">
													<c:set var="image" value=""/>
													<c:choose>
						       							<c:when test="${pictureVO.memoPictureName ne null}">
						           					 		<li>
																<a href="/displayFile?fileName=${pictureVO.memoPictureName }"><img  class="img-responsive" src="/displayFile?fileName=${pictureVO.memoPictureName }" style="width: 100%; max-width: 760px; vertical-align: middle"/></a>
															</li>
						       							</c:when>
						       							<c:otherwise>
						          							<li>
																<a href="/resources/planImg/noimg.png"><img src="/resources/planImg/noimg.png" style="width: 100%; vertical-align: middle"/></a>
															</li>
						       							</c:otherwise>
						  							</c:choose> 	
					  							</ul>
										</c:forEach>
									
									<div class="clearfix"></div>
									<a id="prev_btn" class="xprev" href=""><img src="/resources/images/spacer.png" alt=""/></a>
									<a id="next_btn" class="xnext" href=""><img src="/resources/images/spacer.png" alt=""/></a>
								</div>
							</div>
							<!-- <div class="line4"></div> -->
						</c:forEach> 
						</div>
						</br></br>
						<c:set var="session" value='<%= session.getAttribute("login")%>'/>
						<c:set var="planWriter" value="${plan.memberID }"/>
						<c:if test="${session.memberID == planWriter}">
							<button class="btn-search4 margtop20" id="remove" style="width: 180px; font-size: 14px;">REMOVE</button>
							<button class="bluebtn margtop20" id="modify" style="width: 180px;">MODIFY</button>
							<div class="line4"></div>
						</c:if>
					</form>
					
				
				<!-- 댓글 -->
					<div>
						<div id="count"></div>
						
						<div class="line4"></div>
						<!-- <input type="hidden" name="memberID" value=1 id="newReplyWriter"> -->
						<textarea class="form-control" rows="3" name="planReplyContents" id="newReplyText" ></textarea>
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
	
	<!-- CarouFredSel -->
	<script src="/resources/assets/js/jquery.carouFredSel-6.2.1-packed.js"></script>
    <script src="/resources/assets/js/helper-plugins/jquery.touchSwipe.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.transit.min.js"></script>
	<script type="text/javascript" src="/resources/assets/js/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
	
	    <!-- Picker -->	
    <script src="/resources/assets/js/jquery.easing.js"></script>	
    
    
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
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
			
			
			$(data.reply).each(function(){
				//댓글 작성 시간을 '2017/12/28 15:55:55'와 같은 형태로 파싱.
				var d =new Date( this.planReplyTime),dformat = [d.getFullYear(), (d.getMonth()+1).padLeft(),
		               d.getDate().padLeft()
		               ].join('/') +' ' +
		              [d.getHours().padLeft(),
		               d.getMinutes().padLeft(),
		               d.getSeconds().padLeft()].join(':');
				
			
				str+= "<br><div class='wh20percent left textleft'><div class='circlewrap2'><img alt='' class='circleimg' src='/resources/images/user-avatar.jpg'></div></div>"
				+'<div class="wh80percent right "><span class="lblue bold">'
				+this.memberName
				+'</span>&nbsp&nbsp<span class="grey size12">'
				+dformat
				+'</span><br/>'
				+'<span class="replyspan" data-rno="'
				+this.planReplyID+'">'
				+"<span class='replyContents'>"
				+this.planReplyContents+"</span>";
				
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
</html>