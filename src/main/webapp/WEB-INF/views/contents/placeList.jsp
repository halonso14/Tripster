<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>title</th>
			<th>location</th>
			<th>rating</th>
			<th>categoryID</th>
			<th>viewCnt</th>
			<th>reviewCnt</th>
			<th>scrapCnt</th>
		</tr>
		<c:forEach items="${list}" var="contentsVO">
			<tr>
				<td>${contentsVO.title}</td>
				<td>${contentsVO.location}</td>
				<td>${contentsVO.rating}</td>
				<td>${contentsVO.categoryID}</td>
				<td>${contentsVO.contentsViewCnt}</td>
				<td>${contentsVO.contentsReviewCnt}</td>
				<td>${contentsVO.contentsScrapCnt}</td>
			</tr>
		</c:forEach>
	</table>

	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a href="/contents/placeList/${pageMaker.startPage - 1}">prev</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li
					<c:out value="${pageMaker.cri.curPage == idx?'class = active':''}"/>>
					<a href="/contents/placeList/${idx}">${idx}</a>
				</li>
				</tr>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="/contents/placeList/${pageMaker.endPage + 1}">next</a></li>
			</c:if>
		</ul>
	</div>
	<div>
		<ul id="list"></ul>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script>
		$.getJSON("/contents/placeList", function(data) {
			var str = "";
			
			$(data).each(
					function() {
						str += "<li data-placeID='" + this.contentsID+"' class='resLi'>"
							+ this.contentsID +":" + this.title + "</li>";
					});
			
			$("#list").html(str);
		});
	</script>
</body>
</html>