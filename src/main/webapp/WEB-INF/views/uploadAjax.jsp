<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fileDrop{
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<body>

<h1>Ajax upload</h1>

<div class="fileDrop">
</div>

<div class="uploadedList">
</div>

<script>
	
	// 파일을 끌어올때 
	$('.fileDrop').on("dragenter dragover",function(event){
		event.preventDefault();
	});
	
	// 파일을 박스안에 놓을때 	
	$('.fileDrop').on("drop",function(event){
		
		event.preventDefault();
		console.log('drag');
		// 박스안에 놓인 파일 가져오기
		var files = event.originalEvent.dataTransfer.files;
		// 가져온 파일을 저장
		var file = files[0];
		// 파일 데이터 보기
		console.log("fileData"+file);
		// formDate 객체 생성
		var formData = new FormData();
		// formData 객체에 파일 데이터 저장
		formData.append("file",file);
		// ajax로 컨트롤러에 데이터 전송
		$.ajax({
			url:"/uploadAjax",
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			// 데이터를 보낸 후 
			success: function(data){
				var str = "";
				// 생성된 파일의 이름 포맷 검사
				if(checkImageType(data)){
					// 이미지 파일일 경우 썸네일 생성
					str = "<li>"
						// 원본 파일 링크
						+ "<a href='/displayFile?fileName="+ getImageLink(data)+"'>"
						+ "<img src='/displayFile?fileName="+data+"'/>"
						+ getOriginalName(data) +"</a>" 
						+ "<small fileName="+data+">X</small></li>";
				}else{
					// 이미지 파일이 아닐경우 다운로드
					str = "<li><a href='displayFile?fileName="+data+"'>" + getOriginalName(data) 
						 +"</a><small fileName="+data+">X</small></li>";
				}
				
				$('.fileDrop').append(str);
				
			}
		});
	
		// 확장자 체크
		function checkImageType(fileName){
			
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
		function getImageLink(fileName){
			console.log(fileName);
			// /년/월/일 추출
			var front = fileName.substr(0,12);
			// s_ 제거한 원본 이름
			var end = fileName.substr(14);
			
			console.log(front+end);
			// 원본이름 리턴
			return front + end;
		}
	});
	
	// 삭제 버튼 누를 경우
	$('.uploadedList').on('click','small',function(event){
		var that = $(this);
		// 파일 이름 저장
		var filename = that.attr('fileName');
		// 포스트 방식으로 데이터 전달
		$.post('deleteFile',{fileName:filename},function(result){
			that.parent("div").remove();
		});
		
	});
	
</script>

</body>
</html>