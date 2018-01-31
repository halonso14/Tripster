<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- HEADER -->
	<%@include file="../include/header3.jsp" %>


	<div class="container">
		<div class="container pagecontainer offset-0" style="background:#f2f2f2">	
			
			<!-- LEFT: SIDE FILTERS -->
			<%@include file="../include/search/sidefilter.jsp" %>

			<!-- RIGHT: CONTENT BOX -->
			<div class="rightcontent col-md-9 offset-2" style="background:#fff">
			
				<c:if test="${totalList.totalCnt == 0 }" >
					<!-- 검색결과가 없을경우 -->
					<span class="searchStatus "><b>'${cri.keyword }'</b> 에 대한 검색결과가 없습니다.</span>
				</c:if>
				
				<c:if test="${totalList.totalCnt > 0 }" >				
					<!-- 검색결과가 있을경우 -->
					<span class="searchStatus"><b>'${cri.keyword }'</b> 검색결과</span>	
									
					<!--  컨텐츠 결과가 있을경우 -->
					<c:if test="${totalList.contentsCnt > 0 }" >
						<div class="totalResult" >
							<!-- 컨텐츠 검색결과 타이틀 -->	
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>컨텐츠</b></div>	
								<!-- 컨텐츠 검색결과 갯수가 3개 이상일 경우 더보기 버튼 노출 -->	
								<c:if test="${totalList.contentsCnt > 3 }" >
									<div class=" grey right">
										<form:form commandName="cri" action="contents" method="GET">
											<input type="hidden" name="keyword" value="${cri.keyword}"/>
											<input type="hidden" name="cnt" value="${cri.cnt}"/>
											<button class="more" name="tab" value ="contents" type="submit"> 더보기 〉 </button>
										</form:form>
									</div>
								</c:if>
								<div class="clearfix"></div>
							</div>
							<!-- 컨텐츠 검색결과 리스트 -->
							<c:forEach items="${totalList.contentsList}" var = "esContentsVO" begin="0" end="2">	
								<%@include file="../include/search/contents.jsp" %>	
							</c:forEach>
							<div class="offset-2"><hr></div>
						</div>
					</c:if>		
					
					<!-- 일정 결과가 있을경우 -->					
					<c:if test="${totalList.planCnt > 0 }" >	
						<div class="totalResult">	
							<!-- 일정 검색결과 타이틀 -->
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>일정</b></div>
								<!-- 일정 검색결과 갯수가 3개 이상일 경우 더보기 버튼 노출 -->
								<c:if test="${totalList.planCnt > 3 }" >
									<div class=" grey right">
										<form:form commandName="cri" action="contents" method="GET">
											<input type="hidden" name="keyword" value="${cri.keyword}"/>
											<input type="hidden" name="cnt" value="${cri.cnt}"/>
											<button class="more" name="tab" value ="contents" type="submit"> 더보기 〉 </button>
										</form:form>
									</div>
								</c:if>
								<div class="clearfix"></div>
							</div>
							<!-- 일정 검색결과 리스트 -->	
							<c:forEach items="${totalList.planList}" var = "esPlanVO" begin="0" end="2">
								<%@include file="../include/search/plan.jsp" %>	
							</c:forEach>
							<div class="clearfix"></div>
							<div class="offset-2"><hr></div>
						</div>
					</c:if>
	
					<!-- 회원 결과가 있을경우 -->
					<c:if test="${totalList.memberCnt > 0 }" >
						<div class="members">
							<!-- 회원 검색결과 타이틀 -->
							<div class="offset-2" style="padding:20px ">	
								<div class=" left"><b>회원</b></div>
								<!-- 회원 검색결과 갯수가 3개 이상일 경우 더보기 버튼 노출 -->
								<c:if test="${totalList.memberCnt > 3 }" >
									<div class=" grey right">
										<form:form commandName="cri" action="contents" method="GET">
											<input type="hidden" name="keyword" value="${cri.keyword}"/>
											<input type="hidden" name="cnt" value="${cri.cnt}"/>
											<button class="more" name="tab" value ="contents" type="submit"> 더보기 〉 </button>
										</form:form>
									</div>
								</c:if>
								<div class="clearfix"></div>
							</div>
							<!-- 회원 검색결과 리스트 -->
							<c:forEach items="${totalList.memberList}" var = "esMemberVO" begin="0" end="2">
								<%@include file="../include/search/member.jsp" %>
							</c:forEach>
							<div class="clearfix"></div>
							<div class="offset-2"><hr></div>
						</div>	
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
	<script src="/resources/js/scrapHD.js"></script>
    <!-- likeBtn -->
    <script src="/resources/js/searchLike.js"></script>
    <!-- followBtn -->
    <script src="/resources/js/follow.js"></script>

  </body>

</html>