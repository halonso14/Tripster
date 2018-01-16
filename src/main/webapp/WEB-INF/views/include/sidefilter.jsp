<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div class="col-md-3 filters offset-0">
		<ul class="list-group offset-2 margtop30">
				
			<a href="result?keyword=${cri.keyword }&go=total" class="list-group-item total" id="total">
			<span class="hidetext">통합검색</span>&nbsp; 
			<span class="badge indent0" >${getNum.get("totalNum") }</span></a>
		
			<a href="result?keyword=${cri.keyword }&go=contents" class="list-group-item contents">
			<span class="hidetext">컨텐츠</span>&nbsp;
			<span class="badge indent0">${getNum.get("contentsNum") }</span></a>
		
			<a href="result?keyword=${cri.keyword }&go=plan" class="list-group-item plan" >
			<span class="hidetext">일정</span>&nbsp; 
			<span class="badge indent0">${getNum.get("planNum") }</span></a>
		
			<a href="result?keyword=${cri.keyword }&go=member" class="list-group-item member" >
			<span class="hidetext">회원</span>&nbsp; 
			<span class="badge indent0">${getNum.get("memberNum") }</span></a>
			
		</ul>			
	</div>
	
	<script>
		
		check();
		
	
		function check(){
			
			var test = "${go }";
			
			if(test == "total" || test == ""){
				
				$("ul a.total").css("color","orange");
				$("ul a.total").attr("class","list-group-item total bold");
				
			}else if(test == "contents"){
				
				$("ul a.contents").css("color","orange");
				$("ul a.contents").attr("class","list-group-item total bold");
				
			}else if(test == "plan"){
				
				$("ul a.plan").css("color","orange");
				$("ul a.plan").attr("class","list-group-item total bold");
				
			}else{
				
				$("ul a.member").css("color","orange");
				$("ul a.member").attr("class","list-group-item total bold");
				
			}
			
		}
	</script>
	