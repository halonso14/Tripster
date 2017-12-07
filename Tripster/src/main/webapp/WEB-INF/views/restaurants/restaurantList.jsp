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
			<th>restaurantID</th>
			<th>title</th>
			<th>location</th>
			<th>rating</th>
			<th>time</th>
			<th>contents</th>
			<th>tel</th>
			<th>codeID</th>
		</tr>
		<c:forEach items="${list}" var="restaurantVO">
			<tr>
				<td><a href="/restaurants/restaurantDetail?restaurantID=${restaurantVO.restaurantID}">${restaurantVO.restaurantID}</a></td>
				<td>${restaurantVO.title}</td>
				<td>${restaurantVO.location}</td>
				<td>${restaurantVO.rating}</td>
				<td>${restaurantVO.time}</td>
				<td>${restaurantVO.contents}</td>
				<td>${restaurantVO.tel}</td>
				<td>${restaurantVO.codeID}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a href="/restaurants/restaurantList?curPage=${pageMaker.startPage - 1}">prev</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li
					<c:out value="${pageMaker.cri.curPage == idx?'class = active':''}"/>>
					<a href="/restaurants/restaurantList?curPage=${idx}">${idx}</a>
				</li>
				</tr>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="/restaurants/restaurantList?curPage=${pageMaker.endPage + 1}">next</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>