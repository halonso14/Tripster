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
		<button class="bookbtn mt1" onclick="likeClick('${userSession}',$(this));" likeBtnCheck="${likeList[status.index] }" value="${esPlanVO.plan_id}">좋아요</button>		
		
			<c:choose>
				<%-- followIdList null값(비회원) 인경우 --%>
				<c:when test="${empty likeIdList}">
					<button class="scrapBtn" value="${esPlanVO.plan_id}" session="${empty userSession }" >좋아요</button>
				</c:when>
				<%-- followIdList(회원) 있을경우 --%>
				<c:otherwise>
					<c:set var="doneLoop" value="false"/> 
					
					<%-- followIdList에 현재 유저id가 있는지 for문으로 확인. --%>
					<c:forEach items="${likeIdList}" var = "likeIdList" >	
						<c:if test="${not doneLoop}"> 
							<%-- scrapList에 해당 id가 있으면 doneLoop값 변경하고 스크랩 on --%>
							<c:if test="${likeIdList == esMemberVO.member_id}">
								<c:set var="doneLoop" value="true"/>
								<button class="scrapBtn-on" value="$${esPlanVO.plan_id}" session="${empty userSession }" >좋아요</button>
							</c:if>			
						</c:if>
					</c:forEach>
					
					<%-- followIdList에 현재 유저id가 없을경우 --%>
					<c:if test="${not doneLoop}"> 
						<button class="scrapBtn" value="${esPlanVO.plan_id}" session="${empty userSession }" >좋아요</button>
					</c:if>
				</c:otherwise>	
			</c:choose>			
		
		
		
		
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