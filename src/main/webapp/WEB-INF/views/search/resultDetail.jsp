<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- HEADER -->
	<%@include file="../include/header3.jsp" %>



	<div class="container">
		<div class="container pagecontainer offset-0" style="background:#f2f2f2">	
			
			<!-- LEFT: SIDE FILTERS -->
			<%@include file="../include/search/sidefilter.jsp" %>
			
			<!-- RIGHT: CONTENT BOX -->
			<div class="rightcontent col-md-9 offset-2" style="background:#fff">
				<c:if test="${cri.tab == 'contents'}">
					<c:if test="${contentsList.contentsCnt == 0}" >
						<!-- 검색결과가 없을경우 -->
						<span class="searchStatus ">'${cri.keyword}'에 대한 컨텐츠 검색결과가 없습니다.</span>
					</c:if>	
					
					<c:if test="${contentsList.contentsCnt > 0}" >	
						<!-- 검색결과가 있을경우 -->
						<span class="searchStatus">'${cri.keyword}' 검색결과</span>	
											
						<!-- 컨텐츠 검색결과 리스트 -->
						<c:forEach items="${contentsList.contentsList}" var = "esContentsVO" varStatus="status" begin="${(pageMaker.cri.page-1)*10}" end="${pageMaker.cri.page*10-1}"> 
							<%@include file="../include/search/contents.jsp" %>
						</c:forEach>	
						<div class="clearfix"></div>	
						<%@include file="../include/search/pagenation.jsp" %>
						<div class="clearfix"></div>	
						<div class="offset-2"><hr></div>													
					</c:if>
				</c:if>
				<c:if test="${cri.tab == 'plan'}">
					<c:if test="${planList.planCnt == 0}" >
						<!-- 검색결과가 없을경우 -->
						<span class="searchStatus ">'${cri.keyword}'에 대한 일정 검색결과가 없습니다.</span>
					</c:if>	
					
					<c:if test="${planList.planCnt > 0}" >	
						<!-- 검색결과가 있을경우 -->
						<span class="searchStatus">'${cri.keyword}' 검색결과</span>	
											
						<!-- 일정 검색결과 리스트 -->
						<c:forEach items="${planList.planList}" var = "esPlanVO" varStatus="status" begin="${(pageMaker.cri.page-1)*9}" end="${pageMaker.cri.page*9-1}"> 
							<%@include file="../include/search/plan.jsp" %>
						</c:forEach>
						<div class="clearfix"></div>	
						<%@include file="../include/search/pagenation.jsp" %>
						<div class="clearfix"></div>	
						<div class="offset-2"><hr></div>													
					</c:if>
				</c:if>
				<c:if test="${cri.tab == 'member'}">
					<c:if test="${memberList.memberCnt == 0}" >
						<!-- 검색결과가 없을경우 -->
						<span class="searchStatus ">'${cri.keyword}'에 대한 회원 검색결과가 없습니다.</span>
					</c:if>	
					
					<c:if test="${memberList.memberCnt > 0}" >	
						<!-- 검색결과가 있을경우 -->
						<span class="searchStatus">'${cri.keyword}' 검색결과</span>	
											
						<!-- 회원 검색결과 리스트 -->
						<c:forEach items="${memberList.memberList}" var = "esMemberVO" begin="${(pageMaker.cri.page-1)*9}" end="${pageMaker.cri.page*9-1}"> 
							<%@include file="../include/search/member.jsp" %>
						</c:forEach>
						<div class="clearfix"></div>	
						<%@include file="../include/search/pagenation.jsp" %>
						<div class="clearfix"></div>	
						<div class="offset-2"><hr></div>													
					</c:if>
				</c:if>
										
			</div> <!-- END OF RIGHT CONTENT -->
		</div> <!-- END OF CONTENTS CONTAINER -->
	</div> <!-- END OF Container -->
	
	<!-- FOOTER -->
	<%@include file="../include/footer.jsp" %>

    <!-- Javascript -->	
    <script src="/resources/assets/js/js-list4.js"></script>	
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/assets/js/jquery.customSelect.js'></script>
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/js/lightbox.js'></script>	
    <!-- JS Ease -->	
    <script src="/resources/assets/js/jquery.easing.js"></script>
    <!-- Custom functions -->
    <script src="/resources/assets/js/functions.js"></script>
    <!-- jQuery KenBurn Slider  -->
    <script type="text/javascript" src="/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <!-- Counter -->	
    <script src="/resources/assets/js/counter.js"></script>	
    <!-- Nicescroll  -->	
	<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>
    <!-- Picker -->	
	<script src="/resources/assets/js/jquery-ui.js"></script>
    <!-- Bootstrap -->	
    <script src="/resources/dist/js/bootstrap.min.js"></script>
	<!-- scrapBtn -->
	<script src="/resources/js/searchScrap.js"></script>
    <!-- likeBtn -->
    <script src="/resources/js/searchLike.js"></script>
    <!-- followBtn -->
    <script src="/resources/js/follow.js"></script>


  </body>

</html>