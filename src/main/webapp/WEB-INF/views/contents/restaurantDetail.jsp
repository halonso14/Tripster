<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>title</title>
</head>

<body>

	<table>
		<tr>
			<th>curPage ${cri.curPage}</th>
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
			<td></td>
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

	<form role="form" method="post">
		<input type='hidden' name='curPage' value=${pageInfo}>
	</form>

<script src="/resources/js/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$(".getList").on("click", function(){

			self.location ="/contents/restaurantList/"+pageInfo;
		});
	});

	function getReviewList() {
		$.getJSON("/contents/review/"+contentsID+"/1", function(data) {
			var str = "";
			$(data).each(
				function() {
					str += "<li data-contentsReviewID='"+this.contentsReviewID+"' class='replyLi'>"
						+ this.this.contentsReviewID + ":" + this.contentsReview
						+ "</li>";
			});
			$("#replies").html(str);
		});
	}
	$.getJSON("/contents/review/"+${contentsID}+"/"+${curPage}, function(data) {
		var str = "";
		console.log(data.length);
	});
</script>

</body>
</html>