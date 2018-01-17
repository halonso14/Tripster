
$(document).ready(function(){
	
	// 팔로우 당한사람
	var followID = $('#followID').val();
	// 접속중인 유저
	var memberID = $('#memberID').val();
	
	// 유저 좋아요 기능
	$('#follow').on('click',function(){
		var followcheck = $('#follow');
		alert(followcheck.val());
		
		if(followcheck.val() == 1){
			
			alert('follow 추가');
			followcheck.attr('value',0);
			
			 $.post('/memberFollow/'+followID+'/'+memberID,function(result){
				alert(result);
			});
			
		}else{
			
			alert('follow 취소')
			followcheck.attr('value',1);
			$.post('/memberFollowDelete/'+followID+'/'+memberID,function(result){
				alert(result);
			});
		}
	});
	
	// 일정 좋아요
	$(".like").on('click',function(){
		
		var check = $(this).attr('value');
		
		//게시글 ID
		var planID = $(this).parent().find('#planID').val();
		console.log(planID);
		
		// 좋아요 체크 후 추가
		if(check == 1){
			
			alert("좋아요 추가");
			
			alert("planID :" + planID)
			
			$(this).attr('value',0);
			// 좋아요 추가
			$.ajax({
				type : 'POST',
				url : '/like',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					planID : planID,
					memberID : memberID
				}),
				success : function(result) {
				}
			});
			
		}else{
			
			alert("좋아요 삭제");
			$(this).attr('value',1);
			// 좋아요 삭제
			$.ajax({
				type : 'POST',
				url : '/likeDelete',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					planID : planID,
					memberID : memberID
				}),
				success : function(result) {
				}
			});	
		}
	})
	
})