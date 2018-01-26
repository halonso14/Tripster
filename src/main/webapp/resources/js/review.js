// 리뷰 리스트 조회
function getReviewList(reviewPage, memberID, contentsID) {
	$.getJSON("/contents/review/"+ contentsID+ "/"+ reviewPage, function(data) {
		var userID = memberID;
		var str = "";
		//날짜 형태를 02-01와 같은 형태를 위한 함수.
		Number.prototype.padLeft = function(base, chr) {
			var len = (String(base || 10).length - String(this).length) + 1;
			return len > 0 ? new Array(len).join(chr|| '0')+ this: this;
		}
		// usage
		//=> 3..padLeft() => '03'
		//=> 3..padLeft(100,'-') => '--3'
		
		// 컨텐츠의 리뷰 리스트 받아오기
		$(data.list).each(function(userID) {
			var d = new Date(this.updatedDate);
			var dformat = [d.getFullYear(),(d.getMonth() + 1).padLeft(), ].join('/')+ ' '+ [d.getHours().padLeft(),d.getMinutes().padLeft(),d.getSeconds().padLeft() ].join(':');
			var writerID =  this.memberID;
			
			str += "<div class='col-md-4 offset-0 center' data-contentsReviewID='"+this.contentsReviewID+"'>"
				+ "		<div class='padding20'>"
				+ "			<div class='bordertype5'>"
				+ "				<div class='circlewrap'>"
				+ "					<img src='/resources/images/user-avatar.jpg' class='circleimg' alt=''/><span>"
				+ this.contentsReviewRating
				+ "</span>"
				+ "				</div>"
				+ "				<span class='dark'>"
				+ this.memberName
				+ "</span><br/>"
				+ "				<img src='/resources/images/check.png' alt=''/><br/>"
				+ "				<span class='green'>Recommended<br/>for Everyone</span>"
				+ "			</div>"
				+ "		</div>"
				+ "	</div>"
				+ "	<div class='col-md-8 offset-0'>"
				+ "		<div class='padding20'>"
				+ "			<span class='opensans size16 dark'>"
				+ this.contentsReviewTitle
				+ "</span><br/>"
				+ "			<span class='opensans size13 lgrey'>"
				+ dformat
				+ "</span><br/>"
				+ "			<p data-contentsReviewID='"+this.contentsReviewID+"' class='"+this.contentsReviewID+"'>"
				+ this.contentsReview
				+ "</p>"
				+ " 			<div id='getImage'>"+getImage(this.reviewPictureName)+"</div>" 
				+ "		</div>"
				+ "	</div>";
			
			if(userID == writerID) {
				createReviewBtn(str, this.contentsReviewID);
			} else {
				str += "<div class='clearfix'></div>"
					+  "<div class='line3'></div>";
			}
		});
		
		// reviewList 에 추가
		$("#reviewList").html(str);
		// 초기화 후 업로드박스안의 파일 제거
		$('.uploadList').html("");
		// 초기화후 업로드 박스 제거
		$('.uploadList').removeAttr('style');
		// 리뷰 등록시 업로드했던 파일 이름 제거
		fileNames = new Array;
		// 페이징 처리
		printPaging(data.pageMaker);
	});
};

//리뷰 버튼 생성
function createReviewBtn(str, contentsReviewID){
	str += " <div>"
		+  "		<button class='btn-search4 right modify' id='"+contentsReviewID+"' onclick='modifyReview(memberID, contentsID)'>Modify</button>"
		+  "     <button class='btn-search4 right delete' id='"+contentsReviewID+"'>delete</button>"
		+  "		<div class='clearfix'></div>"
		+  "</div>"
		+ "<div class='line3'></div>";
}

//리뷰 등록
//function writeReview(contentsID, memberID, reviewPictureName) {
//		var memberName = $("#reviewDetail").attr("writer");
//		var contentsReviewTitle = $("#reviewTitle").val();
//		var contentsReview = $("#reviewDetail").val();
//		var contentsReviewRating =  $(':input:checkbox[name="rating"]:checked').val();
//		alert(typeof reviewPictureName);
//		
//		$.ajax({
//			type : 'POST',
//			url : 'http://localhost:10000/contents/contentsDetail/'+ contentsID,
//			contentType : "application/json",
//			dataType : 'text',
//			data : JSON.stringify({
//				contentsID : contentsID,
//				memberID : memberID,
//				memberName : memberName,
//				contentsReviewTitle : contentsReviewTitle,
//				contentsReview : contentsReview,
//				contentsReviewRating : contentsReviewRating,
//				reviewPictureName : reviewPictureName
//			}),
//			success : function(data) {
//				// 리뷰 등록후 처음 1 페이지로 이동
//				//getReviewList(1, memberID, contentsID);
//				alert("review posted");
//			}
//		});
//		//등록 후 리뷰 텍스트 내용 초기화
//		$("#reviewTitle").val("리뷰 제목을 입력해주세요");
//		$("#reviewDetail").val(""));
//		// 리뷰 페이지 숫자 버튼 눌렀을때
//		$("#reviewPaging").on("click", "a") {
//			var tmp = $(this).attr("href");
//			getReviewList(tmp, memberID, contentsID);
//		});
//}

//리뷰 수정
function modifyReview(memberID, contentesID, $button) {
	$('#reviewList').on('click','.modify',function() {
		// 리뷰 아이디
		var contentsReviewID = $(this).attr('id');
		if (this.value == 1) {
			// 수정 텍스트 출력
			$(this).attr('value', 0);
			var str = "<textarea id='textarea' cols=" + 30 + "rows=" + 10 + "></textarea>";
			$('.'+ contentsReviewID).html(str);
		} else {
			// 수정 내용 저장
			var modify = $('#textarea').val();
			$(this).attr('value', 1);
			// 수정 내용 전달
			$.ajax({
				type : 'put',
				url : '/contents/contentsDetail/'+ contentsID+ '/'+ contentsReviewID,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT",
				},
				dataType : 'text',
				data : JSON.stringify({
					contentsID : contentsID,
					memberID : memberID,
					contentsReview : modify
				}),
				success : function(result) {
					getReviewList(1, memberID, contentsID);
				}
			});
		}
	});
}

// 리뷰 삭제
function deleteReview(contentsID, $button) {
	$('#reviewList').on('click','.delete',function() {
		alert('click');
		// 리뷰 아이디
		var contentsReviewID = $(this).attr('id');
		$.ajax({
			type : 'delete',
			url : '/contents/contentsDetail/'+ contentsID+ '/'+ contentsReviewID,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE",
			},
			dataType : 'text',
			success : function(result) {
				// 리뷰 등록후 처음 1 페이지로 이동
				getReviewList(1, memberID, contentsID);
			}
		});
	});
}

//페이징 처리
function printPaging(pageMaker) {
	var str = "";
	if (pageMaker.prev) {
		str += "<li><a href='"
				+ (pageMaker.startPage - 1)
				+ "'> << </a></li>";
	}
	for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		var strClass = pageMaker.cri.curPage == i ? 'class=active'
				: '';
		str += "<li " +strClass+"><a href='"+i+"'>"
				+ i + "</a></li>";
	}
	if (pageMaker.next) {
		str += "<li><a href='"
				+ (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}
	$("#reviewPaging").html(str);
}

//리뷰 아이디를 받아 이미지 생성 
function getImage(reviewPictureName) {
	var fileList = new Array;
	var str = "";
	fileList = reviewPictureName;
	// 받은 파일 이름들로 이미지 추가
	for (var i = 0; i < fileList.length; i++) {
		// 확장자 검사
		if (checkImageType(fileList[i])) {
			// 이미지 파일일 경우 썸네일 생성
			str = str
					+ "<li>"
					// 원본 파일 링크
					+ "<a href='/displayFile?fileName="
					+ getImageLink(fileList[i])
					+ "'>"
					// 썸네일 생성
					+ "<img src='/displayFile?fileName="
					+ fileList[i]
					+ "'/>"
					+ getOriginalName(fileList[i])
					+ "</a></li>";
		} else {
			// 이미지 파일이 아닐경우 다운로드
			str = str
					+ "<li><a href='/displayFile?fileName="
					+ fileList[i]
					+ "'>"
					+ getOriginalName(fileList[i])
					+ "</a></li>";
		}
	}
	return str;
}

function getFileNames(data) {
	fileNames.push(data);
}



// 확장자 체크
function checkImageType(fileName) {
	var pattern = /jpg$|gif$|png$|jpeg$/i;
	// 이미지 확장자일 경우 true 리턴
	return fileName.match(pattern);
}

// UUID이름 지우기
function getOriginalName(fileName) {
	// 이미지 파일인 경우 _가 2번 들어감
	var idx = fileName.indexOf("_") + 1;
	var str = fileName.substr(idx);
	var idx2 = str.indexOf("_") + 1;
	return str.substr(idx2);
}

// 이미지 파일 링크 처리
function getImageLink(fileName) {
	// /년/월/일 추출
	var front = fileName.substr(0, 12);
	// s_ 제거한 원본 이름
	var end = fileName.substr(14);
	// 원본이름 리턴
	return front + end;
}