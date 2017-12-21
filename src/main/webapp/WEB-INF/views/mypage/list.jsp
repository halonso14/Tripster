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
	
	<!-- 컨트롤러에서 접속중인 memberID를 받아옴  -->
	<input type="hidden" id="memberID" value="${memberID}" />
	
	<button id="scrapList">스크랩 리스트</button>	
	<div class="scrapList">
	</div>
	
	<button id="likeList">좋아요한 일정 리스트</button>
	<div class="likeList">
	</div>
	
	<button id="followList">follow list</button>
	<div class="followList">
	</div>
	
	<button id="followingList">following list</button>
	<div class="followingList">
	</div>
	
	<form id="form" method="post">
	</form>
	
	<!-- 스크랩 리스트 조회 -->
	<script>
			$(document).ready(function (){
				
				// 접속중인 유저 아이디 저장
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
						
						$('.scrapList').html(str);
						
					});
				};
				
				// 스크랩 리스트 버튼을 누를경우 스크랩 리스트 조회
				$('#scrapList').on('click',function(){
					getAllList();
				})
				
				// 스크랩 삭제
				$('.scrapList').on('click','.scrapRemove',function () {
					
					var scrapID = $(this).val();
					$.post('/scrapIDremove/'+scrapID,function(data){
						alert(data);
						getAllList();
					});

				});
				
				// 스크랩한 컨텐츠 조회
				$('.scrapList').on('click','.contentsID',function(){
					
					var contentsID = $(this).attr("value");
					$('#form').attr("action","/contentsPage/contents/"+contentsID);
					$('#form').attr("method","get");
					$('#form').submit();
					
				});
				
			})
	</script>
	
	<!-- 좋아요 일정리스트 조회 -->
	<script>
	$(document).ready(function (){
		
		//접속중인 유저 아이디 저장
		var memberID = $('#memberID').val();
		
		// 전체 리스트 조회 함수
		var getAllList = function(){

			$.getJSON('/userLikeList/'+memberID,function(data){
				
				var str = "";
				
				$(data).each(function(i,list){
					str += "<li>"+i+".이름:<div>"+list.planTitle+
							"</div class='planID' value="+list.planID+">"+
							"<button class='likeDelete' value="+list.planID+">삭제</button></li>";
				});
				
				$('.likeList').html(str);
				
			});
		};
		
		$('#likeList').on('click',function(){
			getAllList();
		})
		
	})
	</script>
	
	<!-- 팔로우 리스트 조회 -->
	<script>
	$(document).ready(function (){
		
		//접속중인 유저 아이디 저장
		var memberID = $('#memberID').val();
		
		// 전체 리스트 조회 함수
		var getAllList = function(){

			$.getJSON('/userFollowList/'+memberID,function(data){
				
				var str = "";
				
				$(data).each(function(i,list){
					str += "<li>"+i+".이름:<div>"+list.memberName+
							"</div class='memberID' value="+list.memberID+">"+
							"<button class='memberDelete' value="+list.memberID+">삭제</button></li>";
				});
				
				$('.followList').html(str);
				
			});
		};
		
		$('#followList').on('click',function(){
			getAllList();
		})
		
	})
	</script>
	
	<!-- 팔로잉 리스트 조회 -->
	<script>
	$(document).ready(function (){
		
		//접속중인 유저 아이디 저장
		var memberID = $('#memberID').val();
		
		// 전체 리스트 조회 함수
		var getAllList = function(){

			$.getJSON('/userFollowingList/'+memberID,function(data){
				
				var str = "";
				
				$(data).each(function(i,list){
					str += "<li>"+i+".이름:<div>"+list.memberName+
							"</div class='memberID' value="+list.memberID+">"+
							"<button class='memberDelete' value="+list.memberID+">삭제</button></li>";
				});
				
				$('.followingList').html(str);
				
			});
		};
		
		$('#followingList').on('click',function(){
			getAllList();
		})
		
	})
	</script>
	
	
</body>
</html>
