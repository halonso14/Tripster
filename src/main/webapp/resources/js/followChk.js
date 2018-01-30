function followover( $button){
	var followID = $button.val();
		
			if ($button.hasClass('following')) {
				$button.addClass('unfollow');
				$button.text('팔로우 취소');
				$button.unbind('mouseleave').bind('mouseleave', function() {
					$button.removeClass('unfollow');
					$button.text('팔로잉');
				});
				$button.unbind('click').bind('click', function() {
					//빨간색 -> 흰색
					$button.removeClass('unfollow');
					$button.removeClass('following');
					$button.text('팔로우');
					$.post('/memberFollowDelete/' +followID);
					$button.unbind('mouseleave').bind('mouseleave', function() {
						$button.text('팔로우');
					});
				});
			} else{
				$button.unbind('mouseleave').bind('mouseleave', function() {
				});
				$button.unbind('click').bind('click', function() {
					$.post('/memberFollow/' +followID);
					$button.addClass('following');
					$button.text('팔로잉');
				});
			}
}