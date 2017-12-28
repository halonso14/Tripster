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

            <form action="/plan/register" method="POST">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">여행 일정 등록</h4>
                </div>
                <div class="modal-body">
                     TITLE <input type="text" name="planTitle" style="width: 400px" required>
                    <hr>
                    <div>
                        시작일 <input type="date" name="planStartDate" required>  ~  종료일 <input type="date" name="planEndDate" required>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cancelMemoBtn">CANCEL</button>
                    <input type="submit" class="btn btn-primary" value="등록">
                </div>
            </div>
            </form>
        </div>
    </div>
    
    <script>
    		function planModal(){
    			$('#planModal').modal({backdrop: 'static'});
    			$('#planModal').modal('show');
    		}
    </script>
    