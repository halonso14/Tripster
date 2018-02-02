<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="col-md-4 planList">
	<div class="listitem ">
		<a href="/plan/read?planID=${esPlanVO.plan_id}"><img src="${esPlanVO.memo_picture_name}" ></a>
	</div>

	<div class="itemlabel2 ">
	
		<div class="profile">
			<a href="/member/viewMember?memberID=${esPlanVO.member_id }" class="member-profile" style="background-image: url('${esPlanVO.member_picture}');"></a>				
			<span>
				<p class="profile-name"><b>${esPlanVO.member_name}</b></p>
				<p class="plan-status">댓글 0 / 좋아요 ${esPlanVO.plan_like_cnt} </p>
			</span>
			<div class="clearfix"></div>
		</div>
		<div class="plan-detail">
			<a class="plan-title"><b>${esPlanVO.plan_title}</b></a>
			<p>스크랩 컨텐츠제목 <br> 스크랩 컨텐츠제목 </p>
			<hr style="margin:3px 0;padding:0; color:#ddd">
			<button class="btn likeButton" onmouseenter="likemouseover('${userSession.memberID }',$(this))" value="${esPlanVO.plan_id}">좋아요</button>	
		</div>
	
		
		<script>
		
			var likebtn = $("button[value="+${esPlanVO.plan_id}+"]");
			var session = ${empty userSession };
			if(session != true){
				let likeIdList = ${likeIdList };
				for(let i=0;i<likeIdList.length;i++){
					if(likebtn.val() == likeIdList[i]){
						likebtn.addClass("like");
					};
				};
			};
			
		</script>
	</div>
	<div class="clearfix"></div>
</div>