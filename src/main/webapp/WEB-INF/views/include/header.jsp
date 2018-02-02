<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>
<%-- <%@include file="/WEB-INF/views/plan/registerModal.jsp"%> --%>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "Sat, 01 Jan 1970 22:00:00 GMT");
response.setHeader("Pragma", "no-cache");
%>
<!-- Top wrapper -->
<div class="navbar-wrapper3 navbar-fixed-top2">
	<div class="container">
		<div class="navbar mtnav2">
			<div class="container offset-3">
				<!-- Navigation-->
				<div class="navbar-header">
					<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/" class="navbar-brand"><img src="/resources/updates/update1/img/logo.png" alt="Travel Agency Logo" class="logo2"/></a>
				</div>
				<div class="navbar-collapse collapse">
			        
        			<c:choose>
        				<c:when test = "${empty userSession}">
						<ul id="nonmember" class="nav nav2 navlight navbar-nav navbar-right">
							<li><a href="/member/register">회원가입</a></li>
							<li><a href="/member/login">로그인</a></li>
						</ul>
					</c:when>
			
					<c:otherwise>		
						<ul id="member" class="nav nav2 navlight navbar-nav navbar-right">
							<li><a class="header-profile-box">
								<c:choose>
									<c:when test="${userSession.memberPicture==null}">
										<img class="header-profile" src="/resources/images/user.png" />
									</c:when>
									<c:otherwise>
										<img class="header-profile" src="/displayFile?fileName=${userSession.memberPicture}&directory=profile" />
									</c:otherwise>
								</c:choose>	
							</a>	</li>
							<li class="dropdown">
								<a data-toggle="dropdown" class="dropdown-toggle" href="dashboard/index">	
									<span>${userSession.memberName}&nbsp;&nbsp;<b class="lightcaret mt-2"></b></span>
								</a>
								<ul class="dropdown-menu">
									<li><a href="/member/mypage">마이페이지</a></li>
									<li><a href="/member/logout">로그아웃</a></li>
								</ul>
							</li>
							<li id="planRegister">
								<a href="/plan/register">일정등록</a>
							</li>
						</ul>
					</c:otherwise>
        			
        			</c:choose>	
				</div>
				<!-- /Navigation-->
			</div>
		</div>
	</div>
</div>
<!-- /Top wrapper -->