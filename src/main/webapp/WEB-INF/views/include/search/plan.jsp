<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="col-md-4" style="margin-bottom:30px">
<div class="listitem ">
	<a href="/plan/read?planID=${esPlanVO.plan_id}">
		<img src="${esPlanVO.member_picture}" >
	</a>
</div>
<div class="itemlabel2">
	<div class="labelright" style="position:relative" >													
		<p class="member-profile" >
			<a href="/member/viewMember?memberID=${esPlanVO.member_id }"> 
				<img src="${esPlanVO.member_picture}" style="height:100%" >
			</a>
		</p>
		<p class="size12 grey ">${esPlanVO.member_name}</p><br>
		<span class="size11 grey">댓글수</span><br>
		<span class="size11 grey">${esPlanVO.plan_like_cnt} 좋아요수</span><br>
		<button class="btn likeButton" onmouseenter="mouseover('${userSession.memberID }',$(this))" value="${esPlanVO.plan_id}" style="width:75px;">좋아요</button>		
		
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
	<div class="labelleft">	
		<span class="size16"><b>${esPlanVO.plan_title}</b></span><br>		
<%-- 										<br>
										${esPlanVO.plan_startdate}<br>
										${esPlanVO.plan_enddate}<br>
										${esPlanVO.plan_endchk} --%>
		</div>
	</div>
	<div class="clearfix"></div>
</div>