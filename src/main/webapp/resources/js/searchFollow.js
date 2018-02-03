function followmouseover(memberID, $button){
	
	var contentsID = $button.val();
	//로그인을 하지 않은 경우
	if(memberID == ""){
		$button.unbind('click').bind('click', function() {
			console.log("click");
			alert("로그인이 필요한 기능입니다.");
			
		});
	} else {
		if ($button.hasClass('following')) {
				
				$button.addClass('unfollow');
				$button.text('팔로우 취소');
				$button.unbind('mouseleave').bind('mouseleave', function() {
					$button.removeClass('unfollow');
					$button.text('팔로우');
				});
				$button.unbind('click').bind('click', function() {
					//빨간색 -> 흰색
					$button.removeClass('unfollow');
					$button.removeClass('following');
					$button.text('팔로우');
					$.post("/memberFollowDelete/"+contentsID,function(data){
						
						alert("팔로우 취소");
					});
				});
			} else{
				$button.unbind('click').bind('mouseleave', function() {
				});
				$button.unbind('click').bind('click', function() {
					
					$.post("/memberFollow/"+contentsID,function(data){
						
						alert("팔로우");
					});
					$button.addClass('following');
					$button.text('팔로우');
				});
			}
		}
}