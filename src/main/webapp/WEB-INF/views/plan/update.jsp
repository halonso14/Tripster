<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset='utf-8' />
<link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="/resources/css/semantic.css">
<!--<link href='calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />-->
<script src='/resources/js/moment.min.js'></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src='/resources/js/fullcalendar.min.js'></script>
<script src="/resources/js/semantic.js"></script>
<script src="/resources/js/locale-all.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="/resources/js/jquery.multifile.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>$(document).ready(function() {

	var endDate =new Date(${endDate});
	var d = endDate.getDate();
    var m = endDate.getMonth();
    var y = endDate.getFullYear();
    var sendData = new Object();
	var memoEvent;
	var eventID;
	var isContents;
	var obj = [];
	var planID = ${plan.planID};
	
    $('#external-events .fc-event').each(function() {
    // store data so the calendar knows to render an event upon drop
    		
        $(this).data('event', {
            title: $.trim($(this).text()), // use the element's text as the event title
            stick:true // true : next / prev 버튼 클릭 후 다시 제자리로 돌아왔을 때도 추가된 일정 그대로 남아 있음
                          // false: 없어짐.
        });
        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag

        });
    });

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
             	   		planID:${plan.planID},
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
          events: function(start, end, timezone, callback) {
                  var events = [];
                  $.ajax({
                      url: '/plan/update',
                      type : 'post',
                      data : JSON.stringify({
          					planID:planID
          				}),
                      dataType: 'json',
                      contentType: "application/json; charset=UTF-8",
                      success: function(data) {
                          var events = [];
                          $.each(data, function (index, item) {
                    		var startT= item.planDetailDate+"T"+item.planDetailStartTime;
                    		var endT = item.planDetailDate+"T"+item.planDetailEndTime;
                          	console.log(item.title);
                              events.push({
                                  title: item.title,
                                  start: startT,
                                  end: endT,
                                  id:item.planDetailID
                              });
                          });
                          callback(events);
                      }
                  }); 
          },
        
          //drop 발생 시, external-event로 부터 필요한 값을 읽어 전역변수 sendData에저장.
          drop: function(date) {
          	sendData.planID = ${plan.planID};
          	sendData.contentsID = this.id;
          	sendData.categoryID = $(this).attr('name');
          },
           
          //drop시,event를 받아서 db에 저장.
          eventReceive: function(event) {
          	sendData.title = event.title;
          	sendData.planDetailStartTime = event.start.format();
         	
          	var jsonData = JSON.stringify(sendData);
          	console.log(jsonData);

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
			           	  		success: function(result){
			           	  		}
				
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
             element.find('.fc-content').append( "<span class='memo'> ㅁ </span>" );
             element.find('.fc-content').append( "<span class='closeon'> X </span>" );
             
             //삭제
             element.find(".closeon").click(function() {
             	var arr =[];
             	//첨부파일이 있는 경우 로컬 저장소에 저장된 사진들 삭제.
             	$(".uploadedList li").each(function(index){
             		arr.push($(this).attr("data-src"));
             	});
             	if(arr.length >0 ){
             		$.post("/deleteAllFiles",{files:arr},function(){
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
             		console.log(eventID);
             		$.ajax({
             			url:"/plan/memo/"+eventID,
             			type:"POST",
             			async:true,
             			dataType:"json",
             			contentType:"application/json; charset=UTF-8",
             			success:function(result){
             				isContents = result.memoVO.memoContents;
             				console.log(isContents);
             				$('textarea').val(isContents);
             				$('.uploadedList').empty();
             				//받아온 사진 있으면 조회해서 uploadedList에 뿌려줌.
             				var template = Handlebars.compile($("#template").html());
             				$(result.memoVO.memoPictureName).each(function(){
             					var front = this.substr(0,12);
             					var end = this.substr(12);
             					var fullName = front+"s_"+end;
             					var fileInfo = getFileInfo(fullName);
             					var html = template(fileInfo);
             					$(".uploadedList").append(html);
             				});
             				
             				console.log(result);
             				$('.ui.modal').modal('show');
                          $('.ui.modal').modal({backdrop: 'static'});
             			}
         		  });
            });
         }
      });
         
      //메모 등록 버튼.
      $("#registerMemoBtn").click(function(event){
       		event.preventDefault();
       		var formdata = $(this).parent().parent();
       		var url;
       		var str;
       		if(isContents == null){
       			url = "/plan/memo/register";
       		}else{
       			url = "/plan/memo/update";
     	  	}	
          	str = "<input data-src='remove' type='hidden' name='planDetailID' value='" + eventID+ "'>";
      	 	$(".uploadedList .delbtn").each(function(index) {
				str += "<input data-src='remove' type='hidden' name='memoPictureName' value='" + $(this).attr("data-src") + "'>";
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
	                 	alert("등록되었습니다.");
	            	 	}else{
	            	 		alert("수정되었습니다.");
	            	 	}
	             }
	         });
       });
         
       //close & cancel 버튼.
       $(".close, #cancelMemoBtn").click(function(){
      		var arr = [];
      		if(isContents == null){
	        		//첨부파일이 있는 경우.
		        	$(".uploadedList li").each(function(index){
		        		console.log($(this));
		        		console.log($(this).attr("data-src"));
		        		arr.push($(this).attr("data-src"));
		        	});
        	
		        	if(arr.length >0 ){
		        		$.post("/deleteAllFiles",{files:arr},function(){
		        		});
		        		console.log(arr);
		        	}
      		}
      		$('.uploadedList').empty(); 
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
	        		$.post("/deleteAllFiles",{files:arr},function(){
	        		});
	        	}
	        	
        		$.ajax({
        			url:"/plan/memo/delete/"+eventID,
        			type:"POST",
        			contentType: "application/json; charset=UTF-8",
             	success:function(result){
	           	   	if(result=='SUCCESS'){
	           	  	 	$('.ui.modal').modal('hide');
	        	   			alert('삭제되었습니다.');
	        	   		}
               	}
        		});  
        });
     });

     //이미지 삭제 버튼.
     function removeAttach(event){
    		console.log(event);
     	var that= event;
    		$.ajax({
    			url: "/deleteFile",
    			type:"post",
    			data:{fileName:$(event).attr("data-src")},
    			dataType:"text",
    			success:function(result){
    				that.parent().parent().remove();
    			}
    		});
    	} 
</script>
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
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
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
	width: 900px;
}

.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>



</head>
<body>
	<div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div class='fc-event' id=1 name=1>한글이</div>
			<div class='fc-event' id="2" name=1>My Event 2</div>
			<div class='fc-event' id="3" name=1>My Event 3</div>
			<div class='fc-event' id="4" name=2>My Event 4</div>
			<div class='fc-event' id="5" name=2>My Event 5</div>
		</div>

		<div id='calendar'></div>
		<div style='clear: both'></div>
	</div>

	<div class="ui modal">
		 <form method="post" id="memoForm">
			<input type="hidden" name="planID" value=${plan.planID }>
			<i class="close icon"></i>
			<div class="header">Memo</div>
			<div class="description">
				<div class="ui header">내용</div>
				<textarea rows="10" cols="100" name="memoContents"></textarea>
				<div class="form-group">
					<div class="ui header">사진</div>
					<label for="exampleInputEmail1">File DROP Here</label>
					<div class="fileDrop"></div>
					<div>
						<hr>
					</div>
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
				</div>
			</div>
			
			<div class="actions">
				<input type ="button" class="ui red labeled icon button" id="deleteMemoBtn" value= "DELETE">
				<input type="button" class="ui negative right labeled icon button" id="cancelMemoBtn" value= "CANCEL">
				<input type="button" class="ui positive right labeled icon button"
				id="registerMemoBtn" value="SAVE">
			</div>
		</form>
	</div>
	
	<form action="/plan/read" type="get">
		<input type="hidden" name="planID" value=${plan.planID }>
		<button class="ui positive right labeled icon button" id="registerPlan" >
		SAVE</button>
	</form>


	<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
   <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
   </span>
  </div>
</li>                
</script>


<script id="template" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="{{imgsrc}}"></span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a data-src="{{originalName}}" class="btn btn-default btn-xs pull-right delbtn" onclick="removeAttach($(this))">x<a>
	</div>
</li>
</script>

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
			url : '/uploadAjax',
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
</body>

</html>