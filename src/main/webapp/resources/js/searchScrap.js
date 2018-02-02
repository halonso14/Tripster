function mouseover(memberID, $button){
	
	var contentsID = $button.val();
	//로그인을 하지 않은 경우
	if(memberID == ""){
		$button.unbind('click').bind('click', function() {
			
			alert("로그인이 필요한 기능입니다.");
			
		});
	} else {
		if ($button.hasClass('scraped')) {
				
				$button.addClass('unscrap');
				$button.text('스크랩 취소');
				$button.unbind('mouseleave').bind('mouseleave', function() {
					$button.removeClass('unscrap');
					$button.text('스크랩');
				});
				$button.unbind('click').bind('click', function() {
					//빨간색 -> 흰색
					$button.removeClass('unscrap');
					$button.removeClass('scraped');
					$button.text('스크랩');
					$.post("/scrapDelete/"+contentsID,function(scrapCnt){
						console.log(scrapCnt);
						$("#"+contentsID).html(scrapCnt);
						alert("스크랩 취소");
					});
				});
			} else{
				$button.unbind('click').bind('mouseleave', function() {
				});
				$button.unbind('click').bind('click', function() {
					
					$.post("/scrap/"+contentsID,function(scrapCnt){
						console.log(scrapCnt);
						$("#"+contentsID).html(scrapCnt);
						alert("스크랩");
					});
					$button.addClass('scraped');
					$button.text('스크랩');
				});
			}
		}
}
