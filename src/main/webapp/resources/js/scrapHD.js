	//스크랩 버튼 클릭시
	function mouseclick(session, $button) {
		var contentsID = $button.val();
		
		// 세션 체크
		if(session == ""){
			alert("로그인이 필요한 기능입니다.");
		} else{
			if($button.hasClass('scraped')){
				$.post("/scrapDelete/"+contentsID,function(data){
					console.log(data);
				});
				$button.removeClass('scraped');
				$button.removeClass('unscrap');
				$button.text('스크랩');
				
			}else{
				$.post('/scrap/' + contentsID, function(result) {
				});
				$button.addClass('scraped');
				$button.text('스크랩');
			}
		}
	};
	
	function mouseover(session, $button){
		var contentsID = $button.val();
		//처음 버튼이 아래 버튼인 경우
		if($button.hasClass('scraped')) {
			//초록색에서 시작
			if ($button.hasClass('scraped')) {
				//초록색 -> 빨간색
				$button.addClass('unscrap');
				$button.text('스크랩 취소');
				//스크랩 취소
				$button.on('click', function() {
					//빨간색 -> 흰색
					$button.removeClass('unscrap');
					$button.removeClass('scraped');
					$button.text('스크랩');
					$.post("/scrapDelete/"+contentsID);
				});
			} else {
			//흰색에서 시작(한 번 이상의 클릭이 발생)
				$button.on('click', function() {
					//흰색 -> 초록색
					$button.addClass('scraped');
					//스크랩
					$.post('/scrap/' + contentsID);
				});
			}
		} else {
		//처음 버튼이 아래 버튼인 경우
				//로그인하지 않은 경우
				if(session == ""){
					alert("로그인이 필요한 기능입니다.");
				} else{
				//로그인 한 경우
					//스크랩이 되어 있는 경우(한 번 이상의 클릭이 발생)
					//초록색에서 시작
					if($button.hasClass('scraped')){
						//빨간색
						$button.addClass('unscrap');
						$button.text('스크랩 취소');
						//스크랩 취소
						$button.on('click', function() {
							//흰색
							$button.removeClass('scraped');
							$button.removeClass('unscrap');
							$button.text('스크랩');
							$.post("/scrapDelete/"+contentsID);
						});
					} else{
					//스크랩이 되어 있지 않은 경우	
					//흰색에서 시작
						//스크랩하기
						$button.on('click', function() {
							//초록색
							$button.addClass('scraped');
							$button.text('스크랩');
							$.post('/scrap/' + contentsID);
						});
					}
				//로그인한 경우, else 종료
				}
			//처음 버튼이 아래 버튼인 경우 종료	
			}
	}
	
	function mouseout($button){
		var contentsID = $button.val();
		$button.removeClass('unscrap');
		$button.text('스크랩 ');
	};
		
