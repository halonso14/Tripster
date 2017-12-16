<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
	<title>title</title>
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
				<td><a href='/contents/restaurantDetail/${contentsVO.contentsID}'>${contentsVO.title}</a></td>
				<td>${contentsVO.location}</td>
				<td>${contentsVO.rating}</td>
				<td>${contentsVO.categoryID}</td>
				<td>${contentsVO.contentsViewCnt}</td>
				<td>${contentsVO.contentsReviewCnt}</td>
				<td>${contentsVO.contentsScrapCnt}</td>
			</tr>
		</c:forEach>
	</table>

<script src="/resources/js/jquery.min.js"></script>
<!-- 
<script>
	$(document).ready(function(){
		detail();

        $.ajax({
            type:'get',
            url:"/contents/restaurantDetail/"+contentsID,
            data : JSON.stringify({
                restaurantID : contentsID,
                restaurantTitle : contentsTitle
            }),
            success: function(result) {
                alert('success');
            }
        });
	};
</script>
 -->
</body>
</html>