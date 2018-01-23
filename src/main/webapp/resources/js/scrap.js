
// 스크랩 체크
function ScrapModuleChk(contentsID,scrapbt){
	
	$.ajax({
		type : 'post',
		url : '/scrapCheck/'+contentsID,
		async: false,
		success : function(check){
			scrapbt.attr('check',check);
		}
	});
	
}

// <button class="bookbtn mt1 scrap" value="컨텐츠 아이디" check="1" session="${empty userSession }" >스크랩</button>
//스크랩 버튼 클릭시
$(".scrap").on('click',function(){
	
	var scrapbt = $(this);
	var contentsID = scrapbt.val();
	console.log("click");
	
	// 세션 체크
	if(scrapbt.attr("session") == "true"){
		
		alert("로그인 해주세요");
		
	}else{
		
		// 스크랩 체크
		ScrapModuleChk(contentsID,scrapbt);
		
		if(scrapbt.attr('check') == 1){
			
			scrapbt.attr('check',0);
			$.post("/scrap/"+contentsID,function(data){
				console.log(data);
			})
			
		}else{
			
			scrapbt.attr('check',1);
			$.post("/scrapDelete/"+contentsID,function(data){
				console.log(data);
			})
			
		}
		
	}
});