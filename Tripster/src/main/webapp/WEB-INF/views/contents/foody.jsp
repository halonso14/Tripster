<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>

</head>
<body>

	<h1>restaurent page</h1>

		<input type="hidden" name="Restaurant_ID" id="id" value= ${contentsVO.ID } />
		<!-- 스크랩 버튼 -->
		<button id="scrapBttn" value=${tf } >스크랩</button>
		<div id="test">
		
		</div>
		<script>
			$(document).ready(function(){
				var val = $('#scrapBttn').val();
				$('#test').html(val);
			});
		</script>

	<span>ContentsID : ${contentsVO.ID }</span><br>
	<span>ContentsTitle : ${contentsVO.title}</span>
	
	<script>
		$(document).ready(function (){
						
			var scrapbt = $("#scrapBttn");
			// contents id 값 저장
			var id = $('#id').val();
			
			// 스크랩 버튼 클릭시
			scrapbt.on('click',function(){
				alert(scrapbt.val());
				// 스크랩 아이디 확인 작업!!
				if(scrapbt.val()==1){
					scrapbt.attr('value',"0");
					alert(scrapbt.val());
					// 스크랩 추가 ajax
					/* $.post('/scrap/'+id,function(result){
							alert(result);
					}); */
				}else{
					scrapbt.attr('value',"1");
					alert(scrapbt.val());
					// 스크랩 제거 ajax
					/* $.post('/scrapremove/'+id,function(result){
							alert(result);
					}); */
				};
			});
			
		});
	</script>
	
</body>
</html>
