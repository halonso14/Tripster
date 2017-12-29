<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="/resources/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.modal {
            position: fixed;
            left: 50%;
            top: 50%;

            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

.modal-body {
    display: inline-block;
    background-color: #FFF; }
</style>
	<div class="container">
        <div class="modal fade" id="planModal" role="dialog">

            <form role="form" action="/plan/register" method="POST">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">여행 일정 등록</h4>
                </div>
                <div class="modal-body">
                		<div>
                   	  TITLE <input type="text" id="planTitle" name="planTitle" style="width: 400px" onmousedown="titleMouseDown()">
                     </div>
                     <span class="titleError" id="titleError"style="color: red; font-weight: bold;"></span>
                    <hr>
                    <div>
                        시작일 <input type="date" name="planStartDate" id="planStartDate" onmousedown="dateMouseDown()">  ~  종료일 <input type="date" id="planEndDate" name="planEndDate" onmousedown="dateMouseDown()">

                    </div>
                    <span class="dateError" id="dateError"style="color: red; font-weight: bold;"></span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cancelMemoBtn">CANCEL</button>
                    <input type="button" class="btn btn-primary" value="등록" onclick="errorCheck()">
                </div>
            </div>
            </form>
        </div>
    </div>
    
    <script>
  		//modal open			  
    		function planModal(){
    			$('#planModal').modal({backdrop: 'static'});
    			$('#planModal').modal('show');
    		}
    		
    		
    		//입력 폼에 대한 errorCheck
    		function errorCheck(){
    			var startDate = $("#planStartDate").val();
    			var endDate= $("#planEndDate").val();
    			var errorMessage='';
    			var title = $("#planTitle").val();
    			console.log(startDate);
     			if(''!= title){
    					if(startDate && endDate){
	    					var start = new Date(startDate);
	    					var end = new Date(endDate);
		    				if(startDate > endDate){
			    				errorMessage ='<span>여행 일정을 확인해주세요.</span>';
			    				$(".dateError").html(errorMessage);
			    			}else{
			    				var formdata =$("form[role='form']").get(0);
			    				formdata.submit();
			    			}
	    				}else{
	    					errorMessage ='<span>여행 일정을 확인해주세요.</span>';
	    					$(".dateError").html(errorMessage);
	    				} 
    				}else{
	   				errorMessage = '<span>제목을 입력하세요.</span>';
    				$('.titleError').html(errorMessage); 
    			} 
    		}
    		
    		//errorMessage값 지워주기.
    		function titleMouseDown() {
    		    $(".titleError").empty();
    		}
    		function dateMouseDown() {
    			$(".dateError").empty();
    		}
    		 
    </script>
    