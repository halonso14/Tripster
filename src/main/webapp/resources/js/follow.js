// The rel attribute is the userID you would want to follow
$(document).ready(function() {

	$('button.followButton').on('click', function(e) {
		e.preventDefault();
		$button = $(this);
		
		var followID = $button.val();
		
		if ($button.hasClass('following')) {

			$.post('/memberFollowDelete/' + followID);

			$button.removeClass('following');
			$button.removeClass('unfollow');
			$button.text('팔로우');
		} else {

			$.post('/memberFollow/' + followID);

			$button.addClass('following');
			$button.text('팔로잉');
		}
	});

	$('button.followButton').hover(function() {
		$button = $(this);
		if ($button.hasClass('following')) {
			$button.addClass('unfollow');
			$button.text('팔로우 취소');
		}
	}, function() {
		if ($button.hasClass('following')) {
			$button.removeClass('unfollow');
			$button.text('팔로잉');
		}
	});
});