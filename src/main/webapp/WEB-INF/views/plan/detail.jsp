<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/resources/updates/update1/css/style03.css" rel="stylesheet" media="screen">
<meta charset='utf-8' />
<link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href="/resources/updates/update1/css/style03.css" rel="stylesheet" media="screen">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--<link href='calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />-->
<style>
body {
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
}
#wrap {
	width: 1100px;
	margin: 0 auto;
}
#external-events {
	float: left;
	width: 300px;
	padding: 0 10px;
	border: 1px solid #ccc;

	background: #eee;
	text-align: left;
	overflow-y:scroll; 
 	overflow-x:hidden; 
	height:620px;
	/* display: block !important; */
	
}
#external-events h4 {
	font-size: 18px;
	margin-top: 0;
	padding-top: 1em;
	color:#ff6633;
}
#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
	height:65px;
	width:100%;
	max-width:300px;
	
}
#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}
#external-events p input {
	margin: 0;
	vertical-align: middle;
}
#calendar {
	float: right;
	width: 750px;
}
.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
 .modal {
    position: fixed;
    left: 50%;
    
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
}
.modal-body {
    display: inline-block;
    background-color: #FFF; 
}
        
       
</style>



</head>
    <!-- ymum my css-->
    <link rel = "stylesheet" type = "text/css" href ="/resources/css/statistics.css">
    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    <!-- ymmu bootstrap table -->
    <link href="/resources/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">

	<link href="/resources/updates/update1/css/search.css" rel="stylesheet" media="screen">
	<link href="/resources/updates/update1/css/style02.css" rel="stylesheet" media="screen">
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
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<div class="container breadcrub">
		<a class="homebtn left" href="/"></a>
			<div class="left offset-2">
				
				<p style="color: black;font-weight:bold;">여행 계획 세우기</p>		
				
			</div>
	<div class="clearfix"></div>
	<div class="brlines"></div>
</div>	
<script src='/resources/js/moment.min.js'></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src='/resources/js/fullcalendar.min.js'></script>
<script src="/resources/js/locale-all.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	
	
	<div id='wrap'>
		<div class="clearfix"></div>
		
		<!-- Scrap List 뿌려주는 곳.  -->
		<div id='external-events' style="overflow:scroll;height:620px;">
			<h4>Scrap List</h4>
			<div class="line4"></div>
			<div class="tab-pane active" id="tab-newtopic">
			<!--id : contentsID name:categoryID  -->
			</div>
		</div>

		<div id='calendar'></div>
		<div style='clear: both'></div>
	</div>
	
	<form action="/plan/read" type="get">
		<input type="hidden" name="planID" value=${planVO.planID }>
		<!-- <button class="ui positive right labeled icon button">SAVE</button> -->
		<button class="bluebtn margtop20" id="modify" style="width: 180px;float: right;margin-right: 21%;">SAVE</button>
	</form>
	
	
	<div class="container">
		<div class="modal fade" id="myModal" role="dialog" style="width: 800px;height:700px; margin-bottom: 50px;overflow-y:auto;overflow-x:hidden;">
		 
			 <form method="post" id="memoForm">
				<input type="hidden" name="planID" value=${planVO.planID }>
				<!-- Modal content-->
          		<div class="modal-content">
              		<div class="modal-header">
              		  	<button type="button" class="close" data-dismiss="modal">&times;</button>
                   	 	<h4 class="modal-title">Memo</h4>
                    </div>
					<div class="modal-body">
						<textarea rows="10" cols="80" name="memoContents"></textarea>
						<div class="form-group">
							<h3 class="modal-title">사진</h3>
							<label for="exampleInputEmail1">File DROP Here</label>
							<div class="fileDrop"></div>
							<div>
								<hr>
							</div>
							<ul class="mailbox-attachments clearfix uploadedList" style="list-style:none;"></ul>
						</div>
					</div>
				
					<div class="modal-footer">
						<button type="button" class="btn-search4" data-dismiss="modal" id="cancelMemoBtn" style="width: 90px; background: gray; border: 1px solid gray;">CANCEL</button>
						<input type="button" class="btn-search4 " id="deleteMemoBtn" value= "DELETE" style="width: 90px;">
						<input type="button" class="btn-search4"
						id="registerMemoBtn" value="SAVE" style="width: 90px; background: #3994d4; border: 1px solid #006699;">
					</div>
				</div>
			</form>
		</div>
	</div>

<script src="/resources/js/footer.js"></script>	
	
<%@include file="/WEB-INF/views/include/footer.jsp"%>

<!-- 사진 템플릿.  -->
<script id="template" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="{{imgsrc}}" style="width:100px;"></span>
	<div class="mailbox-attachment-info">
		<span class="mailbox-attachment-name">{{fileName}}</span>
		<a data-src="{{fullName}}" class="btn btn-default btn-xs delbtn" onclick="removeAttach($(this))">x<a>
	</div>
</li>
</script>

<!-- file drop관련 스크립트. -->
<script>
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
	
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
	
		var formData = new FormData();
	
		formData.append("file", file);
	
		$.ajax({
			url : '/uploadAjaxPlan',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
	
				$(".uploadedList").append(html);
			}
	
		});
	});
</script>

<!-- full calendar 스크립트. -->
<script>
	$(document).ready(function() {
        var sendData = new Object();
		var memoEvent;
		var eventID;
		var isContents;
		
		var endDate =new Date(${endDate});
		var d = endDate.getDate();
        var m = endDate.getMonth();
        var y = endDate.getFullYear();
        var calendar = $('#calendar').fullCalendar({
             header: {
                 left: 'prev',
                 center: 'title',
                 right: 'next'
             },
             allDaySlot:false,
             defaultView: 'agendaDay',
             validRange: {
                 start: ${startDate},
                 end: new Date(y,m,d+1)
             },
             locale:'us',
             selectable: true,
             
             //사용자 지정 이벤트 등록.
             select: function(start, end, allDay){
               var title = prompt('일정을 입력하세요');
               if(title){
             	  	$.ajax({
             	  		dataType:"text",
             	  		type:"POST",
             	  		url:"/plan/user/register",
             	  		data: JSON.stringify({
                	   		planID:${planVO.planID},
                	   		title:title,
                	   	    planDetailStartTime:start,
                	   	    planDetailEndTime : end
                	   	 }),
                 	  	contentType: "application/json; charset=UTF-8",
                 	  	success: function(result){
                       	  	calendar.fullCalendar('renderEvent', {
                                 title: title,
                                 start:start,
                                 end:end,
                                 allDay:allDay,
                                 id:result
                              }, true);
                 	  	}
             	  	});
               }
               calendar.fullCalendar('unselect');
             },
            
             defaultDate: ${startDate},
             navLinks: true, // can click day/week names to navigate views
             editable: true,
             droppable: true,
             eventLimit: true, // allow "more" link when too many events,
             events: [
             ],
             
             //drop 발생 시, external-event로 부터 필요한 값을 읽어 전역변수 sendData에저장.
             drop: function(date) {
             	sendData.planID = ${planVO.planID};
             	sendData.contentsID = this.id;
             	sendData.categoryID = $(this).attr('name');
             },
             
             //drop시,event를 받아서 db에 저장.
             eventReceive: function(event) {
             	sendData.title = event.title;
             	sendData.planDetailStartTime = event.start.format();
             	var jsonData = JSON.stringify(sendData);
                $.ajax({
             	 	dataType:"text",
             	  	type:"POST",
             	  	url:"/plan/detail/register",
             	  	data: jsonData,
             	  	contentType: "application/json; charset=UTF-8",
             	  	success: function(result){
             	  		event.id=result;
             	  		$('#calendar').fullCalendar('updateEvent', event);
             	  	}
                }); 
             },
             
             //드래그 & 드롭으로 이벤트 시간 변경 시, 해당 이벤트의 db 시간 컬럼 업데이트.
             eventDrop: function(event) {
             		var endTime = event.end;
					if(null != endTime ){
						endTime = event.end.format();
					}else{
						endTime= null;
					}
		
					$.ajax({
						type:"POST",
						url:"/plan/detail/update",
						data:JSON.stringify({
	               	   		 planDetailID: event.id,
	               	   		 planDetailStartTime: event.start.format(),
							 planDetailEndTime:endTime
	               	   	 }),
						contentType: "application/json; charset=UTF-8",
					});
             },
             eventResize: function(event, delta, revertFunc) {
	   			 $.ajax({
					type:"POST",
					url:"/plan/detail/update",
					data:JSON.stringify({
               	   		 planDetailID: event.id,
               	   		 planDetailStartTime: event.start.format(),
						 planDetailEndTime:event.end.format()
	               	   }),
					contentType: "application/json; charset=UTF-8",
				});
             },
             
             eventRender: function(event, element) {
                 element.find('.fc-content').append( '<span class="glyphicon glyphicon-edit memo" aria-hidden="true">&nbsp' );
                 element.find('.fc-content').append('<span class="glyphicon glyphicon-trash closeon" aria-hidden="true">' );
                 //삭제
                 element.find(".closeon").click(function() {
                 	var arr =[];
                 	
                 	//첨부파일이 있는 경우 로컬에 저장된 이미지 삭제 후, db삭제 진행.
                 	$(".uploadedList li").each(function(index){
                 		arr.push($(this).attr("data-src"));
                 	});
                 	
                 	if(arr.length >0 ){
                 		$.post("/deleteAllFiles",{files:arr, directory:"plan"},function(){
                 		});
                 	}
                 	
	        			 $.ajax({
	                	   	 url:'/plan/detail/delete/'+event.id,
	                	   	 type:"POST",
	                	   	 contentType: "application/json; charset=UTF-8",
	                	     success:function(result){
	                   	   	 if(result == 'SUCCESS'){
	                    	   		 alert('삭제되었습니다.');
	                    	   	 }
	                	   	}
	                   });
        				 $('#calendar').fullCalendar('removeEvents',event.id);	
                 });
                 //메모
                 element.find(".memo").click(function(){                   
                 		eventID= event.id;
                 		$.ajax({
                 			url:"/plan/memo/"+eventID,
                 			type:"POST",
                 			async:true,
                 			dataType:"json",
                 			contentType:"application/json; charset=UTF-8",
                 			success:function(result){
                 				isContents = result.memoVO.memoContents;
                 				$('textarea').val(isContents);
                 				
                 				$('.uploadedList').empty();
                 				//받아온 사진 있으면 조회해서 uploadedList에 뿌려줌.
                 				var template = Handlebars.compile($("#template").html());
                 				$(result.memoVO.memoPictureName).each(function(){
                 					var front = this.substr(0,12);
                 					var end = this.substr(12);
                 					var fullName = front+end;
                 					var fileInfo = getFileInfo(fullName);
                 					var html = template(fileInfo);
                 					$(".uploadedList").append(html);
                 				});
                 				$('#myModal').modal({backdrop: 'static'});
                 			  $('#myModal').modal('show');
                              
                 			}
                 		});
                 	});
             	}
         	});
           
           //메모 등록 버튼.
           $("#registerMemoBtn").click(function(event){
           		event.preventDefault();
           		var formdata = $(this).parent().parent().parent();
           		var url;
           		var str="";
           		if(isContents == null){
           			url = "/plan/memo/register";
           		}else{
           			url = "/plan/memo/update";
         	  	}	
          	 	str = "<input data-src='remove' type='hidden' name='planDetailID' value='" + eventID
				+ "'>";
          	 	$(".uploadedList .delbtn").each(
					function(index) {
						str += "<input data-src='remove' type='hidden' name='memoPictureName' value='" + $(this).attr("data-src")
								+ "'>";
					});
          	 	formdata.append(str);
          	 	
	          	var fd = new FormData(formdata.get(0));
	           	 $.ajax({
	                 url: url,
	                 processData: false,
	                 contentType: false,
	                 data: fd,
	                 type: 'POST',
	                 success: function(result){
	                 	$("[data-src='remove']").remove();
	                	 	if(result =='R_SUCCESS'){
	                	 		$('#myModal').modal('hide');
	                     	alert("등록되었습니다.");
	                	 	}else{
	                	 		$('#myModal').modal('hide');
	                	 		alert("수정되었습니다.");
	                	 	}
	                 }
	             });
           });
           
           //메모 삭제 버튼.
         $("#deleteMemoBtn").click(function(){
       	    event.preventDefault();
   	        	var arr =[];
   	        	
   	      	//첨부파일이 있는 경우.
   	        	$(".uploadedList li").each(function(index){
   	        		arr.push($(this).attr("data-src"));
   	        	});
   	        	
   	        	if(arr.length >0 ){
   	        		$.post("/deleteAllFiles",{files:arr, directory:"plan"},function(){
   	        		});
   	        	}
           	$.ajax({
         		url:"/plan/memo/delete/"+eventID,
         		type:"POST",
         		contentType: "application/json; charset=UTF-8",
                 success:function(result){
              	   	if(result=='SUCCESS'){
              	  	 	$('#myModal').modal('hide');
           	   			alert('삭제되었습니다.');
           	   		}
                  }
           		});  
           });
           
           $(".close ,#cancelMemoBtn").click(function(){
           	var arr = [];
        		if(isContents == null){
	            	//첨부파일이 있는 경우.
	            	$(".uploadedList li").each(function(index){
	            		arr.push($(this).attr("data-src"));
	            	});
	            	
	            	if(arr.length >0 ){
	            		$.post("/deleteAllFiles",{files:arr, directory:"plan"},function(){
	            		});
	            	}
        		}
        		$('#myModal').modal('hide');
        		$('.uploadedList').empty(); 
        		
           });
 	});
        
	 //이미지 삭제 버튼.
	 function removeAttach(event){
	  		var that= event;
	 		$.ajax({
	 			url: "/deleteFile",
	 			type:"post",
	 			data:{fileName:$(event).attr("data-src"), directory:"plan"},
	 			dataType:"text",
	 			success:function(result){
	 				that.parent().parent().remove();
	 			}
	 		});
	 } 
</script>

<!-- 스크랩리스트 템플릿 -->
<script id="scrapList" type="text/x-handlebars-template">

						<div class="scrapListBox-detail ">
							<div class="scrapBox">
								<input type="hidden" id="scrapID" value="{{scrapID}}">
									
								<p class="scrapTumbnail col-md-5" style="background-image:url({{thumbnail}})"></p>	
								
								<p class="scrapInfo col-md-7">
									<span class="size14 label label-warning">{{category}}</span><br>
									<a class="scrapTitle dark" href="/contents/1/{{contentsID}}"><b>{{title}}</b></a>

									<button class="scrapBtn" value="{{scrapID}}" onclick="scrapDelete(this)">스크랩취소</button>
								</p>
								<div class="clearfix"></div>	
							</div>
						</div>
</script>

<!-- 스크랩 리스트 조회 -->
<script>
$.getJSON('/scraplist',function(data){
   	var categoryKor ="";
	var random = 0;
	var str = "";
	function getData(list){
		if(list.contentsPhoto==""){
			if(list.categoryID==1){ 
				categoryKor ="맛집";
				random = list.categoryID % 10 +10;
			}else{ 
				categoryKor ="관광지";
				random = list.categoryID % 10 +20;
			}
			list.contentsPhoto ="/resources/images/contents/"+ random + ".jpg";
		}
		var scrapData = {
				scrapID : list.scrapID,
			    category : categoryKor,
			    title : list.contentsTitle,
			    thumbnail : list.contentsPhoto,
			    contentsID : list.contentsID,
			   	created : list.created
		}
		return scrapData;
	}
	
   $(data).each(function(i,list){
      var source = $("#scrapList").html();
      var template = Handlebars.compile(source);
      str += template(getData(list));
   });
   
   $('#tab-newtopic').html(str);
   
   $('#external-events .fc-event').each(function() {
       // store data so the calendar knows to render an event upon drop
          event.preventDefault();   
       		var s = $(this).attr("data-name");
          	
           $(this).data('event', {
               title: $.trim(s), // use the element's text as the event title
               stick: true, // true : next / prev 버튼 클릭 후 다시 제자리로 돌아왔을 때도 추가된 일정 그대로 남아 있음
                             // false: 없어짐.
               color:$(this).data('color')
           });
           // make the event draggable using jQuery UI
           $(this).draggable({
               zIndex: 999,
               revert: true,      // will cause the event to go back to its
               revertDuration: 0,  //  original position after the drag
               helper : 'clone'
               
           });
           
       });
   
});
</script>
</body>

</html>