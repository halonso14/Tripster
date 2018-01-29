function mouseover( $button){
	var planID = $button.val();
	//처음 버튼이 아래 버튼인 경우
	if($button.hasClass('following')) {
		//초록색에서 시작
		if ($button.hasClass('following')) {
			//초록색 -> 빨간색
			$button.addClass('unfollow');
			$button.text('미완료');
			//스크랩 취소
			$button.on('click', function() {
				//빨간색 -> 흰색
				$button.removeClass('unfollow');
				$button.removeClass('following');
				$button.text('미완료');
				console.log("*");
				$.post('/plan/endchk/' +planID);
			});
		} else {
		//흰색에서 시작(한 번 이상의 클릭이 발생)
			$button.on('click', function() {
				console.log("*");
				//흰색 -> 초록색
				$button.addClass('following');
				//스크랩
				$.post('/plan/endchk/' +planID);
			});
		}
	} else {
	//처음 버튼이 아래 버튼인 경우
		//로그인 한 경우
			//스크랩이 되어 있는 경우(한 번 이상의 클릭이 발생)
			//초록색에서 시작
			if($button.hasClass('following')){
				//초록색 -> 빨간색
				$button.addClass('unfollow');
				$button.text('미완료');
				//스크랩 취소
				$button.on('click', function() {
					console.log("*");
					//빨간색 -> 흰색
					$button.removeClass('following');
					$button.removeClass('unfollow');
					$button.text('미완료');
					$.post('/plan/endchk/' +planID);
				});
			} else{
			//스크랩이 되어 있지 않은 경우	
			//흰색에서 시작
				//스크랩하기
				$button.on('click', function() {
					//흰색 -> 초록색
					$button.addClass('following');
					$button.text('완료');
					$.post('/plan/endchk/' + planID);
				});
			}
		//로그인한 경우, else 종료
		}
	//처음 버튼이 아래 버튼인 경우 종료	
}
	
function mouseout($button){
	if($button.hasClass('unfollow')){
		var planID = $button.val();
		$button.removeClass('unfollow');
		$button.text('완료 ');
	}
};




//
//
//
//
//
//
//
//
//
//
////=================================//
//function planChkToggle(event){
//		
//		var planID = event.val();
//		console.log(planID);
//		
//		if (event.hasClass('following')) {
//
//			$.post('/plan/endchk/' +planID, function(result) {
//				alert("미완료처리 되었습니다.")
//				event.removeClass('unfollow');
//			});
//
//			event.removeClass('following');
//			event.text('미완료');
//		} else {
//
//			$.post('/plan/endchk/' + planID, function(result) {
//					alert("완료처리 되었습니다.");
//			});
//
//			event.addClass('following');
//			event.text('완료');
//		}
//	}
//
////	$('button.followButton').on('click', function(e) {
////		e.preventDefault();
////		$button = $(this);
////		
////		var planID = $button.val();
////		
////		//완료 -> 미완료
////		if ($button.hasClass('following')) {
////
////			$.post('/plan/endchk/' +planID, function(result) {
////				alert(result);
////			});
////
////			$button.removeClass('following');
////			$button.removeClass('unfollow');
////			$button.text('미완료');
////		} else {
////
////			$.post('/plan/endchk' + planID, function(result) {
////				alert(result);
////			});
////
////			$button.addClass('following');
////			$button.text('완료');
////		}
////	});
//
//	function buttonOver(event){
//		if (event.hasClass('following')) {
//			event.addClass('unfollow');
//			event.text('미완료');
//		} else {
//			if (event.hasClass('following')) {
//				event.addClass('unfollow');
//				event.text('미완료');
//			}
//		}
//	}
//	
//	function buttonOut(event){
//		console.log(event);
//		if(event.hasClass('following')){
//			event.removeClass('unfollow');
//			event.text('완료');
//		} else {
//			if(event.hasClass('following')){
//				event.removeClass('unfollow');
//				event.text('완료');
//			}
//		}
//	}
////	$('button.followButton').hover(function() {
////		$button = $(this);
////		if ($button.hasClass('following')) {
////			$button.addClass('unfollow');
////			$button.text('미완료');
////		}
////	}, function() {
////		if ($button.hasClass('following')) {
////			$button.removeClass('unfollow');
////			$button.text('완료');
////		}
////	});
////});