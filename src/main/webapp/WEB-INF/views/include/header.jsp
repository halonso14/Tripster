<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "userSession" value = '<%= session.getAttribute("login") %>'/>

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
								<li><a href="member/register">회원가입</a></li>
								<li><a href="member/login">로그인</a></li>
							</ul>
						</c:when>
			
 						<c:otherwise>		
 							<ul id="member" class="nav nav2 navlight navbar-nav navbar-right">
								<li class="dropdown">
									<a data-toggle="dropdown" class="dropdown-toggle" href="dashboard/index">
										${userSession.memberName} <span class="badge indent0">1</span><b class="lightcaret mt-2"></b>
									</a>
							<ul class="dropdown-menu">
								<li><a href="member/mypage">내정보 관리</a></li>
								<li><a href="member/logout">로그아웃</a></li>
							</ul>
								</li>
								<li><a href="#">일정등록버튼</a></li>
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
