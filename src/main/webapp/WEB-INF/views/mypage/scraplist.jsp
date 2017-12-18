<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
</head>
<body>
	
	<!-- 컨트롤러에서 memberID를 받아옴  -->
	<input type="hidden" id="memberID" value="${memberID}" />
	<div id="test">
	</div>
	<script>
			$(document).ready(function(){
				var val = $('#memberID').val();
				$('#test').html(val);
			});
	</script>

	<div class="list">
		
	
	</div>
	
	<form id="form" method="post">
	
	</form>
	
	<script>
			$(document).ready(function (){

				var memberID = $('#memberID').val();
				// 전체 리스트 조회 함수
				var getAllList = function(){

					$.getJSON('/scraplist/'+memberID,function(data){
						
						var str = "";
						
						$(data).each(function(i,list){
							str += "<li>"+i+".이름:<div class='contentsID' value="+list.contentsID+">"
									+list.contentsTitle+"</div>,"+
									"내용:"+list.contentsPhoto+
									"<button class='scrapRemove' value="+list.scrapID+">삭제</button></li>";
						});
						
						$('.list').html(str);
						
					});
				};
				
				// 페이지 들어올경우 전체리스트 조회
				getAllList();
				
				// 스크랩 삭제
				$('.list').on('click','.scrapRemove',function () {
					
					var scrapID = $(this).val();
					$.post('/scrapIDremove/'+scrapID,function(data){
						alert(data);
						getAllList();
					});

				});
				
				// 스크랩 조회
				$('.list').on('click','.contentsID',function(){
					
					var contentsID = $(this).attr("value");
					$('#form').attr("action","/contentsPage/contents/"+contentsID);
					$('#form').attr("method","get");
					$('#form').submit();
					
				});
				
			})
		</script>
	
	
</body>
</html>
