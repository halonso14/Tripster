<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>title</title>
</head>

<body>
	<table>
		<tr>
			<th>${cri.curPage}</th>
			<th>contentsID</th>
			<th>title</th>
			<th>location</th>
			<th>rating</th>
			<th>categoryID</th>
			<th>viewCnt</th>
			<th>reviewCnt</th>
			<th>scrapCnt</th>
		</tr>
		<tr>
			<td>${vo.contentsID}</td>
			<td>${vo.title}</td>
			<td>${vo.location}</td>
			<td>${vo.rating}</td>
			<td>${vo.categoryID}</td>
			<td>${vo.contentsViewCnt}</td>
			<td>${vo.contentsReviewCnt}</td>
			<td>${vo.contentsScrapCnt}</td>
		</tr>
	</table>
	
	
	<!-- CONTENT -->
	<div class="container">
		<div class="container mt25 offset-0">
			<div class="col-md-12 pagecontainer2 offset-0">
				<div class="hpadding50c">
					<p class="lato size30 slim">Blog</p>
					<p class="aboutarrow"></p>
				</div>
				<div class="line3"></div>
				
				<div class="hpadding50c">

					<!-- 왼쪽 파트 -->
					<!-- 본문 -->
					<div class="col-md-8 cpdd01 grey2">
						<div class="abover">
							<div class="abbg">
								<a href="/resources/images/about-man.jpg" class="blogpost-hover" data-footer="A custom footer text" data-title="A random title" data-gallery="multiimages" data-toggle="lightbox"><span class="glyphicon glyphicon-zoom-in"></span></a>
							</div>
							<img src="/resources/images/about-man.jpg" class="fwimg" alt=""/>
						</div><br/>
						
						<span class="lato size22 dark bold">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br/>
						<span class="grey">December 25, 2013/<a href="#">0 Comments</a>/in <a href="#">Vacations</a>/by <a href="#">TitanicThemes</a></span><br/>
						<button id="scrapBttn" value=${scrapCheck } >스크랩</button>
						
						<div class="line4"></div>
						Donec vehicula nunc in turpis rutrum porta. Nullam lacinia ante non turpis aliquam mattis. Pellentesque luctus leo eget metus egestas egestas. Maecenas hendrerit magna ut porttitor tempor. In hac habitasse platea dictumst. Duis condimentum congue nisi, ac semper ipsum posuere eu. 
						<br/><br/>
						<span class="glyphicon glyphicon-tag dark"></span><b>Tags:</b> travel, booking, vacations
						<button type="submit" class="btn-search4 margtop20 right" id="getList">리스트 페이지</button>	
						<br/><br/>
						
						
						
						<div class="line4"></div>
						
						<div class="col-md-12 pagecontainer2 offset-0">
							<div class="cstyle10"></div>
							<ul class="nav nav-tabs" id="myTab">
								<li class=""><a data-toggle="tab" disabled><span class="hidetext"></span><span class="reviews"></span>Review</a></li>
							</ul>
							<div class="tab-content4" >
							
							<!-- 왜 있지? -->
							<div id="reviews" class="tab-pane fade active in"></div>
							<!-- 리뷰 리스트 조회 -->
							<div class="hpadding20">
							<span class="opensans dark size16 bold">Reviews</span>
						</div>
					
						<div class="line2"></div>
						
						<!-- 리뷰 호출 -->
						<div class="hpadding20" id="reviewList">
				
						</div>
				
						<!-- 리뷰 페이징 -->
						<div class="hpadding20">
							<ul class="pagination right paddingbtm20" id="reviewPaging">
				
							</ul>
						</div>			
				
						<!-- 리뷰 작성 -->
						<br/><br/><br/>
						<div class="hpadding20">
							<span class="opensans dark size16 bold">Write your review</span>
						</div>
						
						<div class="line2"></div>

						<div class="wh25percent left center">
							<ul class="jslidetext2">
								<li>Username</li>
								<li>Evaluation</li>
								<li>Title</li>
								<li>Comment</li>
							</ul>
						</div>
						<div class="wh75percent right offset-0">
							<script>
								//This is a fix for when the slider is used in a hidden div
										function testTriger(){
											setTimeout(function (){
												$(".cstyle01").resize();
											}, 500);	
										}
							</script>
							<div class="padding12 relative wh75percent">
								<input type="text" class="form-control margtop10" placeholder="">
								<select class="form-control mySelectBoxClass margtop10">
									<option selected>Wonderful!</option>
									<option>Nice</option>
									<option>Neutral</option>
									<option>Don't recommend</option>
								</select>
								<input type="text" class="form-control margtop10" placeholder="">
								<textarea class="form-control margtop10" rows="5" id="reviewDetail"></textarea>
										
								<div class="clearfix"></div>
								<button type="submit" class="btn-search4 margtop10" id="writeReview">리뷰 등록</button>	
		
										<br/>
										<br/>
									</div>							
								</div>
								<div class="clearfix"></div>
		
							</div>
						
						
						<div class="wh20percent left textleft">
							<div class="circlewrap2"><img alt="" class="circleimg" src="images/user-avatar.jpg"></div>
						</div>
						<div class="wh80percent right"></div>
					</div>
				</div>
					<!-- END OF LEFT IMG -->
					
					
					
				<!-- 왼쪽 파트 -->
				<div class="col-md-4 cpdd02">
					<div class="opensans grey">
						<input type="text" placeholder="Search.." class="form-control logpadding" name="s"><br/>
						<span class="lato size18 dark bold">Category</span><br/>
						
						<ul class="blogcat">
							<li><a href="#">Vacations</a> <span class="badge indent0">4</span></li>
							<li><a href="#">Hotels</a> <span class="badge indent0">8</span></li>
							<li><a href="#">Flights</a> <span class="badge indent0">15</span></li>
							<li><a href="#">Early booking</a> <span class="badge indent0">16</span></li>
							<li><a href="#">Last minute</a> <span class="badge indent0">23</span></li>
							<li><a href="#">Cruises</a> <span class="badge indent0">42</span></li>
						</ul>
						<br/>
						
							
							<!-- Nav tabs -->
						<ul class="nav navigation-tabs3">
							<li class="active"><a href="#tab-newtopic" data-toggle="tab"><span class="glyphicon glyphicon-star"></span> Featured</a></li>
							<li><a href="#tab-comments" data-toggle="tab"><span class="glyphicon glyphicon-stats"></span> Popular</a></li>

						</ul>
							
						<div class="tab-content4">
								<!-- Tab 1 -->
							<div class="tab-pane active" id="tab-newtopic">
								<a href="#"><img alt="" class="left mr20" src="images/smallthumb-1.jpg"></a>
								<a class="dark" href="#"><b>Hotel Dany</b></a><br>
								<span class="opensans green bold size14">$36-$160</span> <span class="grey">avg/night</span><br>
								<img alt="" src="images/filter-rating-5.png">
								<div class="line4"></div>
								<a href="#"><img alt="" class="left mr20" src="images/smallthumb-2.jpg"></a>
								<a class="dark" href="#"><b>Hotel Amaragua</b></a><br>
								<span class="opensans green bold size14">$36-$160</span> <span class="grey">avg/night</span><br>
								<img alt="" src="images/filter-rating-5.png">
								<div class="line4"></div>
								<a href="#"><img alt="" class="left mr20" src="images/smallthumb-3.jpg"></a>
								<a class="dark" href="#"><b>Hotel Lotus</b></a><br>
								<span class="opensans green bold size14">$36-$160</span> <span class="grey">avg/night</span><br>
								<img alt="" src="images/filter-rating-5.png">
							</div>
							<!-- End of Tab 1 -->
								
								<!-- Tab 2 -->
								<div class="tab-pane" id="tab-comments">
								
								</div>
								<!-- End of Tab 2 -->
								
								<!-- Tab 3 -->
								<div class="tab-pane" id="tab-blogcomments">

								</div>
								<!-- End of Tab 3 -->
							</div>

							
							
							<span class="lato size18 dark bold">Archives</span><br/>
							<ul class="blogcat">
								<li><a href="#">December 2013</a></li>
								<li><a href="#">November 2013</a></li>
								<li><a href="#">October 2013</a></li>
								<li><a href="#">September 2013</a></li>
								<li><a href="#">August 2013</a></li>
								<li><a href="#">July 2013</a></li>
								<li><a href="#">June 2013</a></li>
								<li><a href="#">May 2013</a></li>
								<li><a href="#">April 2013</a></li>
							</ul>
							
							<br/><br/>
						</div>
					</div>
					<!-- END OF IMG RIGHT TEXT -->
					<div class="clearfix"></div>
					<br/><br/>
				</div>

			<div class="clearfix"></div><br/><br/>
		</div>
	</div>
</div>
<!-- END CONTENT -->
<!-- Modal -->
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		var memberID = 1;
		var listPage = ${cri.curPage};
		var contentsID = ${contentsID};
		var reviewPage = 1;
		var scrapbt = $("#scrapBttn");
		// 스크랩 체크
		$.post('/scrapCheck/'+contentsID,function(check){
			scrapbt.attr('value',check);
		});
		
		// 스크랩 누를경우
		scrapbt.on('click',function(){
				alert(scrapbt.val());
				// 스크랩 아이디 확인 
				if(scrapbt.val()==1){
					scrapbt.attr('value',"0");
					alert(scrapbt.val());
					// 스크랩 추가 ajax
					$.post('/scrap/'+contentsID,function(result){
							alert(result);
					});
				}else{
					scrapbt.attr('value',"1");
					alert(scrapbt.val());
					// 스크랩 제거 ajax
					$.post('/scrapDelete/'+contentsID,function(result){
							alert(result);
					});
				};
		});

		// 리뷰 리스트 불러오기
		getReviewList(reviewPage);
		
		// 컨텐츠 리스트 페이지 가기
		$("#getList").on("click", function(){
			self.location= "/contents/restaurantList/"+listPage;
		});
		
		// 리뷰 등록
		$("#writeReview").on("click", function(){
			var contentsReview = $("#reviewDetail").val();
			
			$.ajax({
				type :'post',
				url : '/contents/contentsDetail/'+contentsID,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST",
				},
				dataType : 'text',
				data : JSON.stringify({
					contentsID : contentsID,
					memberID : memberID,
					contentsReview : contentsReview
				}),
				success : function() {
						// 리뷰 등록후 처음 1 페이지로 이동
						getReviewList(1);
				}
			});
			
			$("#reviewDetail").val("")
		});
		
		// 리뷰 페이지 숫자 버튼 눌렀을때
		$("#reviewPaging").on("click", "a", function(event){
			event.preventDefault();
			var tmp = $(this).attr("href");
			getReviewList(tmp);
			
		})
		
		// 리뷰 리스트
		function getReviewList(reviewPage) {
			$.getJSON("/contents/review/"+contentsID+"/"+reviewPage, function(data) {
				var str = "";
				
				// 컨텐츠의 리뷰 리스트 받아오기
				$(data.list).each(function() {
					str += "<div class='col-md-4 offset-0 center' data-contentsReviewID='"+this.contentsReviewID+"'>"
						+ "		<div class='padding20'>"
						+ "			<div class='bordertype5'>"
						+ "				<div class='circlewrap'>"
						+ "					<img src='/resources/images/user-avatar.jpg' class='circleimg' alt=''/><span>4.5</span>"
						+ "				</div>"
						+ "				<span class='dark'>by Sena</span><br/>"
						+ "				from London, UK<br/>"
						+ "				<img src='/resources/images/check.png' alt=''/><br/>"
						+ "				<span class='green'>Recommended<br/>for Everyone</span>"
						+ "			</div>"
						+ "		</div>"
						+ "	</div>"
						+ "	<div class='col-md-8 offset-0'>"
						+ "		<div class='padding20'>"
						+ "			<span class='opensans size16 dark'>Great experience</span><br/>"
						+ "			<span class='opensans size13 lgrey'>Posted Jun 02, 2013</span><br/>"
						+ "			<p data-contentsReviewID='"+this.contentsReviewID+"' class='"+this.contentsReviewID+"'>"+ this.contentsReview + "</p>"
						+ "		</div>"
						+ "	</div>"
						+ " <div>"
						+ "		<button class='modify' id='"+this.contentsReviewID+"' value='1'>Modify</button>"
						+ "     <button class='delete' id='"+this.contentsReviewID+"'>delete</button>"
						+ "		<div class='clearfix'></div>"
						+ "</div>"
						+ ""
						+ "<div class='line2'></div>";
				});
				
				$("#reviewList").html(str);
				
				printPaging(data.pageMaker);
			});
		}

		$('#reviewList').on('click','.modify',function(){
		
			// 리뷰 아이디
			var contentsReviewID = $(this).attr('id');
			
			if (this.value == 1){
				// 수정 텍스트 출력
	            $(this).attr('value',0);
	            var str = "<textarea id='textarea' cols=" + 30 + "rows=" + 10 + "></textarea>";
	            $('.'+contentsReviewID).html(str);
	
			}else{
				
				// 수정 내용 저장
				var modify = $('#textarea').val();
				$(this).attr('value',1);
				
				// 수정 내용 전달
				$.ajax({
					type :'put',
					url : '/contents/contentsDetail/'+ contentsID +'/'+ contentsReviewID,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT",
					},
					dataType : 'text',
					data : JSON.stringify({
						contentsID : contentsID,
						memberID : memberID,
						contentsReview : modify
					}),
					success : function(result) {
							alert(result);
							// 리뷰 등록후 처음 1 페이지로 이동
							getReviewList(1);
					}
				});
			}
		})
		
		$('#reviewList').on('click','.delete',function(){
			
			alert('click');
			// 리뷰 아이디
			var contentsReviewID = $(this).attr('id');
			
			$.ajax({
				type :'delete',
				url : '/contents/contentsDetail/'+ contentsID +'/'+ contentsReviewID,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE",
				},
				dataType : 'text',
				success : function(result) {
						alert(result);
						// 리뷰 등록후 처음 1 페이지로 이동
						getReviewList(1);
				}
			});
			
		})
	
				
		function printPaging(pageMaker) {
			var str = "";
			if(pageMaker.prev) {
				str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
			
			for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.curPage == i ? 'class=active':'';
				str += "<li " +strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
			
			if(pageMaker.next) {
				str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
			}
			
			$("#reviewPaging").html(str);
		};
	});
</script>

</body>
</html>