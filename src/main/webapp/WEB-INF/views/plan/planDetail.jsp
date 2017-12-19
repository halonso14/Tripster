<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery.min.js"></script>
<script>

	
     $(document).ready(function() {
    		 var formObj = $("form[role='form']")
        		$("#modify").click(function(){
        			alert('클릭했당 ');
        			formObj.attr("action","/plan/planModifyForm");
        			formObj.attr("method","GET");
        			formObj.submit();
        		});
    		 
    		 
    		 	$("#remove").click(function(){
    		 		formObj.attr("action","/plan/delete");
    		 		formObj.submit();
    		 	})
    		
/*     		 $.each(${plan.planDetailVO }, function(index, item){
    			 var result="";
    			 result += index +': ' + item.planDetailID +','+ item.title;
    			 console.log(result);
    		 }); */
      });
</script>
</head>
<body>
	<h2>planDetail</h2>
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="planID" value="${plan.planID }">
		${plan.planID }
		<%-- ${plan.planDetailVO.get(0).planDetailEndTime} --%>
		<c:forEach items ="${plan.planDetailVO }" var="planDetailVO">
			${planDetailVO.title }
		</c:forEach>
		
		<hr>
		
		<button id="remove">REMOVE</button>
		<button id="modify">MODIFY</button>
	</form>
</body>
</html>