// id="like" 인 속성의 value 값을 바꿈
function likeCheck(planID,likeBtn){
	
	$.ajax({
		type : 'post',
		url : '/likeCheck/'+planID,
		async: false,
		success : function(check){
			likeBtn.attr('likeBtnCheck',check);
		}
	});
	
}

function likeClick(session,event){
	
	if(session){
		// 라이크 버튼
		var likeBtn = event;
		// 누른 버튼의 planID 저장
		var planID = likeBtn.attr('value');
		// 좋아요 체크
		likeCheck(planID,likeBtn);
		
		// 좋아요 추가
		if(likeBtn.attr('likeBtnCheck') == 0){
			
			likeBtn.attr('likeBtnCheck',1);
			console.log("click" + planID);
			// 좋아요 추가
			$.post('/like/'+planID,function(result){
				
				likeBtn.removeClass('fav-icon like');
				likeBtn.addClass('fav-icon-red like');
				
				alert("좋아요 추가");
			});
			
		}else{
			
			likeBtn.attr('likeBtnCheck',0);
			
			// 좋아요 삭제
			$.post('/likeDelete/'+planID,function(result){
				
				likeBtn.removeClass('fav-icon-red like');
				likeBtn.addClass('fav-icon like');
				
				alert("좋아요 삭제");
			});
			
		}
	}else{
		alert("로그인 후 이용해주세요.");
	}
}