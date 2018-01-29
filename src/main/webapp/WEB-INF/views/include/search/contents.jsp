<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="offset-2" >
<div class="col-md-4 offset-0 listitem2" >
	<a href="/contents/${esContentsVO.category_id }/${esContentsVO.contents_id}">
		<img src="${esContentsVO.contents_thumbnail}"/>
	</a>
</div>
<div class="col-md-8 offset-0" style="border:1px solid #e6e6e6" >
	<div class="itemlabel4" style="height:208px;">
		<div class="labelright">
			<span class=" green size18"><b>${esContentsVO.contents_review_cnt}</b></span><span class="green size14"> Review</span><br>
					
				<div class="progress-custom" style="position:relative;">	
					<div style="width:100%; height:100%; background-color:silver"></div>						
							<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${esContentsVO.contents_rating*20}%; position:absolute; top:0;"></div>
					<img src="/resources/images/star.png" style="position:absolute; top:0; width:100%"/>
				</div>
			
			<span class="size11 grey ">${esContentsVO.contents_rating} Stars</span><br><br>
			<span class="margtop20 green size18"><b>0</b></span><span class="green size14"> Plan</span><br>
			<span class="size11 grey">${esContentsVO.contents_scrap_cnt} Scrap</span><br><br>
			
			
				<c:choose>
					<%-- scrapIdList null값(비회원) 인경우 --%>
					<c:when test="${empty scrapIdList}">
						<form action="/scrap/${esContentsVO.contents_id}" method="POST">
							<button class="scrapBtn" value="${esContentsVO.contents_id}" session="${empty userSession }" >스크랩</button>
						</form>
					</c:when>
					<%-- scrapIdList(회원) 있을경우 --%>
					<c:otherwise>
						<c:set var="doneLoop" value="false"/> 
						
						<%-- scrapIdList에 현재 컨텐츠id가 있는지 for문으로 확인. --%>
						<c:forEach items="${scrapIdList}" var = "scrapIdList" >	
							<c:if test="${not doneLoop}"> 
								<%-- scrapIdList에 해당 id가 있으면 doneLoop값 변경하고 스크랩 on --%>
								<c:if test="${scrapIdList == esContentsVO.contents_id}">
									<c:set var="doneLoop" value="true"/>
									<form action="/scrapDelete/${esContentsVO.contents_id}" method="POST">
										<button class="scrapBtn-on" value="${esContentsVO.contents_id}" session="${empty userSession }" >스크랩</button>
									</form>
								</c:if>			
							</c:if>
						</c:forEach>
						
						<%-- scrapIdList에 현재 컨텐츠id가 없을경우 --%>
						<c:if test="${not doneLoop}"> 
							<form action="/scrap/${esContentsVO.contents_id}" method="POST">
								<button class="scrapBtn" value="${esContentsVO.contents_id}" session="${empty userSession }" >스크랩</button>
							</form>
						</c:if>
					</c:otherwise>	
				</c:choose>
				 				
			
		</div>
		<div class="labelleft">			
			
			<c:choose>
				<c:when test="${esContentsVO.category_id == 1 }" > <span class="size14 label label-warning">${esContentsVO.category_value_kor}</span></c:when>
				<c:when test="${esContentsVO.category_id == 2 }" > <span class="size14 label label-primary">${esContentsVO.category_value_kor}</span></c:when>
				<c:otherwise> <span class="size14 label label-default"> ${esContentsVO.category_value_kor}</span></c:otherwise>
			</c:choose>
			<span class="size18">	
				<a href="/contents/${esContentsVO.category_id}/${esContentsVO.contents_id}">
					&nbsp;<b>${esContentsVO.contents_title} </b>
				</a>
			</span><br>
			<span class="margtop10 size12 grey glyphicon glyphicon-map-marker"></span><span class="grey size12"> ${esContentsVO.contents_location} </span> 
			<div class="line4 wh80percent"></div>
			<span class="opensans size14 grey">
				
			<c:forEach var="keyword" items="${esContentsVO.contents_keyword}">
		     	<span style="display:inline-block; border-radius:15px; border:1px solid #ddd; padding:5px 10px; margin:5px 2px">
		     		<b># </b> ${keyword}
		     	</span>
				     
			</c:forEach>
	
			</span> 
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<div class="offset-2" style="padding-top:30px"></div>

