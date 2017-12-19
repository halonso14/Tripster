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
	<button type="submit" class="getList">리스트 페이지</button>
	
	<div>
		<div class="line4"></div>
		Review Text
		<br/>
		<textarea name="reviewtext" id="newText" class="form-control" rows="3"></textarea><br/>
		<button type="submit" id="writeReview">Post<span class="glyphicon glyphicon-arrow-down"></span></button>
		<br/><br/><br/>
	</div>
	
	
	<ul id="replies">
	</ul>
	<ul class="reviewPaging">
	</ul>
	
	<div class="container mt25 offset-0">
		<div class="col-md-8 pagecontainer2 offset-0">
			<div class="cstyle10"></div>
			<ul class="nav nav-tabs" id="myTab">
				<li class=""><a data-toggle="tab" href="#reviews"><span class="reviews"></span><span class="hidetext">Reviews</span></a></li>
			</ul>
			<div class="tab-content4" >
				<div id="reviews" class="tab-pane fade active in">
						<div class="hpadding20">
							<span class="opensans dark size16 bold">Write Your Review</span>
						</div>
						<!-- 리뷰 작성 -->
						<div class="hpadding20">
							<input type="text">
						</div>
						<div class="hpadding20">
							<span class="opensans dark size16 bold">Reviews</span>
						</div>
						
						<div class="line2"></div>
						
						<!-- 리뷰 리스트 조회 -->
						<div class="hpadding20">							
							<div class="col-md-4 offset-0 center">
								<div class="padding20">
									<div class="bordertype5">
										<div class="circlewrap">
											<img src="/resources/images/user-avatar.jpg" class="circleimg" alt=""/>
											<span>4.5</span>
										</div>
										<span class="dark">by Sena</span><br/>
										from London, UK<br/>
										<img src="/resources/images/check.png" alt=""/><br/>
										<span class="green">Recommended<br/>for Everyone</span>
									</div>
									
								</div>
							</div>
							<div class="col-md-8 offset-0">
								<div class="padding20">
									<span class="opensans size16 dark">Great experience</span><br/>
									<span class="opensans size13 lgrey">Posted Jun 02, 2013</span><br/>
									<p id="exampleModal">Excellent hotel, friendly staff would def go there again</p>	
								</div>
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"id="narae">Modify</button>
							<div class="clearfix"></div>
						</div>
							
						<div class="line2"></div>
						
						<div class="hpadding20">	
							<div class="col-md-4 offset-0 center">
								<div class="padding20">
									<div class="bordertype5">
										<div class="circlewrap">
											<img src="/resources/images/user-avatar.jpg" class="circleimg" alt=""/>
											<span>4.5</span>
										</div>
										<span class="dark">by Sena</span><br/>
										from London, UK<br/>
										<img src="/resources/images/check.png" alt=""/><br/>
										<span class="green">Recommended<br/>for Everyone</span>
									</div>
									
								</div>
							</div>
							<div class="col-md-8 offset-0">
								<div class="padding20">
									<span class="opensans size16 dark">Great experience</span><br/>
									<span class="opensans size13 lgrey">Posted Jun 02, 2013</span><br/>
									<p>The view from our balcony in room # 409, was terrific. It was centrally located to everything on and around the port area. Wonderful service and everything was very clean. The breakfast was below average, although not bad. If back in Zante Town we would stay there again.</p>	
									<ul class="circle-list">
										<li>4.5</li>
										<li>3.8</li>
										<li>4.2</li>
										<li>5.0</li>
										<li>4.6</li>
										<li>4.8</li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
							
						<div class="line2"></div>
							
						<div class="hpadding20">	
							<div class="col-md-4 offset-0 center">
								<div class="padding20">
									<div class="bordertype5">
										<div class="circlewrap">
											<img src="/resources/images/user-avatar.jpg" class="circleimg" alt=""/>
											<span>4.5</span>
										</div>
										<span class="dark">by Sena</span><br/>
										from London, UK<br/>
										<img src="/resources/images/check.png" alt=""/><br/>
										<span class="green">Recommended<br/>for Everyone</span>
									</div>
									
								</div>
							</div>
							<div class="col-md-8 offset-0">
								<div class="padding20">
									<span class="opensans size16 dark">Great experience</span><br/>
									<span class="opensans size13 lgrey">Posted Jun 02, 2013</span><br/>
									<p>It is close to everything but if you go in the lower season the pool won't be ready even though the temperature was quiet high already.</p>	
									<ul class="circle-list">
										<li>4.5</li>
										<li>3.8</li>
										<li>4.2</li>
										<li>5.0</li>
										<li>4.6</li>
										<li>4.8</li>
									</ul>
								</div>
							</div>
							<div class="clearfix"></div>							
						</div>	
						
						<div class="line2"></div>
						<br/>
						<br/>
						<div class="hpadding20">
							<span class="opensans dark size16 bold">Reviews</span>
						</div>
						
						<div class="line2"></div>

						<div class="wh33percent left center">
							<ul class="jslidetext2">
								<li>Username</li>
								<li>Evaluation</li>
								<li>Title</li>
								<li>Comment</li>
							</ul>
						</div>
						<div class="wh66percent right offset-0">
							<script>
								//This is a fix for when the slider is used in a hidden div
								function testTriger(){
									setTimeout(function (){
										$(".cstyle01").resize();
									}, 500);	
								}
							</script>
							<div class="padding20 relative wh70percent">
								
								<input type="text" class="form-control margtop10" placeholder="">
								<select class="form-control mySelectBoxClass margtop10">
								  <option selected>Wonderful!</option>
								  <option>Nice</option>
								  <option>Neutral</option>
								  <option>Don't recommend</option>
								</select>
								<input type="text" class="form-control margtop10" placeholder="">
								
								<textarea class="form-control margtop10" rows="3"></textarea>
								
								<div class="clearfix"></div>
								<button type="submit" class="btn-search4 margtop20">Submit</button>	

								<br/>
								<br/>
								<br/>
								<br/>
								
							</div>							
						</div>
						<div class="clearfix"></div>

					</div>
					</div>
					</div>
					</div>
					
					<!-- Modal -->
 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" area-hidden="false">
    <div class="modal-dialog" style="width: 1022px; left: -501px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
  </div>
					

<script src="/resources/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var listPage = ${cri.curPage};
		var contentsID = ${contentsID};
		var reviewPage = 1;
		
		getReviewList(reviewPage);
		
		$('#exampleModal').on('show.bs.modal', function (event) {
			  var button = $(event.relatedTarget) // Button that triggered the modal
			  var recipient = button.data('whatever') // Extract info from data-* attributes
			  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			  var modal = $(this)
			  modal.find('.modal-title').text('New message to ' + recipient)
			  modal.find('.modal-body input').val(recipient)
		});
		
		
		$(".getList").on("click", function(){
			self.location= "/contents/restaurantList/"+listPage;
		});
		
		$("#writeReview").on("click", function(){
			var memberID = 1;
			var contentsReview = $("#newText").val();
			
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
						getReviewList(1);
				}
			});
			
			$("#newText").val("")
		});
		
		$(".reviewPaging").on("click", "a", function(event){
			event.preventDefault();
			var tmp = $(this).attr("href");
			getReviewList(tmp);
			
		})
		
		function getReviewList(reviewPage) {
			$.getJSON("/contents/review/"+contentsID+"/"+reviewPage, function(data) {
				var str = "";

				$(data.list).each(function() {
						str += "<li data-contentsReviewID='"+this.contentsReviewID+"' class='replyLi'>"
							+ this.contentsReviewID + ":" + this.contentsReview
							+ "</li>";
				});
				
				$("#replies").html(str);
				
				printPaging(data.pageMaker);
			});
		}
		
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
			
			$(".reviewPaging").html(str);
		};
	});
</script>

</body>
</html>