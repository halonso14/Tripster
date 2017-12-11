<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset='utf-8' />
    <link href='/resources/css/fullcalendar.min.css' rel='stylesheet' />
    <link rel="stylesheet" type="text/css" href="/resources/css/semantic.css">
    <!--<link href='calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />-->
    <script src='/resources/js/moment.min.js'></script>
    <script src='/resources/js/jquery.min.js'></script>
    <script src='/resources/js/jquery-ui.min.js'></script>
    <script src='/resources/js/fullcalendar.min.js'></script>
    <script src="/resources/js/semantic.js"></script>
    <script src="/resources/js/locale-all.js"></script>
    <script>

        $(document).ready(function() {

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            var sendData = new Object();

            var collection =[];
         //   var newEvent=[];
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
                defaultView: 'agendaDay',
                locale:'us',
                selectable: true,
//                selectHelper:true,
                select: function(start, end, allDay){
                  var title = prompt('일정을 입력하세요');
                  if(title){
                      calendar.fullCalendar('renderEvent', {
                          title: title,
                          start:start,
                          end:end,
                          allDay:allDay
                      },
                      true
                      );
                  }
                  calendar.fullCalendar('unselect');
                },
               
                defaultDate: ${date},
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                droppable: true,
                eventLimit: true, // allow "more" link when too many events,
                events: [
                ],
                eventDrop: function(event) {
					var updateData = {};
					updateData.planDetailID = event.id;
					updateData.dateAndTime = event.start.format();
					var updateJson = JSON.stringify(updateData);
					
					$.ajax({
						type:"POST",
						url:"/plan/updatePlanDetail",
						data:updateJson,
						contentType: "application/json; charset=UTF-8",
                	  		success: function(result){
                	  		}
						
					});
               
                },
                drop: function(date) {
                	    	
                	sendData.planID = ${planVO.planID};
                	sendData.contentsID = this.id;
                	sendData.codeID = $(this).attr('name');
                },
                eventReceive: function(event) {
                	sendData.title = event.title;
                	sendData.dateAndTime = event.start.format();
               	
                	var jsonData = JSON.stringify(sendData);
                	console.log(jsonData);

                  $.ajax({
                	 	dataType:"text",
                	  	type:"POST",
                	  	url:"/plan/detailRegister",
                	  	//async:true, 
                	  	data: jsonData,
                	  	contentType: "application/json; charset=UTF-8",
                	  	success: function(result){
                	  		event.id=result;
                	  		$('#calendar').fullCalendar('updateEvent', event);
                	  		alert(event.id);
                	  	}
                  }); 
                },
                eventRender: function(event, element) {
                    /* if(collection.length ==0 && event._id != undefined){
                        collection.push(event);
                    }else {
                        for (var i = 0; i < collection.length; i++) {
                            //collection배열에 이미 이벤트가 있으면 break;
                            if (collection[i]._id == event._id && event._id != undefined) break;
                            //collection배열에 이벤트가 없는경우
                            else {
                                //collection의 마지막 index까지 해당 이벤트의 id와 일치하는것이 없을 때 collection에 새로 추가
                                if(i==collection.length-1)
                                    collection.push(event);
                                //있는 경우 continue
                                else continue;

                            }
                        }

                } */
                    element.find('.fc-content').append( "<span class='memo'> ㅁ </span>" );
                    element.find('.fc-content').append( "<span class='closeon'> X </span>" );
                    //삭제
                    element.find(".closeon").click(function() {
                       $.ajax({
                    	   	 url:'/plan/deletePlanDetail',
                    	   	 type:"POST",
                    	   	 data:JSON.stringify({
                    	   		 planDetailID: event.id
                    	   	 }),
                    	   	contentType: "application/json; charset=UTF-8",
                    	   	success:function(result){}
                    	   	 
                       });
                        $('#calendar').fullCalendar('removeEvents',event.id);
                    });

                    //메모
                    element.find(".memo").click(function(){
                        $('.ui.modal').modal('show');

                    });
                }


            });


           // console.log(newEvent);
            $("#btn").on("click",function(){
                console.log(collection);
                console.log(calendar.fullCalendar('getEventSources'));
               // event.stopPropagation();

//                var tmp= calendar.fullCalendar('getEventSources');
//                var sendData ={
//                    "collection": newEvent,
//                    "event" : tmp
//                };
//
//                $.ajax({
//                    type:"POST",
//                    url:"test.html",
//                    async:true,
//                    data: sendData,
//                    success : function(result){
//                    }
//
//                });


            });
           

        });
    </script>
    <style>

        body {
            margin-top: 40px;
            text-align: center;
            font-size: 14px;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
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

    <div id='calendar'>
    </div>
    <div style='clear:both'></div>
</div>

<div class="ui modal">
    <i class="close icon"></i>
    <div class="header">
        Profile Picture
    </div>
    <div class="image content">
        <div class="ui medium image">
            <img src="/resources/planImg/apple.jpeg">
        </div>
        <div class="description">
            <div class="ui header">We've auto-chosen a profile image for you.</div>
            <p>We've grabbed the following image from the <a href="https://www.gravatar.com" target="_blank">gravatar</a> image associated with your registered e-mail address.</p>
            <p>Is it okay to use this photo?</p>
        </div>
    </div>
    <div class="actions">
        <div class="ui black deny button">
            Nope
        </div>
        <div class="ui positive right labeled icon button">
            Yep, that's me
            <i class="checkmark icon"></i>
        </div>
    </div>
</div>
    <button id="btn" >SAVE</button>

</body>

</html>