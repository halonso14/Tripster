<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="col-md-4" style="margin-bottom:40px">
	<!-- CONTAINER-->
	<div class="carscontainer" style="border:1px solid #e6e6e6">
		<div class="center">
			<a href=""><img src="/resources/updates/update1/img/cars/car04.jpg"/></a>
		</div>
								
		<div class="purchasecontainer"  >
			<div class="offset-2 left bold" style="padding-top:5px">${esMemberVO.member_name}</div>		
			
			<button class="followButton" value="${esMemberVO.member_id}" session="${empty userSession }" check="1">팔로우</button>	
			
			<script>
				var followbtn = $("button[value="+${esMemberVO.member_id}+"]");
				if(!followbtn.attr("session") == false){
					let followIdList = ${followIdList};
					for(let i=0;i<followIdList.length;i++){
						if(followbtn.val() == followIdList[i]){
							followbtn.attr("check",0);
							// 스크랩 했을때
							followbtn.css("color","red");
						}
					};
				};
			</script>

			<div class="clearfix"></div>
		</div>
		<div style="padding-top:20px"></div>
		<div class="clearfix"></div>
	</div>
	<!-- END OF CONTAINER-->
</div>