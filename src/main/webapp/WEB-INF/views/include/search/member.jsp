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
			
			
			<c:choose>
				<%-- followIdList null값(비회원) 인경우 --%>
				<c:when test="${empty followIdList}">
					<button class="scrapBtn" value="${esMemberVO.member_id}" session="${empty userSession }" >팔로우</button>
				</c:when>
				<%-- followIdList(회원) 있을경우 --%>
				<c:otherwise>
					<c:set var="doneLoop" value="false"/> 
					
					<%-- followIdList에 현재 유저id가 있는지 for문으로 확인. --%>
					<c:forEach items="${followIdList}" var = "followIdList" >	
						<c:if test="${not doneLoop}"> 
							<%-- scrapList에 해당 id가 있으면 doneLoop값 변경하고 스크랩 on --%>
							<c:if test="${followIdList == esMemberVO.member_id}">
								<c:set var="doneLoop" value="true"/>
								<button class="scrapBtn-on" value="${esMemberVO.member_id}" session="${empty userSession }" >팔로우</button>
							</c:if>			
						</c:if>
					</c:forEach>
					
					<%-- followIdList에 현재 유저id가 없을경우 --%>
					<c:if test="${not doneLoop}"> 
						<button class="scrapBtn" value="${esMemberVO.member_id}" session="${empty userSession }" >팔로우</button>
					</c:if>
				</c:otherwise>	
			</c:choose>			
			

			<div class="clearfix"></div>
		</div>
		<div style="padding-top:20px"></div>
		<div class="clearfix"></div>
	</div>
	<!-- END OF CONTAINER-->
</div>