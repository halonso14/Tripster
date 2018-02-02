function likemouseover(memberID, $button){
	
	var planID = $button.val();
	//로그인을 하지 않은 경우
	if(memberID == ""){
		$button.unbind('click').bind('click', function() {
			alert("로그인이 필요한 기능입니다.");
		});
	} else {
		if ($button.hasClass('like')) {
				
				$button.addClass('unlike');
				$button.text('좋아요 취소');
				$button.unbind('mouseleave').bind('mouseleave', function() {
					$button.removeClass('unlike');
					$button.text('좋아요');
				});
				$button.unbind('click').bind('click', function() {
					//빨간색 -> 흰색
					$button.removeClass('unlike');
					$button.removeClass('like');
					$button.text('좋아요');
					$.post("/likeDelete/"+planID);
				});
			} else{
				$button.unbind('mouseleave').bind('mouseleave', function() {
				});
				$button.unbind('click').bind('click', function() {
					console.log("like");
					$.post("/like/"+planID);
					$button.addClass('like');
					$button.text('좋아요');
				});
			}
	}
}