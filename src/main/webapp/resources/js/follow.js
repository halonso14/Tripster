// The rel attribute is the userID you would want to follow
$(document).ready(function() {
	// follow 체크 함수
	function followCheck(followID, $button) {

		$.ajax({
			type : 'post',
			url : '/followCheck/' + followID,
			async : false,
			success : function(check) {
				alert("팔로우 체크 변경" + check);
				followBtn.attr('followBtnCheck', check);
			}
		});

	}

	$('button.followButton').on('click', function(e) {
		e.preventDefault();
		$button = $(this);
		
		var followID = $button.val();
		
		if ($button.hasClass('following')) {

			$.post('/memberFollowDelete/' + followID, function(result) {
				alert(result);
			});

			$button.removeClass('following');
			$button.removeClass('unfollow');
			$button.text('Follow');
		} else {

			$.post('/memberFollow/' + followID, function(result) {
				alert(result);
			});

			$button.addClass('following');
			$button.text('Following');
		}
	});

	$('button.followButton').hover(function() {
		$button = $(this);
		if ($button.hasClass('following')) {
			$button.addClass('unfollow');
			$button.text('Unfollow');
		}
	}, function() {
		if ($button.hasClass('following')) {
			$button.removeClass('unfollow');
			$button.text('Following');
		}
	});
});