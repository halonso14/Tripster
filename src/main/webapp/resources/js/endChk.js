function mouseover( $button){
	var planID = $button.val();
		
			if ($button.hasClass('following')) {
				$button.addClass('unfollow');
				$button.text('미완료');
				$button.unbind('mouseleave').bind('mouseleave', function() {
					$button.removeClass('unfollow');
					$button.text('완료');
				});
				$button.unbind('click').bind('click', function() {
					//빨간색 -> 흰색
					$button.removeClass('unfollow');
					$button.removeClass('following');
					$button.text('미완료');
					$.post('/plan/endchk/' +planID);
					$button.unbind('mouseleave').bind('mouseleave', function() {
						$button.text('미완료');
					});
				});
			} else{
				$button.unbind('mouseleave').bind('mouseleave', function() {
				});
				$button.unbind('click').bind('click', function() {
					$.post('/plan/endchk/' +planID);
					$button.addClass('following');
					$button.text('완료');
				});
			}
}