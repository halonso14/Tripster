$(document).ready(function(){
	
	// id="like" 인 속성의 value 값을 바꿈
	function likeCheck(planID,likeBtn){
		
		$.ajax({
			type : 'post',
			url : '/likeCheck/'+planID,
			async: false,
			success : function(check){
				alert("좋아요 체크 변경"+check);
				likeBtn.attr("likeBtnCheck",check);
			}
		});
		
	}
	
	// follow 체크 함수
	function followCheck(followID,followBtn){
		
		$.ajax({
			type : 'post',
			url : '/followCheck/'+followID,
			async: false,
			success : function(check){
				alert("팔로우 체크 변경"+check);
				followBtn.attr("followBtnCheck",check);
			}
		});
		
	}
	
	// 속성 양식: <button class='follow' followID='' followBtnCheck='1' />
	// 유저 팔로우 ( class="follow" 인 버튼을 누를 경우 )
	$('.follow').on('click',function(){

		// 팔로우 버튼
		var followBtn = $(this);
		// 누른 버튼의 followID 저장  (팔로우 당한사람)
		var followID = followBtn.attr("followID");
		// 팔로우 체크
		followCheck(followID,followBtn);
		
		// 체크값이 1인 경우 팔로우 
		if(followBtn.attr(followBtnCheck) == 1){
			
			alert('follow 추가');
			followBtn.attr('followBtnCheck',0);
			
			 $.post('/memberFollow/'+followID,function(result){
				alert(result);
			 });
			
		}else{
			
			alert('follow 취소')
			followBtn.attr('followBtnCheck',1);
			
			$.post('/memberFollowDelete/'+followID,function(result){
				alert(result);
			});

		}

	});
	
	// 속성 양식 <button class='like' planID='' likeBtnCheck='1' />
	// 게시글 좋아요
	$('.like').on('click',function(){
		
		// 라이크 버튼
		var likeBtn = $(this);
		// 누른 버튼의 planID 저장
		var planID = likeBtn.attr("planID");
		// 좋아요 체크
		likeCheck(planID,likeBtn);
		
		// 좋아요 추가
		if(likeBtn.attr("likeBtnCheck") == 1){
			
			alert("좋아요 추가");
			
			check.attr('value',0);
			// 좋아요 추가
			$.post('/like/'+planID,function(result){
				alert(result);
			});
			
		}else{
			
			alert("좋아요 삭제");
			check.attr('value',1);
			
			// 좋아요 삭제
			$.post('/likeDelete/'+planID,function(result){
				alert(result);
			});
			
		}
	})

})