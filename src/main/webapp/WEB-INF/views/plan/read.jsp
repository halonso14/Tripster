<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>
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
    		
/*     		 $.each(${plan.planDetailVO }, function(index, item){
    			 var result="";
    			 result += index +': ' + item.planDetailID +','+ item.title;
    			 console.log(result);
    		 }); */
    		 
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
</style>
</head>
<body>
	<h2>planDetail</h2>
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="planID" value="${plan.planID }">
		${plan.planID }
		<%-- ${plan.planDetailVO.get(0).planDetailEndTime} --%>
		<c:forEach items ="${plan.planDetailVO }" var="planDetailVO">
			${planDetailVO.title }
			<hr>
			<div class="uploadedList">
			
			</div>
		</c:forEach>
		
		<hr>
		
		
		<button id="remove">REMOVE</button>
		<button id="modify">MODIFY</button>
	</form>
	
	<hr>
	
	<!-- 댓글 -->
	<div>
		<div>
			<input type="hidden" name="memberID" value=1 id="newReplyWriter">
		</div>
		<div>
			Reply Text : <input type="text" name="planReplyContents" id="newReplyText">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	<ul id="replies">
		
	</ul>
	
	<ul class="pagination">
	</ul>
	
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
	
	<script id="templateAttach" type="text/x-handlebars-template">
	<li data-src='{{fullName}}'>
	  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
	  <div class="mailbox-attachment-info">
	   <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	   </span>
	  </div>
	</li>                
	</script>
	
	<script>
		var template = Handlebars.compile($("#templateAttach").html());
		$(plan.memoVO.memoPictureName).each(function(){
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);
			$(".uploadedList").append(html);
		});
	</script>
</body>
<script>
	var planID = ${plan.planID};
	getPageList(1);
	
	function getPageList(page){
		$.getJSON("/plan/reply/read/"+planID+"/"+page, function(data){
			console.log(data.reply.length);
			
			var str ='';
			
			$(data.reply).each(function(){
				str+= "<li data-rno='"+this.planReplyID+"' class='replyLi'>"
				+ this.planReplyID+":"+this.planReplyContents+"<button>MOD</button></li>";
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
					alert("등록 되었습니다.");
					getPageList(replyPage);
				}
			}
		});
	});
	
	
	//mod버튼 클릭 시,
	$("#replies").on("click", ".replyLi button", function(){
		var reply = $(this).parent();
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