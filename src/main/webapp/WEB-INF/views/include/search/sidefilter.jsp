<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- FILTERS -->
<div class="col-md-3 filters offset-0">
	<c:set var="cnt" value="${fn:split(cri.cnt, '-')}"/>						
	<!-- TOP TIP -->
	<div class="offset-2">	
		<div class="tab">
			<form:form commandName="cri" action="result" method="GET">	
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="cnt" value="${cri.cnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'total' }">active</c:if>" name="tab" value ="total" type="submit">
					<span class="hidetext">통합검색</span>&nbsp; <span class="badge indent0" >${cnt[0]}</span>
				</button>
			</form:form>	
			<form:form commandName="cri" action="contents" method="GET">
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="cnt" value="${cri.cnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'contents' }">active</c:if>" name="tab" value ="contents" type="submit">
					<span class="hidetext">컨텐츠</span>&nbsp; <span class="badge indent0">${cnt[1]}</span>
				</button>
			</form:form>	
			<form:form commandName="cri" action="plan" method="GET">
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="cnt" value="${cri.cnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'plan' }">active</c:if>" name="tab" value ="plan" type="submit">
					<span class="hidetext">일정</span>&nbsp; <span class="badge indent0">${cnt[2]}</span>
				</button>			
			</form:form>	
			<form:form commandName="cri" action="member" method="GET">
				<input type="hidden" name="keyword" value="${cri.keyword}"/>
				<input type="hidden" name="cnt" value="${cri.cnt}"/>
				<button class="tablinks <c:if test="${cri.tab == 'member' }">active</c:if>" name="tab" value ="member" type="submit">
					<span class="hidetext">회원</span>&nbsp; <span class="badge indent0">${cnt[3]}</span>
				</button>
			</form:form>	
		</div>		
	</div>	

<!-- 	<div class="padding20title"><h3 class="opensans dark">Filter by</h3></div>
	<div class="line2"></div> -->
 	
</div>

