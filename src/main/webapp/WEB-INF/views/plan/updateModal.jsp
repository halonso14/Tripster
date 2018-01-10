<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="/resources/dist/css/bootstrap.css">
<script src="/resources/dist/js/bootstrap.js"></script> -->
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
    
/* button, input, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    width: 180px;
} */
</style>
	<div class="container">
        

           <form role="form" id="updatePlanForm" action="/plan/updateTAD" method="POST">
            <input type="hidden" name="planID" value="${plan.planID }">
            <div class="modal fade" id="updateModal" role="dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">여행 일정 수정</h4>
                </div>
                <div class="modal-body" style="width:100%;    text-align-last: center;">
                		<div>
                   	  TITLE <input type="text" id="updateTitle" name="planTitle" style="width: 420px;text-align-last: left;" onmousedown="updateTitleMouseDown()" value="${plan.planTitle }">
                     </div>
                     <span class="updateTitleError" id="updateTitleError"style="color: red; font-weight: bold;"></span>
                    <div class="line4"></div>
                    <div>
                    		<fmt:formatDate var="startPlanDate" value="${plan.planStartDate }" pattern="yyyy-MM-dd"/>
                    		<fmt:formatDate var="parseEndDate" value="${plan.planEndDate }" pattern="yyyy-MM-dd"/>
                        시작일 <input type="date" name="planStartDate" id="updateStartDate" onmousedown="updateDateMouseDown()" style="width: 180px" value="${startPlanDate }">&nbsp;&nbsp; ~ &nbsp; 종료일 <input type="date" id="updateEndDate" name="planEndDate" value="${parseEndDate }"onmousedown="updateDateMouseDown()" style="width: 180px">

                    </div>
                    <span class="updateDateError" id="updateDateError" style="color: red; font-weight: bold;"></span>
                </div>

                <div class="modal-footer">
                    <input type="reset" class="btn btn-default" style="width: 180px" value="초기화">
                    <input type="button" class="btn btn-primary" value="다음" onclick="updateErrorCheck()" style="width: 180px">
                </div>
            </div>
            </div>
            </form>
        
    </div>
    
    <script>
  		//modal open			  
    		function updateModal(){
    			$('#updateModal').modal({backdrop: 'static'});
    			$('#updateModal').modal('show');
    		}
    		
    		
    		//입력 폼에 대한 errorCheck
    		function updateErrorCheck(){
    			var startDate = $("#updateStartDate").val();
    			var endDate= $("#updateEndDate").val();
    			var errorMessage='';
    			var title = $("#updateTitle").val();
    			console.log(startDate +","+ endDate);
    			//title입력 여부?	
     			if(''!= title){
     				//yes-> startDate && endDate 입력여부?
    					if(startDate && endDate){
    						//yes -> startDate 와 endDate를 date type으로 변환.
	    					var start = new Date(startDate);
	    					var end = new Date(endDate);
	    					//startDate > endDate ?
		    				if(startDate > endDate){
		    					//yes -> errorMessage출력.		
			    				errorMessage ='<span>여행 일정을 확인해주세요.</span>';
			    				$(".updateDateError").html(errorMessage);
			    			}else{
			    				//no -> 입력 검증 완료, form 전송.
			    				var formdata =$("#updatePlanForm").get(0);
			    				formdata.submit();
			    			}
	    				}else{
	    					//no-> errorMessage 출력.
	    					errorMessage ='<span>여행 일정을 확인해주세요.</span>';
	    					$(".updateDateError").html(errorMessage);
	    				} 
    				}else{
    					//no-> errorMessage 출력.
	   				errorMessage = '<span>제목을 입력하세요.</span>';
    				$('.updateTitleError').html(errorMessage); 
    			} 
    		}
    		
    		//errorMessage값 지워주기.
    		function updateTitleMouseDown() {
    		    $(".updateTitleError").empty();
    		}
    		function updateDateMouseDown() {
    			$(".updateDateError").empty();
    		}
    		 
    </script>
    