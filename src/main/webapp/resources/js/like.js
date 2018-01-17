$(document).ready(function(){
	
	// 팔로우 당한사람
	var followID = $('#followID').val();
	// 접속중인 유저
	var memberID = $('#memberID').val();
	// 게시글 ID
	var planID = $('#planID').val();
	
	// 유저 좋아요 기능
	$('#follow').on('click',function(){

		var followcheck = $('#follow');
		alert(followcheck.val());
		
		if(followcheck.val() == 1){
			
			alert('follow 추가');
			followcheck.attr('value',0);
			
			 $.post('/memberFollow/'+memberID+'/'+user,function(result){
				alert(result);
			});
			
		}else{
			
			alert('follow 취소')
			followcheck.attr('value',1);
			$.post('/memberFollowDelete/'+memberID+'/'+user,function(result){
				alert(result);
			});

		}

	});
	
	// 게시글 좋아요
	$('#like').on('click',function(){
	
		var check = $('#like');
		
		// 좋아요 체크 후 추가
		if(check.val() == 1){
			
			alert("좋아요 추가");
			
			check.attr('value',0);
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
					alert(result);
				}
			});
			
		}else{
			
			alert("좋아요 삭제");
			check.attr('value',1);
			// 좋아요 삭제
			$.post('/likeDelete/'+planID,function(result){
				alert(result);
			})	
		}
	})

	// id="like" 인 속성의 value 값을 바꿈
	function likecheck(){
		
		$.post("likeCheck"+planID,function(data){
			
			$("#like").attr("value",data);
			
		})
		
	}
	
	// id="follow" 인 속성의 value 값을 바꿈
	function followcheck(){
		
		$.post("followCheck"+planID,function(data){
			
			$("#follow").attr("value",data);
			
		})
		
	}
	
	likecheck();
	
	followcheck();

})