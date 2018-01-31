<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Expires", "Sat, 01 Jan 1970 22:00:00 GMT");
response.setHeader("Pragma", "no-cache");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Tripster - 마이페이지</title>
	
    <!-- ymum my css-->
    <link rel = "stylesheet" type = "text/css" href ="/resources/css/statistics.css">
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <link href="/resources/ammap/ammap.css" rel="stylesheet">
    <!-- ymmu slick for carousel -->
	<link rel="stylesheet" type="text/css" href="/resources/slick-1.8.0/slick/slick.css"/>
	<!-- Add the new slick-theme.css if you want the default styling --> 
	<link rel="stylesheet" type="text/css" href="/resources/slick-1.8.0/slick/slick-theme.css"/>
	<!--ymmu icon css -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- ymum my css-->
    
    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
    
    <link href="/resources/assets/css/followBtn.css" rel="stylesheet" media="screen">
    <!-- ymmu bootstrap table -->
    <link href="/resources/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">


	<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
	
    <!-- Fonts -->	
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>	
	<!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/font-awesome.css" media="screen" />
    <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->
	
	<!-- Animo css-->
	<link href="/resources/plugins/animo/animate+animo.css" rel="stylesheet" media="screen">

    <!-- Picker -->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />	
	<script src="https://code.jquery.com/jquery-2.0.3.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style type="text/css">
.plane{
	width: 25px;
    height: 30px;
    display: block;
    margin: 0 auto;
}
.liover{
left: 254px;
}
</style>
	
  </head>
  <body id="top" class="thebg" >
    <!-- ymmu 통계, 추천 페이지 자바스크립트에서 멤버아이디 받아 ajax로 데이터 받음-->
    <script type="text/javascript">
    	var id = ${memberVO.memberID};
    	//<c:set value="${memberVO.memberName}" var="memberName"/>
    	//console.log("<c:out value="${memberVO.memberName}"/>");
    	//console.log("memberName");
    </script>
    <!-- ymmu 통계, 추천 페이지 자바스크립트에서 멤버아이디 받아 ajax로 데이터 받음-->
    
    <%@include file="/WEB-INF/views/include/header2.jsp" %>

	
	<div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="#"></a>
			<div class="left">
				<ul class="bcrumbs">
					<li>/</li>
					<li><a href="#" class="active">Profile</a></li>					
				</ul>				
			</div>
			<a class="backbtn right" href="#"></a>
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>	

<c:set var="snsLogin" value="${memberVO.snsID}"/>


	<!-- CONTENT -->
	<div class="container">
	
		<div class="container mt25 offset-0">
	
			<!-- CONTENT -->
			<div class="col-md-12 pagecontainer2 offset-0">
				
				<!-- LEFT MENU -->
				<div class="col-md-1 offset-0">
					<!-- Nav tabs -->
					<ul class="nav profile-tabs" id="myTab">
					  <li class="active">
						<a href="#profile" data-toggle="tab" role="tab">
						<span class="profile-icon"></span>
						Statistics
						</a></li>
					  <li>
						  <a href="#bookings" data-toggle="tab" onclick="mySelectUpdate()">
						  <span class="bookings-icon"></span>						  
						  Recommand
						  </a></li>
					  <li>
						  <a href="#myfollowList" data-toggle="tab" onclick="mySelectUpdate()">
						  <span class="wishlist-icon"></span>							  
						  Follow
						  </a></li>
					  <li>
						  <a href="#scrapList" data-toggle="tab" onclick="scrapList()">
						  <span class="history-icon"></span>								  
						  Scrap
						  </a></li>
					  <li>
						  <a href="#plan" data-toggle="tab" onclick="mySelectUpdate()">
						  <span class="plane"><img src="/resources/images/aeroplane.png" alt=""/></span>								  
						  Plan
						  </a></li>						  
					  <li>
						  <a href="#setProfile" data-toggle="tab" onclick="mySelectUpdate()">
						  <span class="profile-icon"></span>								  
						  Change profile
						  </a></li>
						  
				<c:choose>
					<c:when test="${empty snsLogin }">
					  <li>
						  <a href="#password" data-toggle="tab" onclick="mySelectUpdate()">
						  <span class="password-icon"></span>							  
						  Change password
						  </a></li>
					 </c:when>
					 <c:otherwise>
					 </c:otherwise>
				</c:choose>
					</ul>
					<div class="clearfix"></div>
				</div>
				<!-- LEFT MENU -->
					
				<!-- RIGHT CPNTENT -->
				<div class="col-md-11 offset-0">
					<!-- Tab panes from left menu -->
					<div class="tab-content5">
					
					  <!-- TAB 1 -->
					  <div class="tab-pane padding40 active" id="profile">
					  
					  <form id="profileForm">
					  	<input type = "file" id="input_img" style="display : none">
					  </form>
					  

	<%-- <c:set var="memberVO" value='<%= session.getAttribute("login") %>'/> --%>
	<c:set var="profilePic" value="${memberVO.memberPicture}"/>

						  <!-- Admin top -->
						  <div class="col-md-4 offset-0">
						  	<c:choose>
						  		<c:when test="${empty profilePic }">
									<img src="/resources/images/user.png" alt="" class="left margright20"
									id="profileImg" style="height : 53px; width: 53px;"/>
						  		</c:when>
						  		<c:otherwise>
						  			<img src="/displayFile?fileName=${profilePic }&directory=profile" alt="" class="left margright20" 
						  			id="profileImg" style="height : 53px; width: 53px;"/>
						  		</c:otherwise>
						  	</c:choose>
							<p class="pic size12 grey margtop10">
							안녕하세요 <span class="lred">${memberVO.memberName}님</span><br/>
							<a href="javascript:void(0)" class="lblue" id="memberPicture">프로필 사진 변경</a>
							<!-- <input type ="button" class="lblue" id="memberPic" value="프로필 사진 변경"></input> -->
							</p>
							<div class="clearfix"></div>
						  </div>
						  <div class="col-md-4">
						  </div>
						  <div class="col-md-4 offset-0">
							<table class="table table-bordered  mt-10">
							<!-- ymmu data -->
							<tr class="grey opensans">
								<td class="center"><span class="size30 slim lh4" id="numPlans">0</span><br/><span class="size12">Plans</span></td>
								<td class="center"><span class="size30 slim lh4" id="totalDays">0</span><br/><span class="size12">Trip Days</span></td>
								<td class="center"><span class="size30 slim lh4" id="numCountries">0</span><br/><span class="size12">Countries</span></td>
							</tr>
							<!-- ymmu data -->
							</table>
						  </div>
						  <!-- End of Admin top -->
						  
						<div class="clearfix"></div>
						<!-- ymmu my map here -->
						<div id="chartdiv"></div>
						<div class="first">
                            <div class="wrapper_custom">
                                <div class="stat_label">Plan</div>
                                <div id="table_custom">
                                    <table id="table" data-classes="table table-no-bordered table-hover"></table>
                                </div>	
                            </div>
                            <div class="wrapper_custom">
                                <div class="stat_label">Trip Days</div>
                                <div id="chartdiv4"></div>	
                            </div>
                            <div class="wrapper_custom">
                                <div class="stat_label">Main Keywords</div>
                                <div id="chartdiv2"></div>		
                            </div>   
                        <!--will use it later    
                            <div class="wrapper_custom">
                                <div>My plan?</div>
                                <div>total number: 8</div>
                                <div id="chartdiv3"></div>		
                            </div>
                        -->  
                        </div>
                        <hr>
                            <div class="first">
                            <div class="listwrapper">
                                <div class="stat_label"><span id="likeAnalysis">Plan "Like" Analysis</span></div>
                                <div id="chartdiv5"></div>	
                            </div>
                        </div>
                         <hr>
						<!-- ymmu my map here -->
						  
						<!-- DELETED PERSONAL DETAIL -->
						
						<div class="clearfix"></div><br/><br/><br/>
						
						
						<div class="row">
							<div class="col-md-4 grey">
								<span class="size16 bold dark">Personal details</span>
								<div class="line2"></div>
								<a href="#" class="clblue">New York Marriott Marquis</a> from <span class="bold green">$150</span><br/>
								<a href="#" class="clblue">The Jade Hotel</a> from <span class="bold green">$49</span><br/>
								<a href="#">See all</a>
							</div>
							<div class="col-md-4">
								<span class="size16 bold dark">Wish lists</span>
								<div class="line2"></div>
								<a href="#" class="clblue">Incredible places</a> (1)<br/>
								<a href="#" class="clblue">My next places</a> (0)<br/>
								<a href="#">+ Add new category</a>							
							</div>						
							<div class="col-md-4">
								<span class="size16 bold dark">Your past bookings</span>
								<div class="line2"></div>				
								<a href="#" class="clblue">Solita Soho Hotel</a> from <span class="bold green">$150</span><br/>
								<a href="#" class="clblue">Helmsley Park Lane Hotel</a> from <span class="bold green">$49</span><br/>
								<a href="#">See all</a>							
							</div>			
						</div>

					  </div>
					  <!-- END OF TAB 1 -->		
  

					  <!-- TAB 2 -->					  
					  <div class="tab-pane" id="bookings">
						<div class="padding40">
							<div class="general_font rcm_title_font"><h2>다음 여행지로 이곳들은 어떠세요?</h2></div>
						    <div class="general_text">-<span class="lred">${memberVO.memberName}</span>님의 활동을 기반으로 추천해드립니다.  만약 처음이라면? <a href="/member/detail" style="color: #8d1cc6">추천 설문 바로가기</a> </div>
						    <div class="general_text">
						    	<span class="rectangle" style="background-color: #8d1cc6"></span><span>추천 국가</span>
						    	<span class="rectangle" style="background-color: #88fd65"></span><span>여행 예정 국가</span>
						    </div>
						   
						   <!-- recommand country/city map -->
						    <div id="maps">
						        <div id="gmap" class="mapdiv" style="visibility: hidden;"></div>
						        <div id="chartdiv_rcm" class="mapdiv" style="visibility: visible;"></div>
						    </div>
						    <div class="clearfix"></div>
						    <div class="description">
					        	<img id="country_or_city_title_image" src="/resources/images/AU_main.jpg" width="100%" />
					        	<div class="general_font country_name_font">
					    			<div class="description_title">Austrailia</div>
					    		</div>
					    		<div class="general_text country_or_city_description">Tweed Heads is a city in New South Wales. It is located on the Tweed River in north-eastern New South Wales, Australia, in Tweed Shire. Tweed Heads is located next to the border with Queensland, adjacent to its "Twin Town" of Coolangatta, which is a suburb of the Gold Coast. It is often referred to as a town where people can change time zones – even celebrate New Year twice within an hour – simply by crossing the street, due to its proximity to the Queensland border, and the fact that New South Wales observes daylight saving whereas Queensland does not.</div>
					    	</div>
					    	<div class="clearfix"></div>
					    	
			    			<!--ymmu 여기가 나라 정보  -->
						    <div class="first">
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="material-icons" style="font-size:48px;color:#42b520">local_atm</i><br>
						    				<b>환율</b>
						    			<div class="info_description">
						    				<div id="exchange_ymmu"></div>
						    			</div>
						    		</div>
						    	</div>
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="material-icons" style="font-size:48px;color:#42b520">flight</i><br>
						    				<b>비행기표</b>
						    		</div>
						    		<div class="info_description">
						    				<b style="color: #10A973">이 도시와 가까운 공항</b><br>
						    				<div id="airport_ymmu"></div>
						    				<br>
						    				<b style="color: #10A973">편도 최저가격</b><br>
						    				<div id="fligh_price_ymmu"></div>
						    				<br>
						    				<b style="color: #10A973">직항 소요시간</b><br>
						    				<div id="fligh_price_ymmu"><br></div>			
						    		</div>
						    	</div>
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="material-icons safe_icon" style="font-size:48px;color:#42b520">sentiment_very_satisfied</i><br>
						    				<b>안전도</b>
						    		</div>
						    		<div class="info_description">
						    			<div id="safe_ymmu"></div>
						    		</div>	
						    	</div>
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="material-icons" style="font-size:48px;color:#42b520">local_dining</i><br>
						    				<b>빅맥 현지 가격</b>
						    		</div>
						    		<div class="info_description">
						    			<div id="bigmac_ymmu"><br></div>
						    		</div>	
						    		
						    	</div>
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="fa fa-file-word-o" style="font-size:48px;color:#42b520"></i><br>
						    				<b>국가단어</b>
						    		</div>
						    		<div class="info_description">
						    			<div id="words_ymmu"><br></div>
						    		</div>	
						    	</div>
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="material-icons" style="font-size:48px;color:#42b520">query_builder</i><br>
						    				<b>시차</b>
						    		</div>
						    		<div class="info_description">
						    			<div id="time_difference_ymmu">-1~2시간<br></div>
						    		</div>		
						    	</div>
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="material-icons" style="font-size:48px;color:#42b520">directions_bike</i><br>	
						    				<b>액티비티</b>
						    		</div>
						    		<div class="info_description">
						    			<div id="activity_ymmu"><br></div>
						    		</div>		
						    	</div>
						    	<div class="info_about_country_contents">
						    		<div class="info_icon">
						    			<i class="material-icons" style="font-size:48px;color:#42b520">free_breakfast</i><br>	
						    				<b>음식</b>
						    		</div>
						    		<div class="info_description">
						    			<div id="food_ymmu"><br></div>
						    		</div>		
						    	</div>
						    </div>
						    
			    	
			    			<!--ymmu 이 국가의 맵에 표시되지 않은 도시들 부분보여줌  -->					    	
					    	<!--
					    	<div class="general_font rcm_title_font just_padding_for_subtitle"><h2>이 국가에 관련된 다른 도시들</h2></div>
							<div class="relavtive_rcm">
					    		  <div class="your-class">
								    <div class="contents_rcm">
								    	<div class="inner_card">
								    		<img src="/resources/images/Port Macquarie.jpg" width="100%" />
								    	 	<div class="content_rcm_title">
					    						<div class="general_font country_name_font">Tweed Heads</div>
					    					</div>
								    		<div class="general_text">Tweed Heads is a city in New South Wales. It is located on the Tweed River in north-eastern New South Wales, Australia, in Tweed Shire. Tweed </div>
								    	</div>
								    </div>
								    <div class="contents_rcm">
								    	<div class="inner_card">
								    		<img src="/resources/images/Port Macquarie.jpg" width="100%" />
								    		<div class="content_rcm_title">
					    						<div class="general_font country_name_font">Tweed Heads</div>
					    					</div>
								    		<div class="general_text">Tweed Heads is a city in New South Wales. It is located on the Tweed River in north-eastern New South Wales, Australia, in Tweed Shire. Tweed </div>
								    	</div>
								    </div>
								    <div class="contents_rcm">
								    <div class="inner_card">
								    <img src="/resources/images/Port Macquarie.jpg" width="100%" />
								    	<div class="content_rcm_title">
					    						<div class="general_font country_name_font">Tweed Heads</div>
					    					</div>
								    		<div class="general_text">Tweed Heads is a city in New South Wales. It is located on the Tweed River in north-eastern New South Wales, Australia, in Tweed Shire. Tweed </div>
								    	</div>
									</div>
								    <div class="contents_rcm">
								    	<div class="inner_card">
								    	<img src="/resources/images/Port Macquarie.jpg" width="100%" />
								    		<div class="content_rcm_title">
					    						<div class="general_font country_name_font">Tweed Heads</div>
					    					</div>
								    		<div class="general_text">Tweed Heads is a city in New South Wales. It is located on the Tweed River in north-eastern New South Wales, Australia, in Tweed Shire. Tweed </div>
								    	</div>
								    </div>
								    <div class="contents_rcm">
										<div class="inner_card">
										<img src="/resources/images/Port Macquarie.jpg" width="100%" />
								    		<div class="content_rcm_title">
					    						<div class="general_font country_name_font">Tweed Heads</div>
					    					</div>
								    		<div class="general_text">Tweed Heads is a city in New South Wales. It is located on the Tweed River in north-eastern New South Wales, Australia, in Tweed Shire. Tweed </div>
								    	</div>
								    </div>
								    <div class="contents_rcm">
								    	<div class="inner_card">
								    	<img src="/resources/images/Port Macquarie.jpg" width="100%" />
								    		<div class="content_rcm_title">
					    						<div class="general_font country_name_font">Tweed Heads</div>
					    					</div>
								    		<div class="general_text">Tweed Heads is a city in New South Wales. It is located on the Tweed River in north-eastern New South Wales, Australia, in Tweed Shire. Tweed </div>
								    	</div>
								    </div>
								  </div>
					    	</div>
								-->
			    			<!--ymmu 이 국가에 관련된 유튜브 영상 추천 -->					    	
					    	<div class="general_font rcm_title_font just_padding_for_subtitle"><h2>이 국가에 관련된 유튜브 영상</h2></div>
							<div class="video_rcm_main">
								<div id="player"></div>
							</div>
							<div class="video_rcm_list">
								    
								  <!--   
								    <div class="video_rcm">
								    	<div class="video_inner_card">
								    		<img src="/resources/images/Port Macquarie.jpg" width="100%" />
								    	</div>
								    </div> 
								    -->

					    	</div>




							<!--ymmu  이 국가에 관련된 일정 추천 부분이다  -->					    	
					    	<div class="general_font rcm_title_font just_padding_for_subtitle"><h2>이 국가에 관련된 일정 참고</h2></div>
							<div class="relavtive_rcm">
					    		  <div class="related-plan-list"></div>
					    	</div>




						</div>

					  </div>
					  <!-- END OF TAB 2 -->
					  
					  	
					<!-- TAB 3 -->  
					<div class="tab-pane" id="myfollowList" style="padding: 20px 50px;">
						<div class="padding40 dark">
							<ul class="nav nav-tabs myTab2pos" id="myTab">
								<li onclick=""class="active"><a data-toggle="tab" href="#follow"><span class="reviews"></span><span class="hidetext">내가 팔로우한 회원</span>&nbsp;</a></li>
								<li onclick="getFollowingList(1);" class=""><a data-toggle="tab" href="#following"><span class="reviews"></span><span class="hidetext">나를 팔로우한 회원</span>&nbsp;</a></li>
							</ul>
							<div class="tab-content6">
									<!-- TAB 1 -->				
									<div id="follow" class="tab-pane fade active in">
										<span class="lblue size18">${memberVO.memberName}</span> <span
									class="dark size18">님이 팔로우한 회원</span>
										<div class="line4"></div>
										
											<div id="followList">
											</div>
											
											<div class="clearfix"></div>
											<div class="offset-2">
												<hr class="featurette-divider3">
											</div>
											<ul class="pagination right paddingbtm20" id="pagination3">
							   				</ul>
									</div>
									
									<!-- TAB 2  -->
									<div id="following" class="tab-pane fade ">
										<span class="lblue size18">${memberVO.memberName}</span> <span
									class="dark size18">님을 팔로우한 회원</span>
										<div class="line4"></div>
										
										<div id="followingList">
											</div>
											
											<div class="clearfix"></div>
											<div class="offset-2">
												<hr class="featurette-divider3">
											</div>
											<ul class="pagination right paddingbtm20" id="pagination4">
							   				</ul>
									</div>
							   </div>

					   </div>
					</div>
					
					<script src="/resources/js/follow.js"></script>
					<script>
					
					var memberID = ${memberVO.memberID};
					
					getFollowList(1);
					
					//FollowList를 화면에 뿌려준다.
					function getFollowList(page){
					var str = '';
						$.getJSON("/member/follow/"+memberID+"/"+page, function(data){
							console.log(data);
							$(data.followList).each(function(index){
									str += 
								"<div class='col-md-6 offset-0'>";
										
									if(this.memberPicture != null){
										str +=
											"<img src='/displayFile?fileName="+this.memberPicture+"&directory=profile'	alt='' class='left margright20' id='profileImg'	style='height: 100px; width: 100px;' />";
									} else{
										str +=
											"<img src='/resources/images/user.png' alt='' class='left margright20' id='profileImg' style='height: 100px; width: 100px;' />";
									}
										
									str +=
										"<p class='size20 grey margtop20'><span class='dark'><a href='/member/viewMember?memberID="+this.memberID+"'>"+this.memberName+"</a></span><br /></p>"
										+"<div class='container'>";
										
									if(this.memberID != data.followChkList[index]){
										str +=
											"<button class='btn followButton' value='"+this.memberID+"' onmouseover='followover($(this));' rel='6'>팔로우</button>"
									} else{
										str +=
											"<button class='btn followButton following' value='"+this.memberID+"' onmouseover='followover($(this));' rel='6'>팔로잉</button>"
									}
									
									str += "</div><div class='clearfix'></div></div>";
									 
									if((index+1)%2 == 0 && index+1 != data.followList.length){
										str +=
											"<div class='clearfix'></div><div class='offset-2'><hr class='featurette-divider3'></div>";
									}
								
								
								})
									
							$("#followList").html(str);
							printFollowPaging(data.pageMaker3);
						})
						
					}
					
						//page 뿌려주는 함수.
					function printFollowPaging(pageMaker) {
						var str = "";
						if (pageMaker.prev) {
							str += "<li><a href='" + (pageMaker.startPage - 1)
									+ "'> << </a></li>";
						}
						for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
							var strClass = pageMaker.cri.curPage == i ? 'class=active' : '';
							str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
						}
						if (pageMaker.next) {
							str += "<li><a href='" + (pageMaker.endPage + 1)
									+ "'> >> </a></li>";
						}
						$('#pagination3').html(str);
					}
					var replyPage = 1;
					
					$("#pagination3").on("click", "li a", function(event) {
						event.preventDefault();
						replyPage = $(this).attr("href");
						getFollowList(replyPage);
					});
					
					
					
					
					function getFollowingList(page){
						var str = '';
							$.getJSON("/member/following/"+memberID+"/"+page, function(data){
								$(data.followingList).each(function(index){
										str += 
									"<div class='col-md-6 offset-0'>"
										;
											
										if(this.memberPicture != null){
											str +=
												"<img src='/displayFile?fileName="+this.memberPicture+"&directory=profile'	alt='' class='left margright20' id='profileImg'	style='height: 100px; width: 100px;' />";
										} else{
											str +=
												"<img src='/resources/images/user.png' alt='' class='left margright20' id='profileImg' style='height: 100px; width: 100px;' />";
										}
											
										str +=
											"<p class='size20 grey margtop20'><span class='dark'><a href='/member/viewMember?memberID="+this.memberID+"'>"+this.memberName+"</a></span><br /></p>"
											+"<div class='container'>"
											
										if(this.memberID != data.followingChkList[index]){
											str +=
												"<button class='btn followButton' value='"+this.memberID+"' onmouseover='followover($(this));' rel='6'>팔로우</button>"
										} else{
											str +=
												"<button class='btn followButton following' value='"+this.memberID+"' onmouseover='followover($(this));' rel='6'>팔로잉</button>"
										}
											
										str += "</div><div class='clearfix'></div></div>";
										 
										if((index+1)%2 == 0 && index+1 != data.followingList.length){
											str +=
												"<div class='clearfix'></div><div class='offset-2'><hr class='featurette-divider3'></div>";
										}
									
									
									})
										
								$("#followingList").html(str);
								printFollowingPaging(data.pageMaker4);
							})
							
						}
						
							//page 뿌려주는 함수.
						function printFollowingPaging(pageMaker) {
							var str = "";
							if (pageMaker.prev) {
								str += "<li><a href='" + (pageMaker.startPage - 1)
										+ "'> << </a></li>";
							}
							for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
								var strClass = pageMaker.cri.curPage == i ? 'class=active' : '';
								str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
							}
							if (pageMaker.next) {
								str += "<li><a href='" + (pageMaker.endPage + 1)
										+ "'> >> </a></li>";
							}
							$('#pagination4').html(str);
						}
						var replyPage = 1;
						
						$("#pagination4").on("click", "li a", function(event) {
							event.preventDefault();
							replyPage = $(this).attr("href");
							getFollowingList(replyPage);
						});
					
					</script>
					  <!-- END OF TAB 3 -->	
					  
					  <!-- TAB 4 -->					  
					  <div class="tab-pane" id="setProfile">
						<div class="padding40 dark">
						
					  	<form id="changeProfile" action="changeProfile" method="post">					  
							<span class="dark size18">기본정보 변경</span>
							<div class="line4"></div>
							
							<br/>
							이메일<br/>
							<input type="text" class="form-control " name="memberEmail" id="memberEmail" 
									value="${memberVO.memberEmail}" readonly="readonly"/>
							<br/>
							닉네임<br/>
							<input type="text" class="form-control " name="memberName" id="memberName" 
									value="${memberVO.memberName}"/>
							<br/>
							성별<br/>
							<input type="text" class="form-control " name="memberSex" id="memberSex" 
									value="${memberVO.memberSex}" readonly="readonly"/>
							<br/>
							생년월일<br/>
							<input type="date" class="form-control " name="memberBirthday" id="memberBirthday" 
									value='<fmt:formatDate value="${memberVO.memberBirthday}" pattern="yyyy-MM-dd" />'/>
							<br/>
							<button type="submit" class="btn-search5">기본정보 변경</button>
							<button type="button" class="btn-search5" id="dropBtn" style="float:right" >회원 탈퇴</button>
							
							<br/>
							<br/>
							<br/>
							
						</form>
						
						<form id="dropForm" action="dropMember" method="post" style="display:none">
								<button type="submit" id="delMember">회원 탈퇴</button>
						</form>	
							
						</div>
					  </div>

					  <!-- END OF TAB 4 -->	
					  
					  <!-- TAB 5 -->					  
					  <div class="tab-pane" id="scrapList">
				
						<div class="scrapList padding40">
						
							<ul class="nav nav-tabs" id="myTab">
								<li onclick="scrapList()" class="active"><a data-toggle="tab" href="#restaurant"><span class="reviews"></span><span class="hidetext">Restaurant</span>&nbsp;</a></li>
								<li onclick="scrapList()" class=""><a data-toggle="tab" href="#place"><span class="maps"></span><span class="hidetext">Place</span>&nbsp;</a></li>
								<li onclick="mySelectUpdate()" class=""><a data-toggle="tab" href="#preferences"><span class="preferences"></span><span class="hidetext">Preferences</span>&nbsp;</a></li>
								<li onclick="loadScript()" class=""><a data-toggle="tab" href="#maps"><span class="maps"></span><span class="hidetext">Maps</span>&nbsp;</a></li>
								<li onclick="mySelectUpdate(); trigerJslider(); trigerJslider2(); trigerJslider3(); trigerJslider4(); trigerJslider5(); trigerJslider6();" class=""><a data-toggle="tab" href="#reviews"><span class="reviews"></span><span class="hidetext">Reviews</span>&nbsp;</a></li>
								<li onclick="mySelectUpdate()" class=""><a data-toggle="tab" href="#thingstodo"><span class="thingstodo"></span><span class="hidetext">Things to do</span>&nbsp;</a></li>
			
							</ul>			
							
							<div class="line4" ></div>
							
							<div class="col-md-12 offset-0" >
							
								<!-- TAB 1 -->				
								<div id="restaurant" class="tab-pane fade active in">
								
									<div class="col-md-5 offset-0" id="scrap1">
									</div>		
									
									<div class="col-md-2 offset-0">
									</div>
									
									<div class="col-md-5 offset-0" id="scrap2">
									</div>
									
								</div>
								
								<!-- TAB 2 -->
								<div id="place" class="tab-pane fade ">
								    
								</div>
								
								<!-- TAB 3 -->					
								<div id="preferences" class="tab-pane fade">
								
								</div>
								
								<!-- TAB 4 -->					
								<div id="maps" class="tab-pane fade">
									
								</div>
								
								<!-- TAB 5 -->					
								<div id="reviews" class="tab-pane fade ">
								
								</div>
								
								<!-- TAB 6 -->					
								<div id="thingstodo" class="tab-pane fade">
								
								</div>
								
								<!-- 맛집 스크랩 리스트 -->
								<script id="restaurantTemplate" type="text/x-handlebars-template">
										
									<div>
										<div class="col-md-9 offset-0">
											<input type="hidden" id="scrapID" value="{{scrapID}}">
											<img alt="" class="left mr20" src="{{thumbnail}}" style="width:100px;,height:auto;">
											
											<a class="dark" href="/contents/1/{{contentsID}}"><b>{{title}}</b></a> /
											<span class="dark size12"> 뭐 넣을까 </span><br>
											<span class="opensans green bold size14">맛집</span> <span class="grey">{{category}}</span><br>
											
											<img alt="" src="/resources/images/filter-rating-5.png"><br/>

										</div>
										<div class="col-md-3 offset-0">
											<button class="close mr20 mt10" value="{{scrapID}}" onclick="scrapDelete(this)">×</button>
										</div>
										<div class="clearfix"></div>
										<div class="line2"></div>
									</div>

								</script>	
								<script>
								
									// 스크랩 리스트 불러오기
									function scrapList(){
										
										$.getJSON('/scraplist',function(data){
											
											var str1 = "";
											var str2 = "";
											function getData(list){
												var scrapData = {
														scrapID : list.scrapID,
													    category : list.categoryID,
													    title : list.contentsTitle,
													    thumbnail : list.contentsPhoto,
													    contentsID : list.contentsID
												}
												return scrapData;
											}
											
											$(data).each(function(i,list){
												var source = $("#restaurantTemplate").html();
												var template = Handlebars.compile(source);
												
												if(list.categoryID == 1){
													if(i%2 == 1){
														str1 += template(getData(list));
													}else{
														str2 += template(getData(list));
													}
												}else{
													if(i%2 == 1){
														str1 += template(getData(list));
													}else{
														str2 += template(getData(list));
													}
												}
												
											 });
											 
											 $("#scrap1").html(str1);
											 $("#scrap2").html(str2);
											
										});
										
									}
									
									// 스크랩 삭제
									function scrapDelete(data){
										var scrapID = data.value;
										$.post("/scrapIDremove/"+scrapID,function(data){
											alert(data);
											scrapList();
										})
									}
									
								</script>
								
									
							</div>
						</div>

					  </div>
					  <!-- END OF TAB 5 -->	
					  
					  <!-- TAB 6 -->
					  <div class="tab-pane" id="password">
						<div class="padding40">
						
					  	<form id="chkPassword" action="changePassword" method="post">					  
							<span class="dark size18">비밀번호 변경</span>
							<div class="line4"></div>
							
							<br/>
							기존 비밀번호<br/>
							<input type="password" class="form-control " name="curMemberPassword" id="curMemberPassword" placeholder="기존 비밀번호">
							<br/>
							새 비밀번호<br/>
							<input type="password" class="form-control " name="memberPassword" id="memberPassword" placeholder="새 비밀번호">
							<br/>
							새 비밀번호 확인<br/>
							<input type="password" class="form-control " name="memberPasswordChk" id="memberPasswordChk" placeholder="새 비밀번호 확인">
							<br/>
							<button type="submit" class="btn-search5">비밀번호 변경</button>
							
							<br/>
							<br/>
							<br/>
							
					  	</form>
						</div>
					  </div>

		
					  <!-- END OF TAB 7 -->	
					<div class="tab-pane" id="plan" style="padding: 20px 50px;">
						<div class="padding40 dark">
							<ul class="nav nav-tabs myTab2pos" id="myTab">
								<li onclick=""class="active"><a data-toggle="tab" href="#myplan"><span class="reviews"></span><span class="hidetext">내가 등록한 일정 목록</span>&nbsp;</a></li>
								<li onclick="getLikePlanList(1);" class=""><a data-toggle="tab" href="#likePlan"><span class="reviews"></span><span class="hidetext">나의 관심 일정 목록</span>&nbsp;</a></li>
							</ul>
							<div class="tab-content6">
									<!-- TAB 1 -->				
									<div id="myplan" class="tab-pane fade active in">
										<span class="lblue size18">${memberVO.memberName}</span> <span
									class="dark size18">님이 등록한 일정</span>
										<div class="line4"></div>
										
											<div id="planList">
											</div>
											
											<div class="clearfix"></div>
											<div class="offset-2">
												<hr class="featurette-divider3">
											</div>
											<ul class="pagination right paddingbtm20" id="pagination1">
							   				</ul>
									</div>
									
									<!-- TAB 2  -->
									<div id="likePlan" class="tab-pane fade ">
										<span class="lblue size18">${memberVO.memberName}</span> <span
									class="dark size18">님의 관심 일정</span>
										<div class="line4"></div>
										<div id="likePlanList">
											</div>
											
											<div class="clearfix"></div>
											<div class="offset-2">
												<hr class="featurette-divider3">
											</div>
											<ul class="pagination right paddingbtm20" id="pagination2">
							   				</ul>
									</div>
							   </div>

					   </div>
					</div>
						<!-- Counter  -->
					<script src="/resources/assets/js/counter.js"></script>
					<script src="/resources/assets/js/js-list.js"></script>
					<script src="/resources/js/like.js"></script>
					<script>
					
					var memberID = ${memberVO.memberID};
					
					getPageList(1);
					
					//plan을 화면에 뿌려준다.
					function getPageList(page){
					var str = '';
						$.getJSON("/member/myplan/"+memberID+"/"+page, function(data){
							$(data.list).each(function(index){
									str += 
								"<div class='col-md-4'>"
									+"<div class='listitem' style='width:243.7px;'>";
										
									if(this.pictureName != ""){
										str +=
											"<img src='/displayFile?fileName="+this.pictureName+"&directory=plan'alt='' />";
									} else{
										str +=
											"<img src='' alt='' />";
									}
										
									str +=
										"<div class='liover'></div>";
											
									if(data.likeChkList[index] != 1){
										str +=
											"<a id='likeBtn' class='fav-icon like' href='javascript:void(0)' onclick='likeClick("+memberID+",$(this));' value=" +this.planID+ " likeBtnCheck='0'></a>"
									} else{
										str +=
											"<a id='likeBtn' class='fav-icon-red like' onclick='likeClick("+memberID+",$(this));' value=" +this.planID+ " likeBtnCheck='1'></a>"
									}
											
									str +=
										"<a class='book-icon' href='/plan/read?planID="+this.planID+"'></a>"
									+"</div>"
									+"<div class='itemlabel' style='text-align: center;'>"
										+"<a href='/plan/read?planID="+this.planID+"'><b>"+this.planTitle+"</b></a><br />"
									 
									 if(this.planEndChk != 1){
										 str += "<button class='btn followButton' value='"+this.planID+"' onmouseover='mouseover($(this));'>미완료</button>"
										+"</div>"
									+"</div>";
									 }else{
										str += "<button class='btn followButton following' value='"+this.planID+"'  onmouseover='mouseover($(this));'>완료</button>"
										+"</div>"
									+"</div>";
									 }	
									
									if((index+1)%3 == 0 && index+1 != data.list.length){
										str +=
											"<div class='clearfix'></div><div class='offset-2'><hr class='featurette-divider3'></div>";
									}
								
								
								})
									
							$("#planList").html(str);
							printPaging(data.pageMaker);
							StartAnime2();
						})
						
					}
					
						//page 뿌려주는 함수.
					function printPaging(pageMaker) {
						var str = "";
						if (pageMaker.prev) {
							str += "<li><a href='" + (pageMaker.startPage - 1)
									+ "'> << </a></li>";
						}
						for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
							var strClass = pageMaker.cri.curPage == i ? 'class=active' : '';
							str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
						}
						if (pageMaker.next) {
							str += "<li><a href='" + (pageMaker.endPage + 1)
									+ "'> >> </a></li>";
						}
						$('#pagination1').html(str);
					}
					var replyPage = 1;
					
					$("#pagination1").on("click", "li a", function(event) {
						event.preventDefault();
						replyPage = $(this).attr("href");
						getPageList(replyPage);
					});
					
					
					
					
					function getLikePlanList(page){
						var str = '';
							$.getJSON("/member/likeplan/"+memberID+"/"+page, function(data){
								$(data.likeList).each(function(index){
										str += 
									"<div class='col-md-4'>"
										+"<div class='listitem' style='width:243.7px;'>";
											
										if(this.pictureName != ""){
											str +=
												"<img src='/displayFile?fileName="+this.pictureName+"&directory=plan'alt='' />";
										} else{
											str +=
												"<img src='' alt='' />";
										}
											
										str +=
											"<div class='liover'></div>";
												
										if(data.likePlanList[index] != 1){
											str +=
												"<a id='likeBtn' class='fav-icon like' href='javascript:void(0)' onclick='likeClick("+memberID+",$(this));' value=" +this.planID+ " likeBtnCheck='0'></a>"
										} else{
											str +=
												"<a id='likeBtn' class='fav-icon-red like' onclick='likeClick("+memberID+",$(this));' value=" +this.planID+ " likeBtnCheck='1'></a>"
										}
												
										str +=
											"<a class='book-icon' href='/plan/read?planID="+this.planID+"'></a>"
										+"</div>"
										+"<div class='itemlabel' style='text-align: center;'>"
											+"<a href='/plan/read?planID="+this.planID+"'><b>"+this.planTitle+"</b></a><br /></div></div>"
										 
										 /* if(this.planEndChk != 1){
											 str += "<button class='btn followButton' value='"+this.planID+"' onmouseover='mouseover($(this));'>미완료</button>"
											+"</div>"
										+"</div>";
										 }else{
											 console.log("1");
											str += "<button class='btn followButton following' value='"+this.planID+"'  onmouseover='mouseover($(this));'>완료</button>"
											+"</div>"
										+"</div>";
										 }	 */
										
										if((index+1)%3 == 0 && index+1 != data.likeList.length){
											str +=
												"<div class='clearfix'></div><div class='offset-2'><hr class='featurette-divider3'></div>";
										}
									
									
									})
										
								$("#likePlanList").html(str);
								printLikePaging(data.pageMaker2);
								StartAnime2();
							})
							
						}
						
							//page 뿌려주는 함수.
						function printLikePaging(pageMaker) {
							var str = "";
							if (pageMaker.prev) {
								str += "<li><a href='" + (pageMaker.startPage - 1)
										+ "'> << </a></li>";
							}
							for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
								var strClass = pageMaker.cri.curPage == i ? 'class=active' : '';
								str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
							}
							if (pageMaker.next) {
								str += "<li><a href='" + (pageMaker.endPage + 1)
										+ "'> >> </a></li>";
							}
							$('#pagination2').html(str);
						}
						var replyPage = 1;
						
						$("#pagination2").on("click", "li a", function(event) {
							event.preventDefault();
							replyPage = $(this).attr("href");
							getLikePlanList(replyPage);
						});
					
					</script>
					  <!-- END OF TAB 7 -->	
					  
					</div>
					<!-- End of Tab panes from left menu -->	
					
				</div>
				<!-- END OF RIGHT CPNTENT -->
			
			<div class="clearfix"></div><br/><br/>
			</div>
			<!-- END CONTENT -->			
			

			
		</div>
		
		
	</div>
	<!-- END OF CONTENT -->
	
	<%@include file="/WEB-INF/views/include/footer.jsp" %>
	
	

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="/resources/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="/resources/js/messages_ko.min.js"></script>
    <!-- ymmu my js-->
    <script type="text/javascript" src="/resources/slick-1.8.0/slick/slick.min.js"></script>
	<!-- ymmu my js-->
	<!-- pie charts -->

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2hKi_ABEp2xZW6gQfjYyPaVA1Kddub6k" defer ></script>	<!-- &callback=initGoogleMap -->

    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>
    <!-- radar -->
    <script src="https://www.amcharts.com/lib/3/radar.js"></script>
    <!--myplan chart -->
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <script src="https://www.amcharts.com/lib/3/ammap.js"></script>
    <script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/none.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/dist/js/bootstrap.min.js"></script>
    <script src="/resources/bootstrap-table/dist/bootstrap-table.js"></script>
	<!-- put your locale files after bootstrap-table.js -->
	<script src="/resources/bootstrap-table/dist/locale/bootstrap-table-ko-KR.js"></script>
    <!-- ymmu my statistacs.js-->
    <script src="/resources/js/statistics.js" type="text/javascript"></script>
    <!-- 상윤것 script 분리시킴 mypage.js-->
    <script src="/resources/js/mypage.js" type="text/javascript"></script>
    <!-- 핸들바 라이브러리 -->
	<script src="https:cdnjs.cloudflare.com/ajax/Libs/handlebars.js/3.0.1/handlebars.js"></script>
<!--  
    <script src="/resources/js/recommand.js" type="text/javascript"></script>
    
 -->
	<!-- ymmu recommand.js--><!-- Google includes -->
	
	<!-- 특정 탭으로 연결 -->
<!--  <script>
$(window).load(function(){
    var hash= window.location.hash;
        if(hash.length > 0 ) {
            $('a[role="tab"]').parent().removeClass('active');//remove the default active tab
            $('a[href="'+hash+'"]').parent().addClass('active');
            $('.tab-pane').removeClass('active');
            $(hash).addClass('active');
         }
  });
</script> -->
	

	
	
	<!-- Javascript  -->
	<script src="/resources/assets/js/js-profile.js"></script>
	
    <!-- Nicescroll  -->	
	<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>
	
    <!-- Custom functions -->
    <script src="/resources/assets/js/functions.js"></script>
	
	<script src="/resources/js/endChk.js"></script>
	<script src="/resources/js/followChk.js"></script>
	
    <!-- Custom Select -->
	<script src='/resources/assets/js/jquery.customSelect.js' type='text/javascript' ></script>
	
	<!-- Load Animo -->
	<script src="/resources/plugins/animo/animo.js"></script>

    <!-- Picker -->	
	<script src="/resources/assets/js/jquery-ui.js"></script>	

    <!-- Picker -->	
    <script src="/resources/assets/js/jquery.easing.js"></script>	
	
	<!-- plan 일정 삭제 후 tab이동.  -->
	<script >
	 $(document).ready(function(){
			var planDeleteChk = "${plan_delete}";
			var planChk = "<%=request.getParameter("planTab")%>";
			console.log(planDeleteChk);
		    if(planDeleteChk == "OK"){
	    			alert("일정이 삭제되었습니다.");
	    			$('.nav a[href="#plan"]').tab('show');
	    				
	    		}
		    if(planChk =="active"){
		    		$('.nav a[href="#plan"]').tab('show');
		    }
	 });
	</script>
  </body>
</html>